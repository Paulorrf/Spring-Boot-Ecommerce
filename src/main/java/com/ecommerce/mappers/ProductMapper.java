package com.ecommerce.mappers;

import java.util.List;

import org.mapstruct.Mapper;

import com.ecommerce.dtos.ProductDTO;
import com.ecommerce.models.Product;

@Mapper(componentModel = "spring")
public interface ProductMapper {

    ProductDTO productToProductDto(Product category);

    Product productDtoToProduct(ProductDTO categoryDTO);

    List<ProductDTO> listProductToProductDto(List<Product> category);

    List<Product> listProductDtoToProduct(List<ProductDTO> categoryDTO);

}
