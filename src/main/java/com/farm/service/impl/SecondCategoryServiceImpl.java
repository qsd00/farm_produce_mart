package com.farm.service.impl;

import com.farm.mapper.SecondCategoryMapper;
import com.farm.pojo.FirstCategory;
import com.farm.pojo.SecondCategory;
import com.farm.service.SecondCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.dc.pr.PRError;

import java.util.List;
@Service
public class SecondCategoryServiceImpl implements SecondCategoryService {
    @Autowired
    private SecondCategoryMapper secondCategoryMapper;
    @Override
    public List<SecondCategory> list(int fid) {
        return secondCategoryMapper.list(fid);
    }

    @Override
    public void add(SecondCategory secondCategory) {
       secondCategoryMapper.add(secondCategory);
    }

    @Override
    public void delete(int id) {
      secondCategoryMapper.delete(id);
    }

    @Override
    public void update(SecondCategory secondCategory) {
      secondCategoryMapper.update(secondCategory);
    }

    @Override
    public SecondCategory get(int id) {
        return secondCategoryMapper.get(id);
    }

    @Override
    public void fill(FirstCategory fc) {
        List<SecondCategory> ss = list(fc.getId());
        fc.setSc(ss);
    }

    @Override
    public void fill(List<FirstCategory> fcs) {
        for (FirstCategory fc : fcs) {
            fill(fc);
        }
    }
}
