package com.farm.service;

import com.farm.pojo.Review;

import java.util.List;

public interface ReviewService {
    List<Review> listByProduct(int pdid);
    int getCount(int pdid);
    void add(Review review);
}
