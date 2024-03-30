package com.ecommerce.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dtos.ReviewDTO;
import com.ecommerce.mappers.ReviewMapper;
import com.ecommerce.models.Review;
import com.ecommerce.repositories.ReviewRepository;

@Service
public class ReviewService {

    ReviewRepository reviewRepository;

    ReviewMapper reviewMapper;

    @Autowired
    public ReviewService(ReviewRepository reviewRepository, ReviewMapper reviewMapper) {
        this.reviewRepository = reviewRepository;
        this.reviewMapper = reviewMapper;
    }

    public ReviewDTO create(ReviewDTO reviewDTO) {
        if(reviewDTO != null) {
            @SuppressWarnings("null")
            Review review = reviewRepository.save(reviewMapper.reviewDtoToReview(reviewDTO));
            return reviewMapper.reviewToReviewDTO(review);
        }
        return null;
    }

    public ReviewDTO findById(Long id) {
        if(id != null) {
            Optional<Review> review = reviewRepository.findById(id);
            if(review.isPresent()) {
                return reviewMapper.reviewToReviewDTO(review.get());
            }
        }
        return null;
    }

    public List<ReviewDTO> findAll() {
        return reviewMapper.listReviewToReviewDTO(reviewRepository.findAll());
    }

    public void deleteById(Long id) {
        if(id != null) {
            reviewRepository.deleteById(id);
        }else {
            throw new RuntimeException("Not possible to delete the review!");
        }
    }
}
