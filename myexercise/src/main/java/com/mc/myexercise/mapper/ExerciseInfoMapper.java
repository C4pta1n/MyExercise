package com.mc.myexercise.mapper;

import com.mc.myexercise.pojo.ExerciseInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.Date;
import java.util.List;

public interface ExerciseInfoMapper {

    @Select("select * from exerciseinfo where uid = #{uid} order by date desc limit 1")
    @Results({
            @Result(id = true,column = "eid",property = "eid"),
            @Result(column = "height", property = "height"),
            @Result(column = "weight", property = "weight"),
            @Result(column = "date", property = "date"),
            @Result(column = "cin", property = "cin"),
            @Result(column = "cout", property = "cout"),
            @Result(column = "event", property = "event"),
            @Result(column = "food", property = "food"),
            @Result(column = "stime", property = "stime"),
            @Result(column = "uid", property = "baseInfo",one = @One(select = "com.mc.myexercise.mapper.BaseInfoMapper.getBaseInfoByUid",fetchType = FetchType.EAGER))
    })
    ExerciseInfo getLastExerciseInfoByUid(Integer uid);

    @Insert("insert into exerciseinfo (height, weight, date, uid) values(#{height}, #{weight}, #{date}, #{uid})")
    Integer addExerciseInfo(@Param("height") Double height, @Param("weight") Double weight, @Param("date")Date date, @Param("uid") Integer uid);

    @Insert("insert into exerciseinfo (height, weight,cin,cout, date,event,food,stime, uid) values(#{height}, #{weight},#{cin},#{cout},#{date},#{event},#{food},#{stime}, #{baseInfo.uid})")
    Integer addExerciseInfoAll(ExerciseInfo exerciseInfo);

    @Select("select count(*) from exerciseinfo where uid = #{uid}")
    Integer getCount(Integer uid);

    @Select("select * from exerciseinfo where uid = #{uid} order by date desc limit #{index},#{pageCount}")
    @Results({
            @Result(id = true,column = "eid",property = "eid"),
            @Result(column = "height", property = "height"),
            @Result(column = "weight", property = "weight"),
            @Result(column = "date", property = "date"),
            @Result(column = "cin", property = "cin"),
            @Result(column = "cout", property = "cout"),
            @Result(column = "event", property = "event"),
            @Result(column = "food", property = "food"),
            @Result(column = "stime", property = "stime"),
            @Result(column = "uid", property = "baseInfo",one = @One(select = "com.mc.myexercise.mapper.BaseInfoMapper.getBaseInfoByUid",fetchType = FetchType.EAGER))
    })
    List<ExerciseInfo> getLastExercisePage(@Param("uid") Integer uid, @Param("index") Integer index, @Param("pageCount") Integer pageCount);

    @Select("select sum(stime) from exerciseinfo where uid = #{uid}")
    Integer getStimeSum(Integer uid);

    @Select("select sum(cout) from exerciseinfo where uid = #{uid}")
    Integer getCoutSum(Integer uid);

}
