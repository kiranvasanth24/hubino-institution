package com.spring.hubinoinstitution.repo;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spring.hubinoinstitution.model.Training;

@Repository
public interface TrainingRepo extends JpaRepository<Training, Integer> {
	
	@Query(value = "select * from training_details where user_id=:userId",nativeQuery = true)
	List<Training> findByUserId(int userId);
	
	@Transactional
	@Modifying
	@Query(value = "update training_details set is_deleted='1' where training_id=:id",nativeQuery = true)
	void deleteTrainingDetails(int id);

}
