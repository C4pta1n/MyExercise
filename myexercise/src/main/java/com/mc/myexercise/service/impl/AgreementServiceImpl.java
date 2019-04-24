package com.mc.myexercise.service.impl;

import com.mc.myexercise.mapper.AgreementMapper;
import com.mc.myexercise.pojo.Agreement;
import com.mc.myexercise.service.AgreementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AgreementServiceImpl implements AgreementService {
    @Autowired
    AgreementMapper agreementMapper;

    @Override
    public Agreement getLastAgreement() {
        return agreementMapper.getLastAgreement();
    }

    @Override
    public List<Agreement> getAllAgreements() {
        return null;
    }
}
