package com.farm.service.impl;

import com.farm.mapper.ProductImageMapper;
import com.farm.pojo.ProductImage;
import com.farm.service.ProductImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductImageServiceImpl implements ProductImageService {
    @Autowired
    private ProductImageMapper productImageMapper;
    @Override
    public void add(ProductImage pi) {
           productImageMapper.add(pi);
    }

    @Override
    public void delete(int id) {
           productImageMapper.delete(id);
    }

    @Override
    public void update(ProductImage pi) {
            productImageMapper.update(pi);
    }

    @Override
    public ProductImage get(int id) {
        return productImageMapper.get(id);
    }

    @Override
    public List<ProductImage> list(int pid, String type) {
        return productImageMapper.list(pid,type);
    }
}
