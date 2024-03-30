package com.ecommerce.mappers;

import java.util.List;

import org.mapstruct.Mapper;

import com.ecommerce.dtos.CategoryDTO;
import com.ecommerce.models.Category;

@Mapper(componentModel = "spring")
public interface CategoryMapper {

    CategoryDTO categoryToCategoryDTO(Category category);

    Category categoryDtoToCategory(CategoryDTO categoryDTO);

    List<CategoryDTO> listCategoryToCategoryDTO(List<Category> category);

    List<Category> listCategoryDtoToCategory(List<CategoryDTO> categoryDTO);

}