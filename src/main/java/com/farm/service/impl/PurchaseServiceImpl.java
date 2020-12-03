package com.farm.service.impl;

import com.farm.mapper.PurchaseMapper;
import com.farm.pojo.Purchase;
import com.farm.pojo.User;
import com.farm.service.PurchaseService;
import com.farm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PurchaseServiceImpl implements PurchaseService {
    @Autowired
    private PurchaseMapper purchaseMapper;
    @Autowired
    private UserService userService;
    @Override
    public void add(Purchase purchase) {
        purchaseMapper.add(purchase);
    }

    @Override
    public void delete(int id) {
       purchaseMapper.delete(id);
    }

    @Override
    public Purchase get(int id) {
        Purchase p=purchaseMapper.get(id);
        setUser(p);
        return p;
    }

    @Override
    public void update(Purchase purchase) {
       purchaseMapper.update(purchase);
    }

    @Override
    public List<Purchase> list() {
        List<Purchase> ps=purchaseMapper.list();
        setUser(ps);
        return  ps;
    }

    @Override
    public List<Purchase> listByFid(int fid) {
        List<Purchase> ps=purchaseMapper.listByFid(fid);
        setUser(ps);
        return ps;
    }

    @Override
    public List<Purchase> listByUid(int uid) {
        List<Purchase> ps=purchaseMapper.listByUid(uid);
        setUser(ps);
        return ps;
    }

    public void setUser(Purchase purchase){
        User user=userService.getUser(purchase.getUid());
        purchase.setUser(user);
    }

    public void setUser(List<Purchase> ps){
        for (Purchase p:ps){
            setUser(p);
        }
    }
}
