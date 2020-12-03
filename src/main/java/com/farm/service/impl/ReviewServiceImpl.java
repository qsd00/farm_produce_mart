package com.farm.service.impl;

import com.farm.mapper.ReviewMapper;
import com.farm.pojo.Review;
import com.farm.pojo.User;
import com.farm.service.ReviewService;
import com.farm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ReviewServiceImpl implements ReviewService {
    @Autowired
    private ReviewMapper reviewMapper;
    @Autowired
    private UserService userService;

    @Override
    public List<Review> listByProduct(int pdid) {
        List<Review> rs=reviewMapper.listByProduct(pdid);
        setUser(rs);
        return rs;
    }

    @Override
    public int getCount(int pdid) {
        return reviewMapper.getCount(pdid);
    }

    @Override
    public void add(Review review) {
        reviewMapper.add(review);
    }

    public void setUser(List<Review> reviews){
        for (Review review : reviews) {
            setUser(review);
        }
    }

    private void setUser(Review review) {
        int uid = review.getUid();
        User user =userService.getUser(uid);
        review.setUser(user);
    }
}
