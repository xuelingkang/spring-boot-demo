package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.ftp.SftpHelper;
import com.example.mapper.AttachmentMapper;
import com.example.model.po.Attachment;
import com.example.service.IAttachmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

@Service
public class AttachmentService extends BaseService<AttachmentMapper, Attachment> implements IAttachmentService {

    @Value("${attachment.file-separator}")
    private String fileSeparator;
    @Autowired
    private SftpHelper sftpHelper;

    @Override
    @Cacheable(cacheNames = "attachment:multiple", keyGenerator = "defaultPageKeyGenerator")
    public IPage<Attachment> page(IPage<Attachment> page, Wrapper<Attachment> queryWrapper) {
        return super.page(page, queryWrapper);
    }

    @Override
    @Cacheable(cacheNames = "attachment:single", key = "'attachment:'+#id", unless = "#result==null")
    public Attachment getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    @Transactional
    @Caching(
            evict = {
                    @CacheEvict(cacheNames = {"attachment:multiple"}, allEntries = true),
                    @CacheEvict(cacheNames = {"attachment:single"}, key = "'attachment:'+#id")
            }
    )
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }

    @Override
    @Transactional
    public void customRemoveById(Integer id) {
        Attachment attachment = baseMapper.selectById(id);
        baseMapper.deleteById(id);
        String path = attachment.getAttachmentPath();
        String dir = path.substring(0, path.lastIndexOf(fileSeparator));
        String name = path.substring(path.lastIndexOf(fileSeparator)+1);
        sftpHelper.delete(dir, name);
    }

}
