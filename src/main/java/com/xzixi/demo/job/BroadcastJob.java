package com.xzixi.demo.job;

import com.xzixi.demo.model.po.BroadcastMessage;
import com.xzixi.demo.model.po.User;
import com.xzixi.demo.params.Params;
import com.xzixi.demo.rabbitmq.WebsocketMessageSender;
import com.xzixi.demo.service.IBroadcastMessageService;
import com.xzixi.demo.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
public class BroadcastJob extends QuartzJobBean {

    @Autowired
    private IBroadcastMessageService broadcastMessageService;
    @Autowired
    private WebsocketMessageSender websocketMessageSender;
    @Autowired
    private IUserService userService;

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        log.info("----------broadcastJob开始了----------");
        JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
        String username = jobDataMap.getString("senduser");
        User sendUser = userService.customGetOne(new Params<>(new User().setUsername(username)));
        if (sendUser==null) {
            log.info("----------broadcastJob出错了，找不到用户："+username+"----------");
            return;
        }
        BroadcastMessage message = new BroadcastMessage();
        message.setSendUser(sendUser);
        message.setSendUserId(sendUser.getId());
        String content = jobDataMap.getString("content");
        content += "---------现在时间是：";
        content += new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
        content += "，react中后台定时向您问好！";
        message.setContent(content);
        List<User> list = userService.customList(new Params<>(new User()));
        message.setToUsers(list);
        broadcastMessageService.customSave(message);
        websocketMessageSender.sendBroadcast( message);
        log.info("----------broadcastJob结束了----------");
    }

}
