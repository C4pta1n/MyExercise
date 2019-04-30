package com.mc.myexercise.pojo;

import lombok.*;

import java.util.Date;

@Getter@Setter@ToString
public class BaseInfo {
    private Integer uid;
    private String name;
    private Integer sex;
    private Date birth;
    private String icon;
    private Account account;
}
