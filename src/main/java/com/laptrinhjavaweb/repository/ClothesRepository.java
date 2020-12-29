package com.laptrinhjavaweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.laptrinhjavaweb.entity.ClothesEntity;

public interface ClothesRepository extends JpaRepository<ClothesEntity, String>{
	List<ClothesEntity> findAllByTitle(String tile);
}
