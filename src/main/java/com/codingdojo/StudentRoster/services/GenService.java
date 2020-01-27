package com.codingdojo.StudentRoster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.StudentRoster.models.Classs;
import com.codingdojo.StudentRoster.models.Contact;
import com.codingdojo.StudentRoster.models.Dorm;
import com.codingdojo.StudentRoster.models.Student;
import com.codingdojo.StudentRoster.repos.ClassRepo;
import com.codingdojo.StudentRoster.repos.ContactRepo;
import com.codingdojo.StudentRoster.repos.DormRepo;
import com.codingdojo.StudentRoster.repos.StudentRepo;

@Service
public class GenService {
	private final StudentRepo studentRepo;
	private final ContactRepo contactRepo;
	private final DormRepo dormRepo;
	private final ClassRepo classRepo;
	
	public GenService(StudentRepo studentRepo, ContactRepo contactRepo, DormRepo dormRepo, ClassRepo classRepo) {
		this.studentRepo = studentRepo;
		this.contactRepo = contactRepo;
		this.dormRepo = dormRepo;
		this.classRepo = classRepo;
	}
	
	// get all students
	public List<Student> getAllStudents() {
		return studentRepo.findAll();
	}
	// get student by id
	public Student getStudentById(Long id) {
		Optional<Student> opt = studentRepo.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		} else {
			return null;
		}
	}
	// get student with no dorm
	public List<Student> getNoneDormedStud() {
		return studentRepo.findByDormIsNull();
	}
	// create students
	public Student createStudent(Student student) {
		return studentRepo.save(student);
	}
	// create contact
	public Contact createContact(Contact contact) {
		return contactRepo.save(contact);
	}
	// create dorm
	public Dorm createDorm(Dorm dorm) {
		return dormRepo.save(dorm);
	}
	// get dorm by id
	public Dorm getDormById(Long id) {
		Optional<Dorm> opt = dormRepo.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		} else {
			return null;
		}
	}
	// get all dorms
	public List<Dorm> getAllDorms() {
		return dormRepo.findAll();
	}
	// get all classes
	public List<Classs> getAllClasses() {
		return classRepo.findAll();
	}
	// get class by id
	public Classs getClassById(Long id) {
		Optional<Classs> opt = classRepo.findById(id);
		if (opt.isPresent()) {
			return opt.get();
		} else {
			return null;
		}
	}
	// create class
	public Classs createClass(Classs classs) {
		return classRepo.save(classs);
	}
}
