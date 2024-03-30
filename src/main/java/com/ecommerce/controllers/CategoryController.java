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

import com.ecommerce.dtos.CategoryDTO;
import com.ecommerce.services.CategoryService;

@RestController
@RequestMapping("/category")
public class CategoryController {

    CategoryService categoryService;

    @Autowired
    CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/{categoryId}")
    CategoryDTO getById(@PathVariable Long categoryId) {
        return categoryService.findById(categoryId);
    }

    @GetMapping("/name/{categoryName}")
    CategoryDTO getByName(@PathVariable String categoryName) {
        return categoryService.findByName(categoryName);
    }

    @GetMapping()
    List<CategoryDTO> getAll() {
        return categoryService.findAll();
    }

    @PostMapping
    CategoryDTO create(@RequestBody CategoryDTO categoryDTO) {
        return categoryService.create(categoryDTO);
    }

    @DeleteMapping("/{categoryId}")
    void deleteById(@PathVariable Long categoryId) {
        categoryService.deleteById(categoryId);
    }

}
