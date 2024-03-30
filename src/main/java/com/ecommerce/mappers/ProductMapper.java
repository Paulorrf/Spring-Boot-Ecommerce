package com.ecommerce.mappers;

import java.util.List;

import org.mapstruct.Mapper;

import com.ecommerce.dtos.ProductDTO;
import com.ecommerce.models.Product;

@Mapper(componentModel = "spring")
public interface ProductMapper {

    ProductDTO productToProductDto(Product product);

    Product productDtoToProduct(ProductDTO productDTO);

    List<ProductDTO> listProductToProductDto(List<Product> product);

    List<Product> listProductDtoToProduct(List<ProductDTO> productDTO);

}
