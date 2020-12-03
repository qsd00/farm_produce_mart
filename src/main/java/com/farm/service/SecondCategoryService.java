package com.farm.service;

import com.farm.pojo.FirstCategory;
import com.farm.pojo.SecondCategory;

import java.util.List;

public interface SecondCategoryService {
    List<SecondCategory> list(int fid);
    void add(SecondCategory secondCategory);
    void delete(int id);
    void update(SecondCategory secondCategory);
    SecondCategory get(int id);
    public void fill(FirstCategory fc);
    public void fill(List<FirstCategory> fcs);
}
