package com.mc.myexercise.service.impl;

import com.mc.myexercise.mapper.PlanMapper;
import com.mc.myexercise.pojo.Plan;
import com.mc.myexercise.service.PlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class PlanServiceImpl implements PlanService {
    @Autowired
    PlanMapper planMapper;

    @Override
    public Integer addPlan(String content, Date start, Date end, Integer uid) {
        return planMapper.addPlan(content,new Date(), start, end, uid);
    }

    @Override
    public Plan getLastPlan(Integer uid) {
        return planMapper.getLastPlanByUid(uid);
    }

    @Override
    public Integer InitPlan(Integer uid) {
        return planMapper.InitPlan(new Date(),uid);
    }
}
