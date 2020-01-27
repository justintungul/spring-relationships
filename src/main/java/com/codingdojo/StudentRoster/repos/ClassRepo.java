package com.codingdojo.StudentRoster.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.StudentRoster.models.Classs;

public interface ClassRepo extends CrudRepository<Classs, Long>{
	List<Classs> findAll();
}