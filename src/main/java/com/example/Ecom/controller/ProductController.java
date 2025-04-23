package com.example.Ecom.controller;

import com.example.Ecom.model.ProductEntity;
import com.example.Ecom.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductServices productServices;

//    @RequestMapping("/home")
//    public  String Default(){
//        return "Index";
//    }

    @RequestMapping("/product")
    public  String Products(){
        return "Product";
    }

    @RequestMapping("/order")
    public  String Orders(){
        return  "Order";
    }


    @RequestMapping("/productdata")
    public String productSave(@ModelAttribute ProductEntity product) {
        System.out.println(product); // Debugging line
        productServices.ProductOff(product);
        return "Product"; // Correct redirect
    }


    @GetMapping("/products")
    public List<ProductEntity> getAllProducts() {
        return productServices.findAllProducts();
    }

    // New API endpoint for JSON search (by barcode or all)
    @GetMapping("/api/search")
    @ResponseBody
    public List<ProductEntity> searchProducts(@RequestParam(required = false) Integer barcode) {
        if (barcode != null) {
            return productServices.findProductsByBarcode(barcode);
        } else {
            return productServices.findAllProducts();
        }
    }

    @GetMapping("/search")
    public String search(@RequestParam Integer barcode, Model model) {
        List<ProductEntity> stockList = productServices.findProductsByBarcode(barcode);
        model.addAttribute("products", stockList);
        return "Order"; // reuse the same page to show search result
    }


}
