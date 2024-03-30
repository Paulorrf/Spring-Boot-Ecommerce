package com.ecommerce.dtos;

import java.time.LocalDate;

import com.ecommerce.models.Product;
import com.ecommerce.models.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

    private User user;

    private Product product;

    private Double rating;

    private String comment;

    private LocalDate review_date;

}
