package com.example.model.po;

import com.example.group.Insert;
import com.example.group.RoleInsert;
import com.example.group.RoleUpdate;
import com.example.group.Update;
import com.example.model.BaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

@Data
@ApiModel("资源")
public class Resource extends BaseModel {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty("资源id")
    @Null(groups = {Insert.class}, message = "资源id必须为空")
    @NotNull(groups = {Update.class, RoleInsert.class, RoleUpdate.class}, message = "资源id不能为空")
    private Integer id;
    @ApiModelProperty(value="资源类型", allowableValues = "http,websocket")
    @NotNull(groups = {Insert.class, Update.class}, message = "资源类型不能为空")
    @Null(groups = {RoleInsert.class, RoleUpdate.class}, message = "资源类型必须为空")
    private String resourceType;
    @ApiModelProperty("资源pattern")
    @Null(groups = {RoleInsert.class, RoleUpdate.class}, message = "资源pattern必须为空")
    private String resourcePattern;
    @ApiModelProperty(value="请求方法", allowableValues = "GET,POST,PUT,PATCH,DELETE,SUBSCRIBE,SEND")
    @Null(groups = {RoleInsert.class, RoleUpdate.class}, message = "请求方法必须为空")
    private String resourceMethod;
    @ApiModelProperty("资源描述")
    @NotNull(groups = {Insert.class, Update.class}, message = "资源描述不能为空")
    @Null(groups = {RoleInsert.class, RoleUpdate.class}, message = "资源描述必须为空")
    private String resourceDesc;

}
