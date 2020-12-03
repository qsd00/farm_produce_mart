package com.farm.service;

import com.farm.pojo.FirstCategory;
import com.farm.pojo.Page;

import java.util.List;

public interface FirstCategoryService {
    List<FirstCategory> list();
    List<FirstCategory> listById(int id);
    void add(FirstCategory firstCategory);
    void delete(int id);
    FirstCategory get(int id);
    void update(FirstCategory firstCategory);
}
