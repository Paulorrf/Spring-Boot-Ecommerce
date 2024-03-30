package com.ecommerce.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ecommerce.dtos.ProductDTO;
import com.ecommerce.services.ProductService;

@RestController
@RequestMapping("/product")
public class ProductController {

    ProductService productService;

    @Autowired
    ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping()
    ProductDTO create(@RequestBody ProductDTO productDTO) {
        return productService.create(productDTO);
    }

    @GetMapping("/{productId}")
    ProductDTO findById(@PathVariable Long id) {
        return productService.findById(id);
    }

    @GetMapping()
    List<ProductDTO> findAll() {
        return productService.findAll();
    }

    @DeleteMapping()
    void deleteById(@PathVariable Long id) {
        productService.deleteById(id);
        
    }

}
