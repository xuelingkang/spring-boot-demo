package com.example.model.vo;

import com.example.model.po.User;
import io.swagger.annotations.ApiModel;
import lombok.Data;

@Data
@ApiModel("用户")
public class UserVO extends User {
}