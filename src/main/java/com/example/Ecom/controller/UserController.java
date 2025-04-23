package com.example.Ecom.controller;


import com.example.Ecom.model.User;
import com.example.Ecom.services.Services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

   @Autowired
    Services springservices;

   @RequestMapping("/home")
    public  String Default(){
       return "Index";
   }



    @RequestMapping("/savedata")
    public String Savedata(@ModelAttribute User model) {

        if(model.getPassword().equals(model.getConfirmPassword())) {

            springservices.Register(model);

            return "Dashboard";
        }
        return "Index";
    }

    @PostMapping("/loginForm")
    public String submitLoginForm(@ModelAttribute("user") User user, Model model){

       User validUser = springservices.loginUser(user.getEmail(),user.getPassword());

       if(validUser !=null){
           return "Product";
       }
       else {
           return "Index";
       }
    }

}

