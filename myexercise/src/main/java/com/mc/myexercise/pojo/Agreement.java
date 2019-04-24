package com.mc.myexercise.pojo;

import lombok.*;

import java.util.Date;

@Getter@Setter@ToString
public class Agreement {
    private Integer aid;
    private String content;
    private Date date;
}
