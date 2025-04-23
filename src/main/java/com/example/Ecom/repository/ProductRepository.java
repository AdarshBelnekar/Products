package com.example.Ecom.repository;

import com.example.Ecom.model.ProductEntity;
import com.example.Ecom.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository  extends JpaRepository<ProductEntity,Integer> {
    List<ProductEntity> findByBarcode(Integer barcode);

}
