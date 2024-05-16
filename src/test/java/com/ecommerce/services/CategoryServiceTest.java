package com.ecommerce.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.verifyNoInteractions;
import static org.mockito.Mockito.when;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import com.ecommerce.dtos.CategoryDTO;
import com.ecommerce.mappers.CategoryMapper;
import com.ecommerce.models.Category;
import com.ecommerce.repositories.CategoryRepository;

public class CategoryServiceTest {

    @Mock
    private CategoryRepository categoryRepository;

    @Mock
    private CategoryMapper categoryMapper;

    @InjectMocks
    private CategoryService categoryService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testCreateCategory() {
        CategoryDTO categoryDTO = new CategoryDTO();
        categoryDTO.setName("Test Category");

        Category category = new Category();
        category.setId(1L);
        category.setName("Test Category");

        when(categoryMapper.categoryDtoToCategory(categoryDTO)).thenReturn(category);
        when(categoryMapper.categoryToCategoryDTO(category)).thenReturn(categoryDTO);
        when(categoryRepository.save(category)).thenReturn(category);

        CategoryDTO result = categoryService.create(categoryDTO);

        assertNotNull(result);
        assertEquals("Test Category", result.getName());
    }

    @Test
    public void testCreateCategoryWithNullInput() {
        CategoryDTO result = categoryService.create(null);

        assertNull(result);
        verifyNoInteractions(categoryRepository);
        verifyNoInteractions(categoryMapper);
    }

    /*
    @Test
    void testCreate() {

    }

    @Test
    void testDeleteById() {

    }

    @Test
    void testFindAll() {

    }

    @Test
    void testFindById() {

    }

    @Test
    void testFindByName() {

    }
    */
}
