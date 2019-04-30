package com.mc.myexercise.pojo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@Getter@Setter@ToString
public class PageBean<T> {
    //当前页
    private Integer currentPage;
    //总页数
    private Integer totalPage;
    //总数量
    private Integer totalCount;
    //当前页内容
    private List<T> list = new ArrayList<>();

}

