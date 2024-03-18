package com.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ecommerce.models.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {

}
