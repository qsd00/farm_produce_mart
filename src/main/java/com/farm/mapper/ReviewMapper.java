package com.farm.mapper;

import com.farm.pojo.Review;

import java.util.List;

public interface ReviewMapper {
    List<Review> listByProduct(int pdid);
    int  getCount(int pdid);
    void add(Review review);
}
