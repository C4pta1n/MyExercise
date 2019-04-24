package com.mc.myexercise.service.impl;

import com.mc.myexercise.mapper.AccountMapper;
import com.mc.myexercise.pojo.Account;
import com.mc.myexercise.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountMapper accountMapper;

    @Override
    public Account verifyAccount(String username,String password) {
        return accountMapper.getAccountByUandP(username,password);
    }

    @Override
    public Account verifyUsername(String username) {
        return accountMapper.getAccountByUsername(username);
    }

    @Override
    public Account verifyTel(String tel) {
        return accountMapper.getAccountByTel(tel);
    }

    @Override
    public Account verifyEmail(String email) {
        return accountMapper.getAccountByEmail(email);
    }

    @Override
    public Integer signup(Account account) {
        return accountMapper.addAccount(account);
    }
}
