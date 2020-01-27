package com.codingdojo.StudentRoster.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.StudentRoster.models.Dorm;

@Repository
public interface DormRepo extends CrudRepository<Dorm, Long>{
	List<Dorm> findAll();
}
