package com.mc.myexercise.pojo;

import lombok.*;

import java.util.Date;

@Getter@Setter@ToString
public class ExerciseInfo {
    private Integer eid;
    private Double height;
    private Double weight;
    private Date date;
    private double cin;
    private double cout;
    private String event;
    private String food;
    private Integer stime;
    private BaseInfo baseInfo;
}
