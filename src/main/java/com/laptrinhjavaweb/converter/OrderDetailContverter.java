package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.OrderDetailDTO;
import com.laptrinhjavaweb.entity.OrderDetailEntity;



@Component
public class OrderDetailContverter {
	
	public OrderDetailDTO toDto(OrderDetailEntity entity) {
		OrderDetailDTO result = new OrderDetailDTO();
		result.setId(entity.getId());
		result.setPrice(entity.getPrice());
		result.setQuantity(entity.getQuantity());
		result.setSubtotal(entity.getSubtotal());
		return result;
	}
	
	public OrderDetailEntity toEntity(OrderDetailDTO dto) {
		OrderDetailEntity result = new OrderDetailEntity();
		result.setPrice(dto.getPrice());
		result.setQuantity(dto.getQuantity());
		result.setSubtotal(dto.getSubtotal());
		return result;
	}
	
	public OrderDetailEntity toEntity(OrderDetailEntity result, OrderDetailDTO dto) {
		result.setPrice(dto.getPrice());
		result.setQuantity(dto.getQuantity());
		result.setSubtotal(dto.getSubtotal());
		return result;
	}
	
}
