package com.mc.myexercise.mapper;

import com.mc.myexercise.pojo.Plan;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.Date;

public interface PlanMapper {

    @Insert("insert into plan (planContent, date, start, end, uid) values(#{planContent},#{date},#{start},#{end},#{uid})")
    Integer addPlan(@Param("planContent") String planContent, @Param("date") Date date, @Param("start") Date start, @Param("end") Date end, @Param("uid") Integer uid);

    @Select("select * from plan where uid = #{uid} order by date desc limit 1")
    @Results({
            @Result(id = true, column = "pid", property = "pid"),
            @Result(column = "planContent", property = "planContent"),
            @Result(column = "date", property = "date"),
            @Result(column = "start", property = "start"),
            @Result(column = "end", property = "end"),
            @Result(column = "uid", property = "baseInfo", one = @One(select = "com.mc.myexercise.mapper.BaseInfoMapper.getBaseInfoByUid", fetchType = FetchType.EAGER))
    })
    Plan getLastPlanByUid(Integer uid);

    @Insert("insert into plan (date, uid) values(#{date},#{uid})")
    Integer InitPlan(@Param("date") Date date,@Param("uid") Integer uid);
}
