package com.example.Ecom.services;

import com.example.Ecom.model.ProductEntity;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ProductServices {

    void ProductOff(ProductEntity model);

    List<ProductEntity> findAllProducts();


    ProductEntity updateCategory(ProductEntity category, Long categoryId);

    List<ProductEntity> findProductsByBarcode(Integer barcode);


}
