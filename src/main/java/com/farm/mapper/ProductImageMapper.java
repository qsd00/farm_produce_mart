package com.farm.mapper;

import com.farm.pojo.ProductImage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductImageMapper {
    void add(ProductImage pi);
    void delete(int id);
    void update(ProductImage pi);
    ProductImage get(int id);
    List<ProductImage> list(@Param("pid") int pid, @Param("type") String type);
}
