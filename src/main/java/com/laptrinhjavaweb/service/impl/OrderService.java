package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.OrderConverter;
import com.laptrinhjavaweb.dto.OrderDTO;
import com.laptrinhjavaweb.entity.OrderEntity;
import com.laptrinhjavaweb.repository.OrderRepository;
import com.laptrinhjavaweb.service.IOrderService;
import com.laptrinhjavaweb.util.Util;



@Service
public class OrderService implements IOrderService{
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private OrderConverter orderConverter;
	
	@Autowired
	private Util orderUtil;
	
	@Override
	public List<OrderDTO> findAll(Pageable pageable) {
		List<OrderDTO> models = new ArrayList<>();
		List<OrderEntity> entities = orderRepository.findAll(pageable).getContent();
		for (OrderEntity item : entities) {
			OrderDTO ClothesDTO = orderConverter.toDto(item);
			models.add(ClothesDTO);
		}  
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) orderRepository.count();
	}

	@Override
	public OrderDTO findById(String id) {
		OrderEntity entity = orderRepository.findOne(id);
		return orderConverter.toDto(entity);
	}

	@Override
	@Transactional
	public OrderDTO save(OrderDTO dto) {
		OrderEntity orderEntity = new OrderEntity();
		if (dto.getId() != "") {
			OrderEntity oldOrder = orderRepository.findOne(dto.getId());
			orderEntity = orderConverter.toEntity(oldOrder, dto);
		} else {
			orderEntity = orderConverter.toEntity(dto);
			String a = orderUtil.takeId(dto.getAddress());
			String c = a.concat(String.valueOf(orderRepository.count() + 1));
			orderEntity.setId(c);
		}
		return orderConverter.toDto(orderRepository.save(orderEntity));
	}
	
}
