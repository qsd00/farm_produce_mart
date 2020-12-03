package com.farm.service.impl;

import com.farm.mapper.OutOrderMapper;
import com.farm.pojo.OutOrder;
import com.farm.pojo.User;
import com.farm.service.OutOrderService;
import com.farm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OutOrderServiceImpl implements OutOrderService {
    @Autowired
    private OutOrderMapper outOrderMapper;
    @Autowired
    private UserService userService;
    @Override
    public void add(OutOrder oto) {
        outOrderMapper.add(oto);
    }

    @Override
    public void update(OutOrder oto) {
        outOrderMapper.update(oto);
    }

    @Override
    public void delete(int otid) {
       outOrderMapper.delete(otid);
    }

    @Override
    public OutOrder get(int id) {
        return outOrderMapper.get(id);
    }

    @Override
    public List<OutOrder> getByOid(int oid) {
        return outOrderMapper.getByOid(oid);
    }

    @Override
    public List<OutOrder> list() {
        List<OutOrder> ots=outOrderMapper.listAll();
        setSellUser(ots);
        return ots;
    }

    @Override
        public List<OutOrder> list(int sid) {
        List<OutOrder> ots=outOrderMapper.list(sid);
        setUser(ots);
        return ots;
    }

    @Override
    public List<OutOrder> listBySid(int sid, String status) {
        List<OutOrder> ots=outOrderMapper.listBySid(sid,status);
        setUser(ots);
        return ots;
    }

    @Override
    public int getCount(List<OutOrder> ots) {
        int i=0;
        for (OutOrder o:ots){
            if (o.getDeliveryDate()!=null){
                i++;
            }
        }
        return i;
    }

    public void setUser(OutOrder ot){
        User user=userService.getUser(ot.getUid());
        ot.setUser(user);
    }

    public void setUser(List<OutOrder> ots){
        for (OutOrder ot:ots){
            setUser(ot);
        }
    }

    public void setSellUser(OutOrder ot){
        User user=userService.getUser(ot.getSid());
        ot.setSellUser(user);
    }

    public void setSellUser(List<OutOrder> ots){
        for (OutOrder ot:ots){
            setSellUser(ot);
        }
    }
}
