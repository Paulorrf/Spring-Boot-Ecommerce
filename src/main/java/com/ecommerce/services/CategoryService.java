package com.ecommerce.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dtos.CategoryDTO;
import com.ecommerce.mappers.CategoryMapper;
import com.ecommerce.models.Category;
import com.ecommerce.repositories.CategoryRepository;

@Service
public class CategoryService {

    CategoryRepository categoryRepository;

    CategoryMapper categoryMapper;

    @Autowired
    CategoryService(CategoryRepository categoryRepository, CategoryMapper categoryMapper){
        this.categoryRepository = categoryRepository;
        this.categoryMapper = categoryMapper;
    }

    public CategoryDTO create(CategoryDTO categoryDTO) {
        if(categoryDTO != null) {
            @SuppressWarnings("null")
            Category category = categoryRepository.save(categoryMapper.categoryDtoToCategory(categoryDTO));

            return categoryMapper.categoryToCategoryDTO(category);
        }
        return null;
    }

    public CategoryDTO findById(Long id){
        if(id != null) {
            Optional<Category> category = categoryRepository.findById(id);
            if(category.isPresent()) {
                return categoryMapper.categoryToCategoryDTO(category.get());
            }

            return null;
        }
        return null;
    }

    public CategoryDTO findByName(String name){
        if(name != null) {
            Optional<Category> category = categoryRepository.findByName(name);
            if(category.isPresent()) {
                return categoryMapper.categoryToCategoryDTO(category.get());
            }

            return null;
        }
        return null;
    }

    public List<CategoryDTO> findAll() {
        List<Category> categories = categoryRepository.findAll();

        return categoryMapper.listCategoryToCategoryDTO(categories);
    }

    public void deleteById(Long id) {
        if(id != null) {
            categoryRepository.deleteById(id);
        }else {
            throw new RuntimeException("Not possible to delete the category!");
        }
    }

}
