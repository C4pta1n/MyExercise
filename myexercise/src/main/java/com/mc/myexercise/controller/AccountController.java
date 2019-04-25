package com.mc.myexercise.controller;

import com.mc.myexercise.pojo.Account;
import com.mc.myexercise.service.impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AccountController {
    @Autowired
    AccountServiceImpl accountService;

    @RequestMapping("/signup")
    public String goSignInPage() {
        return "login/signup";
    }
    @RequestMapping("/signin")
    public String goToLoginPage() {
        return "login/signin";
    }
    @RequestMapping(value = "/ifSignin",method = RequestMethod.POST)
    @ResponseBody
    public Integer verifyLogin(String username, String password,String verify, HttpServletRequest httpServletRequest) {
        String code = (String) httpServletRequest.getSession().getAttribute("verifyCode");
//        System.out.println(username+"===="+password+"+==="+verify+"==="+code);
        if (verify.equals(code)) {
            Account account = accountService.verifyAccount(username,password);
//            System.out.println(account);
            if (null != account) {
                httpServletRequest.getSession().setAttribute("account",account);
                return 100;
            }else {
                return 101;
            }
        } else {
            return 102;
        }
    }

    @RequestMapping(value = "doSignup",method = RequestMethod.POST)
    @ResponseBody
    public Integer ifSignup(Account account,HttpServletRequest httpServletRequest) {
//        System.out.println(account);
        if (null != accountService.verifyUsername(account.getUsername())) return 101;
        else if (null != accountService.verifyTel(account.getTel())) return 102;
        else if (null != accountService.verifyEmail(account.getEmail())) return 103;
        else {
            if (accountService.signup(account)!=0) {
                httpServletRequest.getSession().setAttribute("account",account);
                return 100;
            } else return 104;
        }

    }

}
