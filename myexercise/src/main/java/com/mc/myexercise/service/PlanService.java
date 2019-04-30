package com.mc.myexercise.service;

import com.mc.myexercise.pojo.Plan;

import java.util.Date;

public interface PlanService {

    Integer addPlan(String content, Date start, Date end, Integer uid);

    Plan getLastPlan(Integer uid);

    Integer InitPlan(Integer uid);
}
