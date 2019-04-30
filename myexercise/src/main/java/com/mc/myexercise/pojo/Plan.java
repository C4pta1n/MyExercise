package com.mc.myexercise.pojo;

import lombok.*;

import java.util.Date;

@Setter@Getter@ToString
public class Plan {
    private Integer pid;
    private String planContent;
    private Date date;
    private Date start;
    private Date end;
    private BaseInfo baseInfo;
}
