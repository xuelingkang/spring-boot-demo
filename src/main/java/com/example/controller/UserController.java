package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.group.UserInsert;
import com.example.group.UserUpdate;
import com.example.model.po.Dept;
import com.example.model.po.Resource;
import com.example.model.po.Role;
import com.example.model.po.User;
import com.example.model.vo.*;
import com.example.service.IUserService;
import com.example.util.ModelUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

import static com.example.model.vo.ResultVO.SUCCESS;

@RestController
@RequestMapping(value = "/user", produces="application/json; charset=UTF-8")
@Api(tags="用户")
@Validated
public class UserController implements IBaseController<UserVO> {

    @Autowired
    private IUserService userService;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/{current}/{size}")
    @ApiOperation(value = "查询用户列表")
    public ResultVO list(@PathVariable @NotNull(message = "当前页不能为空") @ApiParam(value = "当前页", defaultValue = "1", required = true) long current,
                         @PathVariable @NotNull(message = "每页显示条数不能为空") @ApiParam(value = "每页显示条数", defaultValue = "10", required = true) long size,
                         UserVO userVO) {
        Page<User> page = new Page<>(current, size);
        Wrapper<User> wrapper = new QueryWrapper<>(userVO);
        IPage<User> iPage = userService.page(page, wrapper);
        IPage users = (IPage) ModelUtil.copy(iPage, new ModelUtil.Mapping(User.class, UserVO.class, "password"));
        return new ResultVO<>(SUCCESS, "", users);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id查询用户")
    @Validated
    public ResultVO<UserVO> findById(@PathVariable @NotNull(message = "用户id不能为空") @ApiParam(value = "用户id", required = true) Integer id) {
        User user = userService.customGetById(id);
        UserVO userVO = (UserVO) ModelUtil.copy(user,
                new ModelUtil.Mapping(User.class, UserVO.class, "password"),
                new ModelUtil.Mapping(Dept.class, DeptVO.class),
                new ModelUtil.Mapping(Role.class, RoleVO.class),
                new ModelUtil.Mapping(Resource.class, ResourceVO.class));
        return new ResultVO<>(SUCCESS, "", userVO);
    }

    @PostMapping
    @ApiOperation(value = "保存用户")
    public ResultVO save(@Validated({UserInsert.class}) @RequestBody UserVO userVO) {
        User user = (User) ModelUtil.copy(userVO, new ModelUtil.Mapping(UserVO.class, User.class));
        String password = user.getPassword();
        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoder.encode(password));
        }
        userService.customSave(user);
        return new ResultVO<>(SUCCESS, "保存用户成功！", null);
    }

    @PutMapping
    @ApiOperation(value = "更新用户")
    public ResultVO update(@Validated({UserUpdate.class}) @RequestBody UserVO userVO) {
        User user = (User) ModelUtil.copy(userVO, new ModelUtil.Mapping(UserVO.class, User.class));
        String password = user.getPassword();
        if (!StringUtils.isEmpty(password)) {
            user.setPassword(passwordEncoder.encode(password));
        }
        userService.customUpdateById(user);
        return new ResultVO<>(SUCCESS, "更新用户成功！", null);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除用户")
    public ResultVO delete(@PathVariable @NotNull(message = "用户id不能为空") @ApiParam(value = "用户id", required = true) Integer id) {
        userService.removeById(id);
        return new ResultVO<>(SUCCESS, "删除用户成功！", null);
    }

}
