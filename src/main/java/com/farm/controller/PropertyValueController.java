package com.farm.controller;

import com.farm.pojo.Product;
import com.farm.pojo.PropertyValue;
import com.farm.service.ProductService;
import com.farm.service.PropertyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PropertyValueController {
    @Autowired
    PropertyValueService propertyValueService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_propertyValue_edit")
    public String edit(Model model, int pid) {
        Product p = productService.get(pid);
        propertyValueService.init(p);
        List<PropertyValue> pvs = propertyValueService.list(p.getId());
        model.addAttribute("p", p);
        model.addAttribute("pvs", pvs);
        return "admin/editPropertyValue";
    }

    @RequestMapping("admin_propertyValue_update")
    @ResponseBody//将java对象通过转发器转化为json，返回到response里的body里面，字符串还是返回字符串,使用ajax访问时，return不是跳转页面，是返回给ajax的值，返回的类型有xml、html、script、JSON、jsonp、text
    public String update(PropertyValue pv) {
        propertyValueService.update(pv);
        return "success";
    }

    @RequestMapping("userBack_propertyValue_edit")
    public String editBack(Model model, int pid) {
        Product p = productService.get(pid);
        propertyValueService.init(p);
        List<PropertyValue> pvs = propertyValueService.list(p.getId());
        model.addAttribute("p", p);
        model.addAttribute("pvs", pvs);
        return "userBack/editPropertyValue";
    }

    @RequestMapping("userBack_propertyValue_update")
    @ResponseBody//将java对象通过转发器转化为json，返回到response里的body里面，字符串还是返回字符串,使用ajax访问时，return不是跳转页面，是返回给ajax的值，返回的类型有xml、html、script、JSON、jsonp、text
    public String updateBack(PropertyValue pv) {
        propertyValueService.update(pv);
        return "success";
    }

}
