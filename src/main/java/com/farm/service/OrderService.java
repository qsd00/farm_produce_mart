package com.farm.service;

import com.farm.pojo.Order;
import com.farm.pojo.OrderItem;

import java.util.List;

public interface OrderService {
    String waitPay = "waitPay";//创建订单时的状态
    String waitDelivery = "waitDelivery";//付钱后的状态
    String waitConfirm = "waitConfirm";//发货后的状态
    String waitReview = "waitReview";//收到货后的状态
    String finish = "finish";//评价后的状态
    String delete = "delete";

    void add(Order c);
    float add(Order c,List<OrderItem> ois);//添加订单，设置订单项oid，设置订单的订单项，计算出订单费用
    void delete(int id);
    void update(Order c);
    Order get(int id);
    List list();
    List listByUser(int uid,String status);//根据用户id查询状态不是status的订单
    List listByStatus(int uid,String status);
}
