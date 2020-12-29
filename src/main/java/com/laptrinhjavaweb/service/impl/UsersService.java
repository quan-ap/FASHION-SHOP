package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.converter.UsersConverter;
import com.laptrinhjavaweb.dto.UsersDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.Util;

@Service
public class UsersService implements IUserService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UsersConverter userConverter;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private Util userId;
	
	@Override
	public void save(UsersDTO userDTO) {
		UserEntity userEntity = new UserEntity();
		RoleEntity roleEntity = new RoleEntity();
		userEntity = userConverter.toEntity(userDTO);
		String id = userId.takeId(userDTO.getFullname());
		userEntity.setId(id.concat(String.valueOf(userRepository.count() + 1)));
		userEntity.setStatus(1);
		userEntity.setPassword(bcrypt.encode(userDTO.getPassword()));
		
		roleEntity = roleRepository.findOne("2");
		List<RoleEntity> roleList = new ArrayList<RoleEntity>();
		roleList.add(roleEntity);
		userEntity.setRoles(roleList);
		
		List<UserEntity> uList = new ArrayList<UserEntity>();
		uList.add(userEntity);
		roleEntity.setUsers(uList);
		
		userRepository.save(userEntity);
	}

}
