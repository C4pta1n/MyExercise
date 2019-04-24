package com.mc.myexercise.mapper;

import com.mc.myexercise.pojo.Agreement;
import org.apache.ibatis.annotations.Select;

public interface AgreementMapper {

    @Select("select * from agreement order by date desc limit 1")
    Agreement getLastAgreement();
}
