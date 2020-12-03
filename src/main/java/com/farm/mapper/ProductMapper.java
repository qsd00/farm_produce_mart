package com.farm.mapper;

import com.farm.pojo.Product;

import java.util.List;

public interface ProductMapper {
    void add(Product p);
    void delete(int id);
    void update(Product p);
    Product get(int id);
    List<Product> list(int cid);//根据三级分类id，查询所有的产品
    List<Product> listByCid(int cid);//根据price分组查询cid对应的产品
    List<Product> listByUser(int cid,int uid);//根据用户id查询该三级分类下的所有产品
    List<Product> listByUid(int uid);//根据用户id查询所有产品
    List<Product> listByFid(int fid);//根据fid查询所有产品
    List<Product> search(String keyWord);

}
