package com.mc.myexercise.controller;

import com.mc.myexercise.pojo.Account;
import com.mc.myexercise.pojo.BaseInfo;
import com.mc.myexercise.pojo.ExerciseInfo;
import com.mc.myexercise.service.impl.AccountServiceImpl;
import com.mc.myexercise.service.impl.BaseInfoServiceImpl;
import com.mc.myexercise.service.impl.ExerciseInfoServiceImpl;
import com.mc.myexercise.service.impl.PlanServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class AccountController {
    @Autowired
    AccountServiceImpl accountService;

    @Autowired
    BaseInfoServiceImpl baseInfoService;
    @Autowired
    ExerciseInfoServiceImpl exerciseInfoService;
    @Autowired
    PlanServiceImpl planService;

    @RequestMapping("/signup")
    public String goSignInPage() {
        return "login/signup";
    }

    @RequestMapping("/signin")
    public String goToLoginPage() {
        return "login/signin";
    }

    @RequestMapping(value = "/ifSignin", method = RequestMethod.POST)
    @ResponseBody
    public Integer verifyLogin(String username, String password, HttpServletRequest httpServletRequest) {
//        System.out.println(username+"===="+password+"+==="+verify+"==="+code);
        Account account = accountService.verifyAccount(username, password);
//            System.out.println(account);
        if (null != account) {
            httpServletRequest.getSession().setAttribute("account", account);
            return 100;
        } else {
            return 101;
        }
    }

    @RequestMapping(value = "/doSignup", method = RequestMethod.POST)
    @ResponseBody
    public Integer ifSignup(Account account, HttpServletRequest httpServletRequest) {
//        System.out.println(account);
        if (null != accountService.verifyUsername(account.getUsername())) return 101;
        else if (null != accountService.verifyTel(account.getTel())) return 102;
        else if (null != accountService.verifyEmail(account.getEmail())) return 103;
        else {
            if (accountService.signup(account) != 0) {
                httpServletRequest.getSession().setAttribute("account", account);
                baseInfoService.addUser(account.getAid());
                BaseInfo baseInfo = baseInfoService.getBaseInfo(account.getAid());
                ExerciseInfo exerciseInfo = new ExerciseInfo();
                exerciseInfo.setBaseInfo(baseInfo);
                exerciseInfo.setDate(new Date());
                exerciseInfoService.addExerciseInfo(exerciseInfo);
                planService.InitPlan(baseInfo.getUid());
                return 100;
            } else return 104;
        }

    }

    @RequestMapping("/signout")
    public String signout(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().removeAttribute("account");
        return "login/signin";
    }

}
