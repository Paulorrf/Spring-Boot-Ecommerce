package com.ecommerce.dtos;

import com.ecommerce.models.Category;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private String name;

    private String description;

    private Double price;

    private Integer quantity;
    
    private Category category;

    private String image;
    
    //overall product rate
    private Double rating;
}
