package com.farm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
    @RequestMapping("loginPage")
    public String loginPage(){return "fore/login";}

    @RequestMapping("registPage")
    public String registPage(){return "fore/regist";}

    @RequestMapping("foreUserInfoPage")
    public String userInfoPage(){return "fore/userInfo";}

}
