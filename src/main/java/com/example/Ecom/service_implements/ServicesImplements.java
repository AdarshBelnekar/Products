package com.example.Ecom.service_implements;

import com.example.Ecom.model.User;
import com.example.Ecom.repository.UserRepository;
import com.example.Ecom.services.Services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicesImplements  implements Services {

    @Autowired
    UserRepository userRepository;

    @Override
    public  void Register(User model){
        userRepository.save(model);
    }

    @Override
    public User loginUser(String email,String password){

        User vaildUser =userRepository.findByEmail(email);

        if(vaildUser != null && vaildUser.getPassword().equals(password)){
            return vaildUser;
        }

        return null;


    }
}
