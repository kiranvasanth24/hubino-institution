package com.spring.hubinoinstitution.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.hubinoinstitution.model.Users;
import com.spring.hubinoinstitution.repo.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo userRepo;
	
	public String registerUser(Users users)
	{
		 userRepo.save(users);
		 return "success";
	
	}
	public String loginUser(String username,String password)
	{
		Users users=userRepo.findByUserName(username);
		if(users == null) {
			return "failure";
		}
		else {
			String dbpwd=users.getPassword();
			if(dbpwd.equals(password))
			  return "success";
			else
			  return "failure";
		}
	}
}
