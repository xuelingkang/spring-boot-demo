package com.example.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.mapper.JobTemplateMapper;
import com.example.model.po.JobTemplate;
import com.example.model.po.JobTemplateParameter;
import com.example.service.IJobTemplateParameterService;
import com.example.service.IJobTemplateService;
import io.jsonwebtoken.lang.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class JobTemplateService extends BaseService<JobTemplateMapper, JobTemplate> implements IJobTemplateService {

    @Autowired
    private IJobTemplateParameterService jobTemplateParameterService;

    @Override
    public JobTemplate customGetById(Integer id) {
        return baseMapper.customSelectById(id);
    }

    @Override
    @Transactional
    public void customSave(JobTemplate jobTemplate) {
        baseMapper.insert(jobTemplate);
        Integer jobTemplateId = jobTemplate.getId();
        List<JobTemplateParameter> parameters = jobTemplate.getParameters();
        if (!Collections.isEmpty(parameters)) {
            for (JobTemplateParameter parameter: parameters) {
                parameter.setJobTemplateId(jobTemplateId);
            }
            jobTemplateParameterService.saveBatch(parameters);
        }
    }

    @Override
    @Transactional
    public void customUpdateById(JobTemplate jobTemplate) {
        baseMapper.updateById(jobTemplate);
        Integer jobTemplateId = jobTemplate.getId();
        List<JobTemplateParameter> parameters = jobTemplate.getParameters();
        if (Collections.isEmpty(parameters)) {
            parameters = new ArrayList<>();
        } else {
            for (JobTemplateParameter parameter: parameters) {
                parameter.setJobTemplateId(jobTemplateId);
            }
        }
        jobTemplateParameterService.merge(parameters, new QueryWrapper<JobTemplateParameter>().eq("job_template_id", jobTemplateId));
    }

}
