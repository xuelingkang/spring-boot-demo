package com.xzixi.demo.model.po;

import com.alibaba.fastjson.annotation.JSONField;
import com.baomidou.mybatisplus.annotation.TableField;
import com.xzixi.demo.group.JobInsert;
import com.xzixi.demo.group.JobUpdate;
import com.xzixi.demo.model.BaseModel;
import com.xzixi.swagger2.plus.annotation.IgnoreSwagger2Parameter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.util.List;

// 只实现cron触发器
@Data
@ApiModel(value = "定时任务")
public class Job extends BaseModel {

    private static final long serialVersionUID = 1L;
    @ApiModelProperty(value = "任务id")
    @Null(groups = {JobInsert.class}, message = "任务id必须为空")
    @NotNull(groups = {JobUpdate.class}, message = "任务id不能为空")
    private Integer id;
    @ApiModelProperty(value = "任务描述")
    @NotNull(groups = {JobInsert.class, JobUpdate.class}, message = "任务描述不能为空")
    private String jobDesc;
    @ApiModelProperty(value = "开始时间")
    @NotNull(groups = {JobInsert.class, JobUpdate.class}, message = "开始时间不能为空")
    private Long startTime;
    @ApiModelProperty(value = "结束时间")
    private Long endTime;
    @ApiModelProperty(value = "cron表达式")
    @NotNull(groups = {JobInsert.class, JobUpdate.class}, message = "cron表达式不能为空")
    private String cronExpression;
    @ApiModelProperty(value = "任务模板id")
    @NotNull(groups = {JobInsert.class, JobUpdate.class}, message = "任务模板id不能为空")
    private Integer jobTemplateId;
    @ApiModelProperty(value = "调度器名称", hidden = true)
    @IgnoreSwagger2Parameter
    @JSONField(serialize = false)
    private String schedName;
    @ApiModelProperty(value = "任务名称", hidden = true)
    @IgnoreSwagger2Parameter
    @JSONField(serialize = false)
    private String jobName;
    @ApiModelProperty(value = "任务组", hidden = true)
    @IgnoreSwagger2Parameter
    @JSONField(serialize = false)
    private String jobGroup;
    @ApiModelProperty(value = "触发器名称", hidden = true)
    @IgnoreSwagger2Parameter
    @JSONField(serialize = false)
    private String triggerName;
    @ApiModelProperty(value = "触发器组", hidden = true)
    @IgnoreSwagger2Parameter
    @JSONField(serialize = false)
    private String triggerGroup;

    @TableField(exist = false)
    @ApiModelProperty(value = "触发器状态")
    @IgnoreSwagger2Parameter
    private String triggerState;
    @TableField(exist = false)
    @ApiModelProperty(value = "下次触发时间")
    @IgnoreSwagger2Parameter
    private Long nextTime;
    @TableField(exist = false)
    @ApiModelProperty(value = "上次触发时间")
    @IgnoreSwagger2Parameter
    private Long prevTime;
    @TableField(exist = false)
    @ApiModelProperty(value = "任务模板")
    @IgnoreSwagger2Parameter
    private JobTemplate jobTemplate;
    @TableField(exist = false)
    @ApiModelProperty(value = "任务参数")
    @IgnoreSwagger2Parameter
    @Valid
    private List<JobParameter> parameters;

}
