package com.mc.myexercise.service;

import com.mc.myexercise.pojo.Agreement;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AgreementService {

    Agreement getLastAgreement();

    List<Agreement> getAllAgreements();
}
