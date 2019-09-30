package com.xzixi.demo.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xzixi.demo.exception.ProjectException;
import com.xzixi.demo.mapper.AttachmentMapper;
import com.xzixi.demo.model.po.Attachment;
import com.xzixi.demo.params.Params;
import com.xzixi.demo.service.IAttachmentService;
import com.xzixi.sftp.pool.Sftp;
import com.xzixi.sftp.pool.SftpPool;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class AttachmentService extends BaseService<AttachmentMapper, Attachment> implements IAttachmentService {

    @Value("${attachment.file-separator}")
    private String fileSeparator;
    @Autowired
    private SftpPool sftpPool;

    @Override
    @Cacheable(cacheNames = "attachment:multiple", keyGenerator = "defaultPageKeyGenerator")
    public IPage<Attachment> customPage(Page<Attachment> page, Params<Attachment> params) {
        return page.setRecords(baseMapper.customSelectPage(page, params));
    }

    @Override
    @Cacheable(cacheNames = "attachment:single", key = "'attachment:'+#id", unless = "#result==null")
    public Attachment customGetById(Integer id) {
        return baseMapper.customSelectById(id);
    }

    @Override
    @CacheEvict(cacheNames = {"attachment:multiple"}, allEntries = true)
    public boolean save(Attachment entity) {
        return super.save(entity);
    }

    @Override
    @Transactional
    @Caching(
            evict = {
                    @CacheEvict(cacheNames = {"attachment:multiple"}, allEntries = true),
                    @CacheEvict(cacheNames = {"attachment:single"}, allEntries = true)
            }
    )
    public void customRemoveByIds(List<Integer> ids) {
        List<String[]> toDelete = new ArrayList<>();
        for (Integer id: ids) {
            Attachment attachment = baseMapper.selectById(id);
            baseMapper.deleteById(id);
            String path = attachment.getAttachmentPath();
            String dir = path.substring(0, path.lastIndexOf(fileSeparator));
            String name = path.substring(path.lastIndexOf(fileSeparator)+1);
            toDelete.add(new String[]{dir, name});
        }
        Sftp sftp;
        try {
            sftp = sftpPool.borrowObject();
        } catch (Exception e) {
            throw new ProjectException("获取sftp连接出错！", e);
        }
        try {
            for (String[] arr: toDelete) {
                try {
                    sftp.delete(arr[0], arr[1]);
                } catch (ProjectException e) {
                    log.error(e.getMessage(), e);
                }
            }
        } finally {
            if (sftp!=null) {
                sftpPool.returnObject(sftp);
            }
        }
    }

}
