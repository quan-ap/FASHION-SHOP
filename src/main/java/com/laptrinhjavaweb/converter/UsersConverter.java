package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.UsersDTO;
import com.laptrinhjavaweb.entity.UserEntity;

@Component
public class UsersConverter {
	
	public UsersDTO toDto(UserEntity entity) {
		UsersDTO result = new UsersDTO();
		result.setId(entity.getId());
		result.setFullname(entity.getFullName());
		result.setPassword(entity.getPassword());
		result.setStatus(entity.getStatus());
		result.setUsername(entity.getUserName());
		return result;
	}
	
	public UserEntity toEntity(UsersDTO dto) {
		UserEntity result = new UserEntity();
		result.setFullName(dto.getFullname());
		result.setPassword(dto.getPassword());
		result.setStatus(dto.getStatus());
		result.setUserName(dto.getUsername());
		return result;
	}
	
	public UserEntity toEntity(UserEntity result, UsersDTO dto) {
		result.setFullName(dto.getFullname());
		result.setPassword(dto.getPassword());
		result.setStatus(dto.getStatus());
		result.setUserName(dto.getUsername());
		return result;
	}
	
}
