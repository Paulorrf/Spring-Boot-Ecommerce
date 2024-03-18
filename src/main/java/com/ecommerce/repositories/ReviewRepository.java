package com.ecommerce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ecommerce.models.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {

}
