package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.group.JobTemplateInsert;
import com.example.group.JobTemplateUpdate;
import com.example.model.po.JobTemplate;
import com.example.model.vo.JobTemplateVO;
import com.example.model.vo.ResultVO;
import com.example.service.IJobTemplateService;
import com.example.util.ModelUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;

import static com.example.model.vo.ResultVO.SUCCESS;

@RestController
@RequestMapping(value = "/jobTemplate", produces = "application/json; charset=UTF-8")
@Api(tags = "任务模板")
@Validated
public class JobTemplateController {

    @Autowired
    private IJobTemplateService jobTemplateService;

    @GetMapping("/{current}/{size}")
    @ApiOperation(value = "查询任务模板列表")
    public ResultVO findPage(@PathVariable @NotNull(message = "当前页不能为空") @ApiParam(value = "当前页", defaultValue = "1", required = true) long current,
                         @PathVariable @NotNull(message = "每页显示条数不能为空") @ApiParam(value = "每页显示条数", defaultValue = "10", required = true) long size,
                         JobTemplateVO jobTemplateVO) {
        Page<JobTemplate> page = new Page<>(current, size);
        Wrapper<JobTemplate> wrapper = new QueryWrapper<>(jobTemplateVO);
        IPage<JobTemplate> iPage = jobTemplateService.page(page, wrapper);
        IPage templates = (IPage) ModelUtil.copy(iPage, new ModelUtil.Mapping(JobTemplate.class, JobTemplateVO.class));
        return new ResultVO<>(SUCCESS, "", templates);
    }

    @GetMapping("/{id}")
    @ApiOperation(value = "根据id查询任务模板")
    public ResultVO<JobTemplateVO> findById(@PathVariable @NotNull(message = "任务模板id不能为空") @ApiParam(value = "任务模板id", required = true) Integer id) {
        JobTemplate jobTemplate = jobTemplateService.customGetById(id);
        JobTemplateVO jobTemplateVO = (JobTemplateVO) ModelUtil.copy(jobTemplate, new ModelUtil.Mapping(JobTemplate.class, JobTemplateVO.class));
        return new ResultVO<>(SUCCESS, "", jobTemplateVO);
    }

    @PostMapping
    @ApiOperation(value = "保存任务模板")
    public ResultVO save(@Validated({JobTemplateInsert.class}) @RequestBody JobTemplateVO jobTemplateVO) {
        JobTemplate jobTemplate = (JobTemplate) ModelUtil.copy(jobTemplateVO, new ModelUtil.Mapping(JobTemplateVO.class, JobTemplate.class));
        jobTemplateService.customSave(jobTemplate);
        return new ResultVO<>(SUCCESS, "保存任务模板成功！", null);
    }

    @PutMapping
    @ApiOperation(value = "更新任务模板")
    public ResultVO update(@Validated({JobTemplateUpdate.class}) @RequestBody JobTemplateVO jobTemplateVO) {
        JobTemplate jobTemplate = (JobTemplate) ModelUtil.copy(jobTemplateVO, new ModelUtil.Mapping(JobTemplateVO.class, JobTemplate.class));
        jobTemplateService.customUpdateById(jobTemplate);
        return new ResultVO<>(SUCCESS, "更新任务模板成功！", null);
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除任务模板")
    public ResultVO delete(@PathVariable @NotNull(message = "任务模板id不能为空") @ApiParam(value = "任务模板id", required = true) Integer id) {
        jobTemplateService.removeById(id);
        return new ResultVO<>(SUCCESS, "删除任务模板成功！", null);
    }

}
