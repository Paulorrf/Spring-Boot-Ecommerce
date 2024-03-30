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

import com.ecommerce.dtos.ReviewDTO;
import com.ecommerce.services.ReviewService;

@RestController
@RequestMapping("/review")
public class ReviewController {

    ReviewService reviewService;

    @Autowired
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @PostMapping
    public ReviewDTO create(@RequestBody ReviewDTO reviewDTO){
        return reviewService.create(reviewDTO);
    }

    @GetMapping
    public ReviewDTO findById(@PathVariable Long id) {
        return reviewService.findById(id);
    }

    @GetMapping
    public List<ReviewDTO> findAll() {
        return reviewService.findAll();
    }

    @DeleteMapping
    public void delete(@PathVariable Long id){
        reviewService.deleteById(id);
    }
}
