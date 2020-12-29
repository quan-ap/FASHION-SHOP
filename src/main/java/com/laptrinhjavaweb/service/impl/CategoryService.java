package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.CategoryConverter;
import com.laptrinhjavaweb.dto.CategoryDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.util.Util;

@Service
public class CategoryService implements ICategoryService{
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryConverter categoryConverter;
	
	@Autowired
	private Util categoryUtil; 
	
	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item : entities) {
			result.put(item.getCode(), item.getName());
		}
		return result;
	}

	@Override
	public List<CategoryDTO> findAll(Pageable pageable) {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll(pageable).getContent();
		for (CategoryEntity item : entities) {
			CategoryDTO CategoryDTO = categoryConverter.toDto(item);
			models.add(CategoryDTO);
		}  
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) categoryRepository.count();
	}

	@Override
	@Transactional
	public CategoryDTO save(CategoryDTO dto) {
		CategoryEntity categoryEntity = new CategoryEntity();
		if (dto.getId() != "") {
			CategoryEntity oldClothes = categoryRepository.findOne(dto.getId());
			categoryEntity = categoryConverter.toEntity(oldClothes, dto);
		} else {
			categoryEntity = categoryConverter.toEntity(dto);
			categoryEntity.setId(categoryUtil.takeId(dto.getName()).concat(String.valueOf(categoryRepository.count() + 1)));
		}
		return categoryConverter.toDto(categoryRepository.save(categoryEntity));
	}

	@Override
	@Transactional
	public void delete(String[] ids) {
		for (String id : ids) {
			categoryRepository.delete(id);
		}
	}

	@Override
	public CategoryDTO findById(String id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return categoryConverter.toDto(entity);
	}
	
}
