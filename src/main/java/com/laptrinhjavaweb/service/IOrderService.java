package com.laptrinhjavaweb.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.laptrinhjavaweb.dto.OrderDTO;

public interface IOrderService {
	List<OrderDTO> findAll(Pageable pageable);
	int getTotalItem();
	OrderDTO findById(String id);
	OrderDTO save(OrderDTO dto);
}
