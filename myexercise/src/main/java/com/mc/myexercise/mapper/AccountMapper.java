package com.mc.myexercise.mapper;

import com.mc.myexercise.pojo.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface AccountMapper {

    @Select("select * from account where username = #{username} and password = #{password}")
    Account getAccountByUandP(@Param("username") String username,@Param("password") String password);

    @Select("select * from account where username = #{username}")
    Account getAccountByUsername(String username);

    @Select("select * from account where tel = #{tel}")
    Account getAccountByTel(String tel);

    @Select("select * from account where username = #{email}")
    Account getAccountByEmail(String email);

    @Insert("insert into account (username, password, tel, email) values (#{username}, #{password}, #{tel}, #{email})")
    @Options(useGeneratedKeys = true,keyProperty = "aid",keyColumn = "aid")
    Integer addAccount(Account account);

}
