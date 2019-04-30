package com.mc.myexercise.service.impl;

import com.mc.myexercise.mapper.BaseInfoMapper;
import com.mc.myexercise.pojo.BaseInfo;
import com.mc.myexercise.service.BaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class BaseInfoServiceImpl implements BaseInfoService {

    @Autowired
    BaseInfoMapper baseInfoMapper;

    @Override
    public String getIcon(Integer aid) {
        return baseInfoMapper.getIcon(aid);
    }

    @Override
    public Integer changeIcon(String iconPath, Integer aid) {
        return baseInfoMapper.updateIcon(iconPath, aid);
    }

    @Override
    public BaseInfo getBaseInfo(Integer aid) {
        return baseInfoMapper.getBaseInfoByAid(aid);
    }

    @Override
    public Integer changeInfo(String name, Integer sex, Date birth, Integer aid) {
        return baseInfoMapper.updateBaseInfo(name,sex,birth,aid);
    }

    @Override
    public Integer addUser(Integer aid) {
        return baseInfoMapper.addUser(aid);
    }


}
