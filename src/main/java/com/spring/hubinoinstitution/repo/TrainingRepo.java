package com.spring.hubinoinstitution.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.hubinoinstitution.model.Training;

@Repository
public interface TrainingRepo extends JpaRepository<Training, Integer> {

}
