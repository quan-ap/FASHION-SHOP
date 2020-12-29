package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.ClothesConverter;
import com.laptrinhjavaweb.dto.ClothesDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.ClothesEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.ClothesRepository;
import com.laptrinhjavaweb.service.IClothesService;
import com.laptrinhjavaweb.util.Util;

@Service
public class ClothesService implements IClothesService{
	
	@Autowired
	private ClothesRepository clothesRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ClothesConverter clothesConverter;
	
	@Autowired
	private Util clothesUtil;

	@Override
	public List<ClothesDTO> findAll(Pageable pageable) {
		List<ClothesDTO> models = new ArrayList<>();
		List<ClothesEntity> entities = clothesRepository.findAll(pageable).getContent();
		for (ClothesEntity item : entities) {
			ClothesDTO ClothesDTO = clothesConverter.toDto(item);
			models.add(ClothesDTO);
		}  
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) clothesRepository.count();
	}

	@Override
	public ClothesDTO findById(String id) {
		ClothesEntity entity = clothesRepository.findOne(id);
		return clothesConverter.toDto(entity);
	}

	@Override
	@Transactional
	public ClothesDTO save(ClothesDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		ClothesEntity clothesEntity = new ClothesEntity();
		if (dto.getId() != "") {
			ClothesEntity oldClothes = clothesRepository.findOne(dto.getId());
			oldClothes.setCategory(category);
			clothesEntity = clothesConverter.toEntity(oldClothes, dto);
		} else {
			clothesEntity = clothesConverter.toEntity(dto);
			clothesEntity.setCategory(category);
			String a = clothesUtil.takeId(dto.getTitle());
			String b = clothesUtil.takeId(category.getName());
			String c = a.concat(b.concat(String.valueOf(clothesRepository.count() + 1)));
			clothesEntity.setId(c);
		}
		return clothesConverter.toDto(clothesRepository.save(clothesEntity));
	}

	@Override
	@Transactional
	public void delete(String[] ids) {
		for (String id : ids) {
			clothesRepository.delete(id);
		}
	}

	@Override
	public List<ClothesDTO> findAllByName(ClothesDTO dto) {
		List<ClothesDTO> models = new ArrayList<>();
		List<ClothesEntity> entities = clothesRepository.findAllByTitle(dto.getTitle());
		for (ClothesEntity item : entities) {
			ClothesDTO ClothesDTO = clothesConverter.toDto(item);
			models.add(ClothesDTO);
		}  
		return models;
	}
	
}
