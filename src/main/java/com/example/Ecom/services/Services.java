package com.example.Ecom.services;

import com.example.Ecom.model.User;

public interface Services {

    void Register(User model);


    public User loginUser(String email,String password);

}
