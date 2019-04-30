package com.mc.myexercise.service;

import com.mc.myexercise.pojo.Account;

public interface AccountService {

    Account verifyAccount(String username,String password);

    Account verifyUsername(String username);

    Account verifyTel(String tel);

    Account verifyEmail(String email);

    Integer signup(Account account);

    boolean changePSW(String password, Integer aid);
}
