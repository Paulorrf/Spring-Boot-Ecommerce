package com.ecommerce.mappers;

import java.util.List;

import org.mapstruct.Mapper;

import com.ecommerce.dtos.ReviewDTO;
import com.ecommerce.models.Review;

@Mapper(componentModel = "spring")
public interface ReviewMapper {

    ReviewDTO reviewToReviewDTO(Review review);

    Review reviewDtoToReview(ReviewDTO reviewDTO);

    List<ReviewDTO> listReviewToReviewDTO(List<Review> review);

    List<Review> listReviewDtoToReview(List<ReviewDTO> reviewDTO);

}
