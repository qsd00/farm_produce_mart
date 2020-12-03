package com.farm.service.impl;

import com.farm.mapper.OrderMapper;
import com.farm.pojo.Order;
import com.farm.pojo.OrderItem;
import com.farm.pojo.User;
import com.farm.service.OrderItemService;
import com.farm.service.OrderService;
import com.farm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Autowired
    UserService userService;

    @Autowired
    OrderItemService orderItemService;

    @Override
    public void add(Order c) {
      orderMapper.add(c);
    }

    @Override
    @Transactional(propagation= Propagation.REQUIRED,isolation = Isolation.DEFAULT)
    public float add(Order o, List<OrderItem> ois) {
        float total = 0;
        add(o);
        o.setOrderItems(ois);
        for (OrderItem oi: ois) {
            oi.setOid(o.getId());
            orderItemService.update(oi);
            total+=oi.getProduct().getPrice()*oi.getNumber();
        }
        return Math.round(total);
    }

    @Override
    public void delete(int id) {
      orderMapper.delete(id);
    }

    @Override
    public void update(Order c) {
      orderMapper.update(c);
    }

    @Override
    public Order get(int id) {
     Order order=orderMapper.get(id);
//     setUser(order);
        return order;
    }

    @Override
    public List list() {
        List os=orderMapper.list();
        return os;
    }

    @Override
    public List listByUser(int uid, String status) {
        return orderMapper.listByUser(uid,status);
    }

    @Override
    public List listByStatus(int uid, String status) {
        return orderMapper.listByStatus(uid,status);
    }

    /*public void setUser(List<Order> os){
        for (Order o : os)
            setUser(o);
    }
    public void setUser(Order o){
        int uid = o.getUid();
        User u = userService.getUser(uid);
        o.setUser(u);
    }*/
}
