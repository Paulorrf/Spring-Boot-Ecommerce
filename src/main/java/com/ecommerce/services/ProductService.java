package com.ecommerce.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dtos.ProductDTO;
import com.ecommerce.mappers.ProductMapper;
import com.ecommerce.models.Product;
import com.ecommerce.repositories.ProductRepository;

@Service
public class ProductService {

    ProductRepository productRepository;
    ProductMapper productMapper;

    @Autowired
    ProductService(ProductRepository productRepository, ProductMapper productMapper){
        this.productRepository = productRepository;
        this.productMapper = productMapper;
    }

    public ProductDTO create(ProductDTO productDTO) {
        if(productDTO != null) {
            @SuppressWarnings("null")
            Product product = productRepository.save(productMapper.productDtoToProduct(productDTO));
            return productMapper.productToProductDto(product);
        }
        return null;
    }

    public ProductDTO findById(Long id) {
        if(id != null) {
            Optional<Product> product = productRepository.findById(id);
            if(product.isPresent()) {
                return productMapper.productToProductDto(product.get());
            }
        }
        return null;
    }

    public List<ProductDTO> findAll() {
        List<Product> products = productRepository.findAll();

        return productMapper.listProductToProductDto(products);
    }

    public void deleteById(Long id) {
        if(id != null) {
            productRepository.deleteById(id);
        }else {
            throw new RuntimeException("Not possible to delete the product!");
        } 
        
    }

}
