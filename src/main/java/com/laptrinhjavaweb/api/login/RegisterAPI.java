package com.laptrinhjavaweb.api.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.UsersDTO;
import com.laptrinhjavaweb.service.IUserService;

@RestController(value = "registerAPI")
public class RegisterAPI {
	
	@Autowired
	private IUserService usersService;
	
	@PostMapping("/api/register")
	public void register(@RequestBody UsersDTO usersDTO) {
		usersService.save(usersDTO);
	}
	
}