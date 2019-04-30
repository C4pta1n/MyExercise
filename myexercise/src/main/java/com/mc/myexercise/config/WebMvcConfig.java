package com.mc.myexercise.config;

import com.mc.myexercise.Interceptor.AuthorizationInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthorizationInterceptor()).addPathPatterns("/**").excludePathPatterns("/signin", "/signup","/doSignup", "/kaptcha/*", "/getLastAgreement", "/ifSignin", "doSignup", "/css/**","/images/**","/js/**","/layui/**");
    }
}

