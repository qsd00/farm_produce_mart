package com.farm.service;

import com.farm.pojo.Product;
import com.farm.pojo.ProductImage;

import java.util.List;

public interface ProductService {
    void add(Product p);
    void delete(int id);
    void update(Product p);
    Product get(int id);
    List<Product> list(int cid);//根据分类id查询产品
    List<Product> listByCid(int cid);//根据分类id查询产品
    List<Product> listByUser(int cid,int uid);//根据用户id查询该三级分类下的所有产品
    List<Product> listByUid(int uid);//根据用户id查询所有产品
    List<Product> listByFid(int fid);//根据用户id查询所有产品
    void setFirstProductImage(Product p);//设置产品图片
    void setFirstProductImage(List<Product> ps);
    void setSingleProductImage(Product p);//设置产品缩略图
    void setSingleProductImage(List<Product> ps);
    void setDetailProductImage(Product p);//设置产品详情图
    void setDetailProductImage(List<Product> ps);
    void setSaleAndReviewNumber(Product p);//设置产品销量和评价累计
    void setSaleAndReviewNumber(List<Product> ps);
    List<Product> search(String keyWord);

}
