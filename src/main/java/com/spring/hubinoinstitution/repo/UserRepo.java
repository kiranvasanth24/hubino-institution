package com.spring.hubinoinstitution.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.hubinoinstitution.model.Users;

@Repository
public interface UserRepo extends JpaRepository<Users, Integer>{

	Users findByUserName(String username);

}
