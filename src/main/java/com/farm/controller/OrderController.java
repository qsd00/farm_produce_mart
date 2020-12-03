package com.farm.controller;

import com.farm.pojo.*;
import com.farm.service.OrderItemService;
import com.farm.service.OrderService;
import com.farm.service.OutOrderService;
import com.farm.service.ProductService;
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
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
@Controller
public class OrderController {

    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    OutOrderService outOrderService;
    @Autowired
    ProductService productService;

    @RequestMapping("admin_order_list")//管理员查询所有买家订单
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Order> os= orderService.list();
        int total = (int) new PageInfo<>(os).getTotal();
        page.setTotal(total);
        orderItemService.fill(os);
        model.addAttribute("os", os);
        model.addAttribute("page", page);
        return "admin/listOrder";
    }

    @RequestMapping("admin_order_listAll")//查询所有卖家订单
    public String listByAll(Model model, Page page, HttpSession session){
        User user= (User) session.getAttribute("user");
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<OutOrder> ots= outOrderService.list();
        int total = (int) new PageInfo<>(ots).getTotal();
        page.setTotal(total);
        orderItemService.fillOfOut(ots);
        for (OutOrder o:ots){//如果订单发货时间超过15天，则修改订单状态为待收款
            long now=new Date().getTime();
            if (o.getDeliveryDate()!=null){
                long date=o.getDeliveryDate().getTime();
                long time=1000*60*60*24*15;
                if (now-date>time){
                    o.setStatus("waitPaid");
                    outOrderService.update(o);
                }
            }
        }
        model.addAttribute("os", ots);
        model.addAttribute("page", page);
        System.out.println(ots.get(0));
        return "admin/listOutOrder";
    }

    @RequestMapping("out_order_list")//根据卖家id查询卖家订单
    public String listByUser(Model model, Page page, HttpSession session){
        User user= (User) session.getAttribute("user");
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<OutOrder> ots= outOrderService.list(user.getId());
        int total = (int) new PageInfo<>(ots).getTotal();
        page.setTotal(total);
        orderItemService.fillOfOut(ots);
        model.addAttribute("os", ots);
        model.addAttribute("page", page);
        return "userBack/listOrder";
    }

    @RequestMapping("out_order_listByStatus")//根据卖家订单状态查询订单
    public String listByUserStatus(Model model,String status, Page page, HttpSession session){
        User user= (User) session.getAttribute("user");
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<OutOrder> ots= outOrderService.listBySid(user.getId(),status);
        int total = (int) new PageInfo<>(ots).getTotal();
        page.setTotal(total);
        orderItemService.fillOfOut(ots);
        model.addAttribute("os", ots);
        model.addAttribute("page", page);
        return "userBack/listOrder";
    }

    @RequestMapping("out_order_delivery")//卖家发货，修改卖家订单状态和买家订单状态,修改产品库存
    public String deliveryByUser(int id) throws IOException {
        OutOrder ot=outOrderService.get(id);
        orderItemService.fillOfOut(ot);//填充订单项，填充订单项产品
        for (OrderItem oi:ot.getOrderItems()){//更新产品库存
            Product p=oi.getProduct();
          p.setStock(p.getStock()-oi.getNumber());
          productService.update(p);
        }
        ot.setDeliveryDate(new Date());
        ot.setStatus(OutOrderService.waitConfirm);
        outOrderService.update(ot);//更新商户订单
        List<OutOrder> ots=outOrderService.getByOid(ot.getOid());
        int count=outOrderService.getCount(ots);
        if (count==ots.size()){//只有当所有商家都发货后才更新用户订单状态
            Order o=orderService.get(ot.getOid());
            o.setDeliveryDate(new Date());
            o.setStatus(OrderService.waitConfirm);
            orderService.update(o);
        }

        return "redirect:out_order_list";
    }
}
