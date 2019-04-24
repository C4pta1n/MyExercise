package com.mc.myexercise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExerciseController {
    @RequestMapping("/exercise")
    public String getIndexPage(HttpServletRequest httpServletRequest) {
        if (null != httpServletRequest.getSession().getAttribute("account")) return "/exercise/test";
        else return "/login/signin";
    }
}
