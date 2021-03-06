package com.xzixi.demo.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.xzixi.demo.mapper.BroadcastMessageMapper;
import com.xzixi.demo.model.po.BroadcastMessage;
import com.xzixi.demo.model.po.BroadcastToUserLink;
import com.xzixi.demo.model.po.User;
import com.xzixi.demo.params.Params;
import com.xzixi.demo.service.IBroadcastMessageService;
import com.xzixi.demo.service.IBroadcastToUserLinkService;
import io.jsonwebtoken.lang.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class BroadcastMessageService extends BaseService<BroadcastMessageMapper, BroadcastMessage> implements IBroadcastMessageService {

    @Autowired
    private IBroadcastToUserLinkService broadcastToUserLinkService;

    @Override
    public IPage<BroadcastMessage> customPage(Page<BroadcastMessage> page, Params<BroadcastMessage> params) {
        return page.setRecords(baseMapper.customSelectPage(page, params));
    }

    @Override
    public List<BroadcastMessage> selfList(Params<BroadcastMessage> params) {
        return baseMapper.selectSelfList(params);
    }

    @Override
    public IPage<BroadcastMessage> selfPage(Page<BroadcastMessage> page, Params<BroadcastMessage> params) {
        return page.setRecords(baseMapper.selectSelfPage(page, params));
    }

    @Override
    public BroadcastMessage customGetById(Integer id) {
        return baseMapper.customSelectById(id);
    }

    @Override
    public BroadcastMessage getSelfById(Integer id, Params<BroadcastMessage> params) {
        return baseMapper.selectSelfById(id, params);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"summary:broadcast:month", "summary:broadcast:user"}, allEntries = true)
    public void customSave(BroadcastMessage broadcastMessage) {
        long now = System.currentTimeMillis();
        broadcastMessage.setSendTime(now);
        User currentUser = currentUser();
        if (currentUser!=null) {
            broadcastMessage.setSendUser(currentUser);
            broadcastMessage.setSendUserId(currentUser.getId());
        }
        baseMapper.insert(broadcastMessage);
        Integer broadcastId = broadcastMessage.getId();
        List<User> toUsers = broadcastMessage.getToUsers();
        List<BroadcastToUserLink> links = new ArrayList<>();
        if (!Collections.isEmpty(toUsers)) {
            for (User user: toUsers) {
                links.add(new BroadcastToUserLink(broadcastId, user.getId(), UNREAD));
            }
            broadcastToUserLinkService.saveBatch(links);
        }
    }

}
