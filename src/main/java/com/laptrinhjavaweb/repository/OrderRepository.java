package com.laptrinhjavaweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.OrderEntity;

public interface OrderRepository extends JpaRepository<OrderEntity, String>{

}
