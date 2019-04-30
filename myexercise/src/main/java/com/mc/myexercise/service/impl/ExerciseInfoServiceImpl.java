package com.mc.myexercise.service.impl;

import com.mc.myexercise.mapper.ExerciseInfoMapper;
import com.mc.myexercise.pojo.ExerciseInfo;
import com.mc.myexercise.pojo.PageBean;
import com.mc.myexercise.service.ExerciseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ExerciseInfoServiceImpl implements ExerciseInfoService {

    @Autowired
    ExerciseInfoMapper exerciseInfoMapper;

    private static Integer pageCount = 10;

    @Override
    public ExerciseInfo getExerciseInfo(Integer uid) {
        return exerciseInfoMapper.getLastExerciseInfoByUid(uid);
    }

    @Override
    public Integer AddExerciseInfo(Double height, Double weight, Integer uid) {
        Date date = new Date();
        return exerciseInfoMapper.addExerciseInfo(height,weight,date,uid);
    }

    @Override
    public Integer addExerciseInfo(ExerciseInfo exerciseInfo) {
        return exerciseInfoMapper.addExerciseInfoAll(exerciseInfo);
    }

    @Override
    public Integer getTotalPage(Integer uid) {
        return (int) Math.ceil(1.0*exerciseInfoMapper.getCount(uid)/pageCount);
    }


    @Override
    public PageBean<ExerciseInfo> getPageBean(Integer currentPage, Integer uid) {
        PageBean<ExerciseInfo> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setTotalCount(exerciseInfoMapper.getCount(uid));
        pageBean.setTotalPage((int) Math.ceil(1.0*exerciseInfoMapper.getCount(uid)/pageCount));
        Integer index = (currentPage-1)*pageCount;
        pageBean.setList(exerciseInfoMapper.getLastExercisePage(uid,index,pageCount));
        return pageBean;
    }

    @Override
    public List<ExerciseInfo> getExerciseList(Integer uid) {
        return exerciseInfoMapper.getLastExercisePage(uid,0,7);
    }

    @Override
    public Integer getDateSum(Integer uid) {
        return exerciseInfoMapper.getCount(uid);
    }

    @Override
    public Integer getTimeSum(Integer uid) {
        return exerciseInfoMapper.getStimeSum(uid);
    }

    @Override
    public Integer getOutSum(Integer uid) {
        return exerciseInfoMapper.getCoutSum(uid);
    }


}
