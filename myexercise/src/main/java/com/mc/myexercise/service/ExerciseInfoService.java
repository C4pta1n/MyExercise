package com.mc.myexercise.service;

import com.mc.myexercise.pojo.ExerciseInfo;
import com.mc.myexercise.pojo.PageBean;

import java.util.List;

public interface ExerciseInfoService {

    ExerciseInfo getExerciseInfo(Integer uid);

    Integer AddExerciseInfo(Double height, Double weight ,Integer uid);

    Integer addExerciseInfo(ExerciseInfo exerciseInfo);

    Integer getTotalPage(Integer uid);

    PageBean<ExerciseInfo> getPageBean(Integer currentPage, Integer uid);

    List<ExerciseInfo> getExerciseList(Integer uid);

    Integer getDateSum(Integer uid);

    Integer getTimeSum(Integer uid);

    Integer getOutSum(Integer uid);
}
