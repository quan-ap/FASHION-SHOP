package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.ClothesDTO;

public interface IClothesService {
	List<ClothesDTO> findAll(Pageable pageable);
	List<ClothesDTO> findAllByName(ClothesDTO dto);
	int getTotalItem();
	ClothesDTO findById(String id);
	ClothesDTO save(ClothesDTO dto);
	void delete(String[] ids);
}
