package com.laptrinhjavaweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.ClothesDTO;
import com.laptrinhjavaweb.service.IClothesService;

@RestController(value = "clothesAPIOfAdmin")
public class ClothesAPI {
	
	@Autowired
	private IClothesService clothesService;
	
	@PostMapping("/api/clothes")
	public ClothesDTO createNew(@RequestBody ClothesDTO clothesDTO) {
		return clothesService.save(clothesDTO);
	}
	
	@PutMapping("/api/clothes")
	public ClothesDTO updateNew(@RequestBody ClothesDTO clothesDTO) {
		return clothesService.save(clothesDTO);
	}
	
	@DeleteMapping("/api/clothes")
	public void deleteNew(@RequestBody String[] ids) {
		clothesService.delete(ids);
	}
	
}
