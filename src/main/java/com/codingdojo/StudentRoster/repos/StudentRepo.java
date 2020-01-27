package com.codingdojo.StudentRoster.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.StudentRoster.models.Student;

@Repository
public interface StudentRepo extends CrudRepository<Student, Long>{
	List<Student> findAll();
	List<Student> findByDormIsNull();
}
