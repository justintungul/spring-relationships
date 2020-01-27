package com.codingdojo.StudentRoster.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.StudentRoster.models.Contact;

@Repository
public interface ContactRepo extends CrudRepository<Contact, Long>{
	List<Contact> findAll();
}
