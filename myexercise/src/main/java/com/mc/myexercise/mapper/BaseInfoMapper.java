package com.mc.myexercise.mapper;

import com.mc.myexercise.pojo.BaseInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.Date;

public interface BaseInfoMapper {

    @Select("select icon from user_baseinfo where aid = #{aid}")
    String getIcon(Integer aid);

    @Update("update user_baseinfo set icon = #{iconPath} where aid = #{aid}")
    Integer updateIcon(@Param("iconPath") String iconPath,@Param("aid") Integer aid);

    @Select("select * from user_baseinfo where aid = #{aid}")
    @Results({
            @Result(id = true,column = "uid", property = "uid"),
            @Result(column = "name",property = "name"),
            @Result(column = "sex", property = "sex"),
            @Result(column = "birth",property = "birth"),
            @Result(column = "icon",property = "icon"),
            @Result(column = "aid",property = "account",one = @One(select = "com.mc.myexercise.mapper.AccountMapper.getAccountById",fetchType = FetchType.EAGER))
    })
    BaseInfo getBaseInfoByAid(Integer aid);

    @Select("select * from user_baseinfo where uid = #{uid}")
    @Results({
            @Result(id = true,column = "uid", property = "uid"),
            @Result(column = "name",property = "name"),
            @Result(column = "sex", property = "sex"),
            @Result(column = "birth",property = "birth"),
            @Result(column = "icon",property = "icon"),
            @Result(column = "aid",property = "account",one = @One(select = "com.mc.myexercise.mapper.AccountMapper.getAccountById",fetchType = FetchType.EAGER))
    })
    BaseInfo getBaseInfoByUid(Integer uid);

    @Update("update user_baseinfo set name = #{name},sex = #{sex},birth = #{birth} where aid = #{aid}")
    Integer updateBaseInfo(@Param("name") String name, @Param("sex") Integer sex, @Param("birth") Date birth, @Param("aid") Integer aid);

    @Insert("insert into user_baseinfo (aid) value (#{aid})")
    Integer addUser(Integer aid);
}
