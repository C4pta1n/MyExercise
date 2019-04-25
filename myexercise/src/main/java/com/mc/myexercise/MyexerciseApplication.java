package com.mc.myexercise;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.mc.myexercise.mapper")
public class MyexerciseApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyexerciseApplication.class, args);
    }


}
