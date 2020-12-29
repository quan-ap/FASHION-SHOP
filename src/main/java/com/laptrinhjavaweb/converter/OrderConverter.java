package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.OrderDTO;
import com.laptrinhjavaweb.entity.OrderEntity;



@Component
public class OrderConverter {
	
	public OrderDTO toDto(OrderEntity entity) {
		OrderDTO result = new OrderDTO();
		result.setId(entity.getId());
		result.setCreatedDate(entity.getCreatedDate());
		result.setAddress(entity.getAddress());
		result.setStatus(entity.getStatus());
		result.setTotal(entity.getTotal());
		return result;
	}
	
	public OrderEntity toEntity(OrderDTO dto) {
		OrderEntity result = new OrderEntity();
		result.setAddress(dto.getAddress());
		result.setStatus(dto.getStatus());
		result.setTotal(dto.getTotal());
		return result;
	}
	
	public OrderEntity toEntity(OrderEntity result, OrderDTO dto) {
		result.setAddress(dto.getAddress());
		result.setStatus(dto.getStatus());
		result.setTotal(dto.getTotal());
		return result;
	}
	
}
