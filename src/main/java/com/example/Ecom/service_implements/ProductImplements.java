package com.example.Ecom.service_implements;


import com.example.Ecom.model.ProductEntity;
import com.example.Ecom.repository.ProductRepository;
import com.example.Ecom.services.ProductServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductImplements implements ProductServices {

    @Autowired
    ProductRepository productRepository;


    @Override
    public  void ProductOff(ProductEntity model){
        productRepository.save(model);
    }

    @Override
    public List<ProductEntity> findAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public ProductEntity updateCategory(ProductEntity category, Long categoryId) {
        return null;
    }

    @Override
    public List<ProductEntity> findProductsByBarcode(Integer barcode) {
        return productRepository.findByBarcode(barcode);
    }





}
