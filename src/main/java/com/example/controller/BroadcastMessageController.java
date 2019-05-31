package com.example.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.group.Insert;
import com.example.model.po.BroadcastMessage;
import com.example.model.po.BroadcastToUserLink;
import com.example.model.po.User;
import com.example.model.vo.BroadcastMessageVO;
import com.example.model.vo.ResultVO;
import com.example.model.vo.UserVO;
import com.example.params.Params;
import com.example.service.IBroadcastMessageService;
import com.example.service.IBroadcastToUserLinkService;
import com.example.util.GenericMessageBuilder;
import com.example.util.ModelUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.support.GenericMessage;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

import static com.example.model.vo.ResultVO.SUCCESS;

@RestController
@RequestMapping(value = "/broadcast", produces = "application/json; charset=UTF-8")
@Api(tags = "广播")
@Validated
public class BroadcastMessageController {

    @Value("${websocket.destination.broadcast}")
    private String broadcast;
    @Autowired
    private IBroadcastMessageService broadcastMessageService;
    @Autowired
    private IBroadcastToUserLinkService broadcastToUserLinkService;
    @Autowired
    private SimpMessagingTemplate template;

    @GetMapping("/{current}/{size}")
    @ApiOperation(value = "查询广播列表")
    public ResultVO findPage(@PathVariable @NotNull(message = "当前页不能为空") @ApiParam(value = "当前页", defaultValue = "1", required = true) long current,
                         @PathVariable @NotNull(message = "每页显示条数不能为空") @ApiParam(value = "每页显示条数", defaultValue = "10", required = true) long size,
                         BroadcastMessageVO broadcastMessageVO) {
        Page<BroadcastMessage> page = new Page<>(current, size);
        Params<BroadcastMessage> params = new Params<>(broadcastMessageVO);
        IPage<BroadcastMessage> iPage = broadcastMessageService.customPage(page, params);
        IPage messages = (IPage) ModelUtil.copy(iPage,
                new ModelUtil.Mapping(BroadcastMessage.class, BroadcastMessageVO.class),
                new ModelUtil.Mapping(User.class, UserVO.class, "password"));
        return new ResultVO<>(SUCCESS, "", messages);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id查询广播")
    public ResultVO<BroadcastMessageVO> findById(@PathVariable @NotNull(message = "广播id不能为空") @ApiParam(value = "广播id", required = true) Integer id) {
        BroadcastMessage broadcastMessage = broadcastMessageService.customGetById(id);
        BroadcastMessageVO broadcastMessageVO = (BroadcastMessageVO) ModelUtil.copy(broadcastMessage,
                new ModelUtil.Mapping(BroadcastMessage.class, BroadcastMessageVO.class),
                new ModelUtil.Mapping(User.class, UserVO.class, "password"));
        return new ResultVO<>(SUCCESS, "", broadcastMessageVO);
    }

    @DeleteMapping("/{ids}")
    @ApiOperation(value = "删除广播")
    public ResultVO delete(
            @PathVariable
            @NotNull(message = "广播id不能为空")
            @NotEmpty(message = "广播id不能为空")
            @ApiParam(value = "广播id，多个用逗号分隔", required = true) List<Integer> ids) {
        broadcastMessageService.removeByIds(ids);
        return new ResultVO<>(SUCCESS, "删除广播成功！", null);
    }

    @PostMapping
    @ApiOperation(value = "发送广播")
    public ResultVO save(@Validated({Insert.class}) BroadcastMessageVO broadcastMessageVO) {
        BroadcastMessage broadcastMessage = (BroadcastMessage) ModelUtil.copy(broadcastMessageVO,
                new ModelUtil.Mapping(BroadcastMessageVO.class, BroadcastMessage.class));

        broadcastMessageService.customSave(broadcastMessage);

        GenericMessage message = new GenericMessageBuilder()
                .payload(ModelUtil.copy(broadcastMessage,
                        new ModelUtil.Mapping(BroadcastMessage.class, BroadcastMessageVO.class),
                        new ModelUtil.Mapping(User.class, UserVO.class, "password", "roles")))
                .destination(broadcast)
                .leaveMutable(true)
                .build();
        template.send(message);
        return new ResultVO<>(SUCCESS, "广播成功！", null);
    }

    @PutMapping("/{id}")
    @ApiOperation(value = "更新消息状态为已读")
    public ResultVO read(@PathVariable @NotNull(message = "广播id不能为空") Integer id) {
        User currentUser = broadcastMessageService.currentUser();
        BroadcastToUserLink link = new BroadcastToUserLink(id, currentUser.getId(), IBroadcastMessageService.READ);
        broadcastToUserLinkService.customUpdateById(link);
        return new ResultVO<>(SUCCESS, "更新消息状态成功！", null);
    }

}
