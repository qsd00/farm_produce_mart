package com.farm.service;



import com.farm.pojo.User;

import java.util.List;

public interface UserService {
    void regist(User c);
    void delete(int id);
    void update(User c);
    User getUser(int id);
    List<User> list();
    User isExist(String name);

    User login(String name, String password);

}
