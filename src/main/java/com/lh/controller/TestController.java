package com.lh.controller;

import com.lh.po.User;
import com.lh.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by linghu on 17/02/07.
 */
@Controller
@RequestMapping("test")
public class TestController {

    @Autowired
    private IUserService userService;
    @RequestMapping("test")
    public String test() {
        return "/test";
    }

    @RequestMapping(value = "getStr", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String getStr(String str) {
        User user=new User();
        user.setName(str);
        userService.save(user);
        return "获取到了" + str;
    }
}
