package com.farm.controller;

import com.farm.pojo.Category;
import com.farm.pojo.Page;
import com.farm.pojo.Property;
import com.farm.service.CategoryService;
import com.farm.service.PropertyService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
public class PropertyController {
       @Autowired
       private CategoryService categoryService;
       @Autowired
       private PropertyService propertyService;

       @RequestMapping("admin_property_list")
    public String list( int cid, Model model, Page page){
           Category c = categoryService.get(cid);
           PageHelper.offsetPage(page.getStart(),page.getCount());
           List<Property> ps = propertyService.list(cid);
           int total = (int) new PageInfo<>(ps).getTotal();
           page.setTotal(total);
           page.setParam("&cid="+c.getId());
           model.addAttribute("ps", ps);
           model.addAttribute("c", c);
           model.addAttribute("page", page);
           return "admin/listProperty";
       }

    @RequestMapping("admin_property_add")
    public String add(Property property,Model model)throws IOException {
           propertyService.add(property);
           return "redirect:/admin_property_list?cid="+property.getCid();
    }

    @RequestMapping("admin_property_delete")
    public String delete(int id)throws IOException {
        Property p=propertyService.get(id);//先拿后删
        propertyService.delete(id);
        return "redirect:/admin_property_list?cid="+p.getCid();
    }

    @RequestMapping("admin_property_edit")
    public String delete(int id,Model model)throws IOException {
        Property p=propertyService.get(id);
        Category c=categoryService.get(p.getCid());
        model.addAttribute("p",p);
        model.addAttribute("c",c);
        return "admin/editProperty";
    }

    @RequestMapping("admin_property_update")
    public String update(Property p)throws IOException {
        propertyService.update(p);
        return "redirect:/admin_property_list?cid="+p.getCid();
    }



}
