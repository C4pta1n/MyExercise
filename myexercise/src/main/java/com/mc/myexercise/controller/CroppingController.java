package com.mc.myexercise.controller;

import com.mc.myexercise.pojo.Account;
import com.mc.myexercise.service.BaseInfoService;
import com.mc.myexercise.service.impl.BaseInfoServiceImpl;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

@RestController
@RequestMapping("/upload")
public class CroppingController {
    @Value("${upload-path}")
    private String path;
    @Autowired
    BaseInfoServiceImpl baseInfoService;

    @PostMapping("/icon")
    public Integer uploadIcon(@RequestParam("file") String file, HttpServletRequest httpServletRequest) {
        Base64.Decoder decoder = Base64.getDecoder();
        file = file.substring(22);
        byte[] imgByte = decoder.decode(file);

        String iconPath = path+"Icon";
        File dir = new File(iconPath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        String fileName = getFileName();
        iconPath = iconPath+"/"+fileName;
//        System.out.println(iconPath);

        try {
            FileOutputStream out = new FileOutputStream(iconPath);
            out.write(imgByte);
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String url = "Icon/" + fileName;
        //存进数据库
        Account account = (Account)httpServletRequest.getSession().getAttribute("account");
        if (baseInfoService.changeIcon(url,account.getAid())>0) {
            return 200;
        }else {
            return 500;
        }
    }

    private String getFileName(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timeStr = sdf.format(new Date());
        String str = RandomStringUtils.random(5,
                "abcdefghijklmnopqrstuvwxyz1234567890");
        String name = timeStr + str + ".jpg";
        return name;
    }
}
