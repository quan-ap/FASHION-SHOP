package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.ClothesDTO;
import com.laptrinhjavaweb.entity.ClothesEntity;

@Component
public class ClothesConverter {
	
	public ClothesDTO toDto(ClothesEntity entity) {
		ClothesDTO result = new ClothesDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setPrice(entity.getPrice());
		result.setQuantity(entity.getQuantity());
		result.setDetail(entity.getDetail());
		result.setThumbnail(entity.getThumbnail());
		result.setCategoryCode(entity.getCategory().getCode());
		return result;
	}
	
	public ClothesEntity toEntity(ClothesDTO dto) {
		ClothesEntity result = new ClothesEntity();
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setPrice(dto.getPrice());
		result.setQuantity(dto.getQuantity());
		result.setDetail(dto.getDetail());
		result.setThumbnail(dto.getThumbnail());
		return result;
	}
	
	public ClothesEntity toEntity(ClothesEntity result, ClothesDTO dto) {
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setQuantity(dto.getQuantity());
		result.setPrice(dto.getPrice());
		result.setDetail(dto.getDetail());
		result.setThumbnail(dto.getThumbnail());
		return result;
	}
}
