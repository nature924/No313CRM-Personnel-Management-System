package com.iarchie.crm_v1.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WelcomeController {

    @RequestMapping("/hello")
    public String welcome(){

        return "common/welcome";
    }

    //跳转到主页
    @RequestMapping("/index")
    public String index(){

        return "/main.jsp";
    }

}
