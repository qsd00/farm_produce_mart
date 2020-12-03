package com.farm.service.impl;

import com.farm.mapper.ProductMapper;
import com.farm.pojo.Product;
import com.farm.pojo.ProductImage;
import com.farm.service.OrderItemService;
import com.farm.service.ProductImageService;
import com.farm.service.ProductService;
import com.farm.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;

    @Autowired
    ProductImageService productImageService;
    @Autowired
    OrderItemService orderItemService;
    @Autowired
    ReviewService reviewService;

    @Override
    public void add(Product p) {
        productMapper.add(p);
    }

    @Override
    public void delete(int id) {
        productMapper.delete(id);
    }

    @Override
    public void update(Product p) {
        productMapper.update(p);
    }

    @Override
    public Product get(int id) {
        Product p=productMapper.get(id);
        setFirstProductImage(p);
        setSingleProductImage(p);
        setDetailProductImage(p);
        return p;
    }

    @Override
    public List<Product> list(int cid) {
        List<Product> ps=productMapper.list(cid);
        setFirstProductImage(ps);
        setSingleProductImage(ps);
        setDetailProductImage(ps);
        return ps;
    }

    @Override
    public List<Product> listByCid(int cid) {
        return productMapper.listByCid(cid);
    }

    @Override
    public List<Product> listByUser(int cid, int uid) {
        List<Product> ps=productMapper.listByUser(cid,uid);
        setFirstProductImage(ps);
        setSingleProductImage(ps);
        setDetailProductImage(ps);
        return ps;
    }

    @Override
    public List<Product> listByUid(int uid) {
        List<Product> ps=productMapper.listByUid(uid);
        setFirstProductImage(ps);
        setSingleProductImage(ps);
        setDetailProductImage(ps);
        return ps;
    }

    @Override
    public List<Product> listByFid(int fid) {
        return productMapper.listByFid(fid);
    }

    @Override
    public void setFirstProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            p.setFirstProductImage(pi);
        }
    }

    @Override
    public void setFirstProductImage(List<Product> ps) {
        for(Product p:ps){
            setFirstProductImage(p);
        }
    }

    @Override
    public void setSingleProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()){
            p.setSingleProductImage(pis);
        }
    }

    @Override
    public void setSingleProductImage(List<Product> ps) {
        for(Product p:ps){
           setSingleProductImage(p);
        }
    }


    @Override
    public void setDetailProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_detail);
        if (!pis.isEmpty()){
            p.setDetailProductImage(pis);
        }

    }

    @Override
    public void setDetailProductImage(List<Product> ps) {
        for(Product p:ps){
            setDetailProductImage(p);
        }
    }

    @Override
    public void setSaleAndReviewNumber(Product p) {
        int saleCount = orderItemService.getSaleCount(p.getId());//查询订单项里otid不为空的记录
        p.setSaleCount(saleCount);
        int reviewCount = reviewService.getCount(p.getId());
        p.setReviewCount(reviewCount);
    }

    @Override
    public void setSaleAndReviewNumber(List<Product> ps) {
         for (Product p:ps){
             setSaleAndReviewNumber(p);
         }
    }

    @Override
    public List<Product> search(String keyWord) {
        List<Product> ps=productMapper.search(keyWord);
        setFirstProductImage(ps);
        setSingleProductImage(ps);
        setDetailProductImage(ps);
        return ps;
    }


}
