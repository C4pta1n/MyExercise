package com.mc.myexercise.controller;

import com.mc.myexercise.pojo.Agreement;
import com.mc.myexercise.service.impl.AgreementServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AgreementController {
    @Autowired
    AgreementServiceImpl agreementService;

    @GetMapping("getLastAgreement")
    public Agreement getLastAgreement(){
        return agreementService.getLastAgreement();
    }
}
