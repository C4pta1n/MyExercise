package com.mc.myexercise.controller;

import com.mc.myexercise.pojo.Account;
import com.mc.myexercise.pojo.ExerciseInfo;
import com.mc.myexercise.pojo.PageBean;
import com.mc.myexercise.service.impl.AccountServiceImpl;
import com.mc.myexercise.service.impl.BaseInfoServiceImpl;
import com.mc.myexercise.service.impl.ExerciseInfoServiceImpl;
import com.mc.myexercise.service.impl.PlanServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class ExerciseController {
    @Autowired
    BaseInfoServiceImpl baseInfoService;
    @Autowired
    ExerciseInfoServiceImpl exerciseInfoService;
    @Autowired
    AccountServiceImpl accountService;
    @Autowired
    PlanServiceImpl planService;

    @RequestMapping("/index")
    public ModelAndView getIndex(ModelAndView modelAndView, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer aid = account.getAid();
        modelAndView.addObject("iconPath", baseInfoService.getIcon(aid));
        modelAndView.setViewName("/exercise/index");
        return modelAndView;
    }

    @RequestMapping("/welcome")
    public ModelAndView getWelcome(ModelAndView modelAndView, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer uid = baseInfoService.getBaseInfo(account.getAid()).getUid();
        modelAndView.addObject("historys",exerciseInfoService.getExerciseList(uid));
        modelAndView.addObject("sumd",exerciseInfoService.getDateSum(uid));
        modelAndView.addObject("sumo",exerciseInfoService.getOutSum(uid));
        modelAndView.addObject("sumt",exerciseInfoService.getTimeSum(uid));
        modelAndView.setViewName("/exercise/welcome");
        return modelAndView;
    }

    @RequestMapping("/plan")
    public ModelAndView getPlan(ModelAndView modelAndView, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer uid = baseInfoService.getBaseInfo(account.getAid()).getUid();
        modelAndView.addObject("plan", planService.getLastPlan(uid));
        modelAndView.setViewName("/exercise/plan");
        return modelAndView;
    }

    @RequestMapping("/exerciserecord")
    public String getEexRecord() {
        return "/exercise/exerciserecord";
    }

    @RequestMapping("/history")
    public ModelAndView getEatRecord(ModelAndView modelAndView, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer uid = baseInfoService.getBaseInfo(account.getAid()).getUid();
        modelAndView.addObject("page",exerciseInfoService.getTotalPage(uid));
        modelAndView.setViewName("/exercise/history");
        return modelAndView;
    }

    @RequestMapping("/userinfo")
    public ModelAndView getUserInfo(ModelAndView modelAndView, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer aid = account.getAid();
        System.out.println(baseInfoService.getBaseInfo(aid));
        System.out.println(exerciseInfoService.getExerciseInfo(baseInfoService.getBaseInfo(aid).getUid()));
        modelAndView.addObject("user", exerciseInfoService.getExerciseInfo(baseInfoService.getBaseInfo(aid).getUid()));
        modelAndView.setViewName("/exercise/userinfo");
        return modelAndView;
    }

    @RequestMapping("/changepsw")
    public String getChangePSW() {
        return "/exercise/changepsw";
    }

    @RequestMapping(value = "/changeInfo", method = RequestMethod.POST)
    @ResponseBody
    public Integer changeInfo(String name, Integer sex, Date birth, Double height, Double weight, HttpServletRequest httpServletRequest) {
//        System.out.println(name+"=="+sex+"=="+birth+"=="+height+"=="+weight);
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        baseInfoService.changeInfo(name, sex, birth, account.getAid());
        exerciseInfoService.AddExerciseInfo(height, weight, baseInfoService.getBaseInfo(account.getAid()).getUid());
        return 200;
    }

    @RequestMapping(value = "/doChangePSW", method = RequestMethod.POST)
    @ResponseBody
    public Integer changePSW(String passwordold, String password, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
//        System.out.println(passwordold+"==="+account.getPassword()+"=="+password);
        if (account.getPassword().equals(passwordold)) {
            if (password.equals(account.getPassword())) {
                return 202;
            } else {
                if (accountService.changePSW(password, account.getAid())) return 200;
                else return 400;
            }
        } else {
            return 201;
        }
    }

    @RequestMapping(value = "/addPlan", method = RequestMethod.GET)
    @ResponseBody
    public Integer addPlan(String planContent, Date start, Date end, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer uid = baseInfoService.getBaseInfo(account.getAid()).getUid();
        return planService.addPlan(planContent, start, end, uid);
    }

    @RequestMapping(value = "/addERecord", method = RequestMethod.GET)
    @ResponseBody
    public Integer addERecord(ExerciseInfo info, HttpServletRequest httpServletRequest) {
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        info.setBaseInfo(baseInfoService.getBaseInfo(account.getAid()));
//        System.out.println(info);
        return exerciseInfoService.addExerciseInfo(info);
    }

    @RequestMapping(value = "/getExerciseList",method = RequestMethod.GET)
    @ResponseBody
    public List<ExerciseInfo> getExerciseList(HttpServletRequest httpServletRequest,Integer currentPage){
        Account account = (Account) httpServletRequest.getSession().getAttribute("account");
        Integer uid = baseInfoService.getBaseInfo(account.getAid()).getUid();
        PageBean<ExerciseInfo> pageBean = exerciseInfoService.getPageBean(currentPage, uid);
//        System.out.println(pageBean.getList());
        return pageBean.getList();
    }
}
