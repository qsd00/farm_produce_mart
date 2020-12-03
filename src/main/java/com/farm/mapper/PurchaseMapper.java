package com.farm.mapper;

import com.farm.pojo.Purchase;

import java.util.List;

public interface PurchaseMapper {
    void add(Purchase purchase);
    void delete(int id);
    Purchase get(int id);
    void update(Purchase purchase);
    List<Purchase> list();
    List<Purchase> listByFid(int fid);
    List<Purchase> listByUid(int uid);
}
