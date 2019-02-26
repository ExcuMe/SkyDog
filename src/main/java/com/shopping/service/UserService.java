package com.shopping.service;

import com.shopping.entity.User;
import com.shopping.utils.Response;

import java.util.List;


public interface UserService {
    User getUser(int id);

    User getUser(String nameOrEmail);

    void addUser(User user);

    Response deleteUser(int id);

    boolean updateUser(User user);

    List<User> getAllUser();

    List<User> getAllShopowners();

}
