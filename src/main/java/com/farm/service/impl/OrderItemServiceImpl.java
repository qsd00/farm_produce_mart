package com.farm.service.impl;

import com.farm.mapper.OrderItemMapper;
import com.farm.pojo.*;
import com.farm.service.OrderItemService;
import com.farm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderItemServiceImpl implements OrderItemService {
    @Autowired
    OrderItemMapper orderItemMapper;
    @Autowired
    ProductService productService;

    @Override
    public void add(OrderItem c) {
          orderItemMapper.add(c);
    }

    @Override
    public void delete(int id) {
        orderItemMapper.delete(id);
    }

    @Override
    public void update(OrderItem c) {
        orderItemMapper.update(c);
    }

    @Override
    public OrderItem get(int id) {
        OrderItem orderItem=orderItemMapper.get(id);
        setProduct(orderItem);
        return orderItem;
    }

    @Override
    public List listByOid(int oid) {//根据订单id查询订单项并给订单项产品属性赋值
        List<OrderItem> ois=orderItemMapper.listByOid(oid);
        setProduct(ois);
        return ois;
    }

    @Override
    public List<OrderItem> listByOtid(int otid) {
        List<OrderItem> ois=orderItemMapper.listByOtid(otid);
        setProduct(ois);
        return ois;
    }

    @Override
    public List<OrderItem> listByUid(int uid) {//根据用户id查询订单项并给订单项产品属性赋值
        List<OrderItem> ois=orderItemMapper.listByUid(uid);
        setProduct(ois);
        return ois;
    }

    @Override
    public List listBySidAndOid(int sid, int oid) {
        List<OrderItem> ois=orderItemMapper.listBySidAndOid(sid,oid);
        setProduct(ois);
        return ois;
    }

    @Override
    public int getSaleCount(int pdid) {
      List<OrderItem> ois=orderItemMapper.listByPdid(pdid);
        int result =0;
        for (OrderItem oi : ois) {
            result+=oi.getNumber();
        }
        return result;
    }


    @Override
    public void fill(List<Order> os) {
        for (Order o : os) {
            fill(o);
        }
    }

    @Override
    public void fill(Order o) {//计算并设置订单的订单项，订单项数量和总费用
      List<OrderItem> ois=listByOid(o.getId());
        float total = 0;
        int totalNumber = 0;
        for (OrderItem oi : ois) {
            total+=oi.getNumber()*oi.getProduct().getPrice();
            totalNumber+=oi.getNumber();
        }
        o.setTotal(total);
        o.setTotalNumber(totalNumber);
        o.setOrderItems(ois);
    }

    @Override
    public void fillOfOut(List<OutOrder> ots) {
        for (OutOrder ot : ots) {
            fillOfOut(ot);
        }
    }

    @Override
    public void fillOfOut(OutOrder ot) {
        List<OrderItem> ois=listByOtid(ot.getId());//查询时已设置产品
        float total = 0;
        int totalNumber = 0;
        for (OrderItem oi : ois) {
            total+=oi.getNumber()*oi.getProduct().getPrice();
            totalNumber+=oi.getNumber();
        }
        ot.setTotal(total);
        ot.setTotalNumber(totalNumber);
        ot.setOrderItems(ois);
    }

    @Override
    public List<OrderItem> listByPdids(int[] ids) {
        return orderItemMapper.listByPdids(ids);
    }

    public void setProduct(List<OrderItem> ois){
        for (OrderItem oi: ois) {
            setProduct(oi);
        }
    }

    private void setProduct(OrderItem oi) {//设置订单项产品属性
        Product p = productService.get(oi.getPdid());
        oi.setProduct(p);
    }
}
