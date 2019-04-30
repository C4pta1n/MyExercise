package com.mc.myexercise.service;

import com.mc.myexercise.pojo.BaseInfo;

import java.util.Date;

public interface BaseInfoService {

    String getIcon(Integer aid);

    Integer changeIcon(String iconPath, Integer aid);

    BaseInfo getBaseInfo(Integer aid);

    Integer changeInfo(String name, Integer sex, Date birth, Integer uid);

    Integer addUser(Integer aid);
}
