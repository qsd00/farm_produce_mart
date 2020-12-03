package com.farm.controller;

import com.farm.pojo.Category;
import com.farm.pojo.Page;
import com.farm.pojo.Product;
import com.farm.pojo.User;
import com.farm.service.CategoryService;
import com.farm.service.ProductService;
import com.farm.service.PropertyValueService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ProductController {
      @Autowired
    ProductService productService;
      @Autowired
    CategoryService categoryService;
      @Autowired
    PropertyValueService propertyValueService;

    @RequestMapping("admin_product_add")//管理员增加产品
    public String add(Model model, Product p) {
        productService.add(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @RequestMapping("admin_product_delete")//管理员编辑产品
    public String delete(int id) {
        Product p = productService.get(id);
        propertyValueService.deleteByPdid(id);
        productService.delete(id);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_edit")//管理员编辑产品
    public String edit(Model model, int id) {
        Product p = productService.get(id);
        Category c = categoryService.get(p.getCid());
        model.addAttribute("c", c);
        model.addAttribute("p", p);
        return "admin/editProduct";
    }

    @RequestMapping("admin_product_update")//管理员修改产品
    public String update(Product p) {
        productService.update(p);
        return "redirect:admin_product_list?cid="+p.getCid();
    }

    @RequestMapping("admin_product_list")//管理员查询产品
    public String list(int cid, Model model, Page page) {
        Category c = categoryService.get(cid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> ps = productService.list(cid);
        productService.setFirstProductImage(ps);
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+c.getId());
        model.addAttribute("ps", ps);
        model.addAttribute("c", c);
        model.addAttribute("page", page);
        return "admin/listProduct";
    }

    @RequestMapping("userBack_product_add")//用户添加产品
    public String addBack(Model model, Product p) {
        productService.add(p);
        return "redirect:userBack_product_list?cid="+p.getCid();
    }

    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    @RequestMapping("userBack_product_delete")//用户删除产品
    public String deleteBack(int id) {
        Product p = productService.get(id);
        propertyValueService.deleteByPdid(id);
        productService.delete(id);
        return "redirect:user_product_list";
    }

    @RequestMapping("userBack_product_edit")//用户编辑产品
    public String editBack(Model model, int id) {
        Product p = productService.get(id);
        Category c = categoryService.get(p.getCid());
        model.addAttribute("c", c);
        model.addAttribute("p", p);
        return "userBack/editProduct";
    }

    @RequestMapping("userBack_product_update")//用户修改产品
    public String updateBack(Product p) {
        productService.update(p);
        return "redirect:user_product_list";
    }

    @RequestMapping("userBack_product_list")//用户根据产品分类和用户id查询产品
    public String listBack(int cid, Model model, Page page, HttpSession session) {
        User user= (User) session.getAttribute("user");
        Category c = categoryService.get(cid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> ps = productService.listByUser(cid,user.getId());
        productService.setFirstProductImage(ps);
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        page.setParam("&cid="+c.getId());
        model.addAttribute("ps", ps);
        model.addAttribute("c", c);
        model.addAttribute("page", page);
        return "userBack/listProduct";
    }

    @RequestMapping("user_product_list")//用户根据产品分类和用户id查询产品
    public String listByUid(Model model, Page page, HttpSession session) {
        User user= (User) session.getAttribute("user");
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Product> ps=productService.listByUid(user.getId());
        productService.setFirstProductImage(ps);
        int total = (int) new PageInfo<>(ps).getTotal();
        page.setTotal(total);
        model.addAttribute("ps", ps);
        model.addAttribute("page", page);
        return "userBack/listMyProduct";
    }


}
