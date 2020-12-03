package com.farm.controller;

import com.farm.pojo.Page;
import com.farm.pojo.User;
import com.farm.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("admin_user_list")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<User> us= userService.list();
        int total = (int) new PageInfo<>(us).getTotal();
        page.setTotal(total);
        model.addAttribute("us", us);
        model.addAttribute("page", page);
        return "admin/listUser";
    }

    @RequestMapping("admin_user_add")
    public String add(User user){
        userService.regist(user);
        return "redirect:admin_user_list";
    }

    @RequestMapping("admin_user_edit")
    public String edit(int id,Model model){
       User user=userService.getUser(id);
       model.addAttribute("u",user);
        return "admin/editUser";
    }

    @RequestMapping("admin_user_update")
    public String update(User user){
       userService.update(user);
        return "redirect:admin_user_list";
    }

    @RequestMapping("admin_user_delete")
    public String delete(int id){
       userService.delete(id);
        return "redirect:admin_user_list";
    }

    @RequestMapping("updateUser")
    public String updateUser(User user, Model model, HttpSession session){
        userService.update(user);
        session.setAttribute("user",user);
        return "fore/userInfo";
    }
}
