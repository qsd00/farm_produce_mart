package com.farm.controller;

import com.farm.pojo.FirstCategory;
import com.farm.pojo.Page;
import com.farm.pojo.Purchase;
import com.farm.pojo.User;
import com.farm.service.FirstCategoryService;
import com.farm.service.PurchaseService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class PurchaseController {
    @Autowired
    private PurchaseService purchaseService;
    @Autowired
    private FirstCategoryService firstCategoryService;

    @RequestMapping("list_purchase")
    public String listPurchase(HttpSession session, Model model,Page page){
        User user= (User) session.getAttribute("user");
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Purchase> ps=purchaseService.listByUid(user.getId());
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        List<FirstCategory> fs=firstCategoryService.list();
        model.addAttribute("ps",ps);
        model.addAttribute("fs",fs);
        return "fore/userPurchase";
    }

    @RequestMapping("add_purchase")
    public String addPurchase(Purchase purchase){
        purchase.setDate(new Date());
        purchaseService.add(purchase);
        return "redirect:list_purchase";
    }

    @RequestMapping("edit_purchase")
    public String editPurchase(int id ,Model model){
        Purchase p=purchaseService.get(id);
        model.addAttribute("p",p);
        return "fore/editPurchase";
    }

    @RequestMapping("update_Purchase")
    public String updatePurchase(Purchase purchase){
        purchaseService.update(purchase);
        return "redirect:list_purchase";
    }

    @RequestMapping("delete_Purchase")
    public String deletePurchase(int id){
        purchaseService.delete(id);
        return "redirect:list_purchase";
    }
}
