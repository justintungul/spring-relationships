package com.codingdojo.StudentRoster.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.StudentRoster.models.Classs;
import com.codingdojo.StudentRoster.models.Contact;
import com.codingdojo.StudentRoster.models.Dorm;
import com.codingdojo.StudentRoster.models.Student;
import com.codingdojo.StudentRoster.services.GenService;

@Controller
public class HomeController {
	private final GenService genServ;
	
	public HomeController(GenService genServ) {
		this.genServ = genServ;
	}

	@RequestMapping("/")
	public String homeRedirect() {
		return "redirect:/students";
	}
	
	// show all students
	@RequestMapping("/students")
	public String index(Model model) {
		List<Student> students = genServ.getAllStudents();
		model.addAttribute("students", students);
		return "all_students.jsp";
	}
	
	// new student view
	@RequestMapping("/student/new")
	public String newStudent(@ModelAttribute("student") Student student) {
		return "new_student.jsp";
	}
	// submit student
	@RequestMapping(value="/student/submit", method=RequestMethod.POST)
	public String submitStudent(@Valid @ModelAttribute("student") Student student, BindingResult result) {
		if (result.hasErrors()) {
			return "new_student.jsp";
		} else {
			genServ.createStudent(student);
			return "redirect:/students";			
		}
	}
	
	// new contact view
	@RequestMapping("/contact/new")
	public String newContact(@ModelAttribute("contact") Contact contact, Model model) {
		List<Student> students = genServ.getAllStudents();
		model.addAttribute("students", students);
		return "new_contact.jsp";
	}
	// submit contact
	@RequestMapping(value="/contact/submit", method=RequestMethod.POST)
	public String submitContact(@Valid @ModelAttribute("contact") Contact contact, BindingResult result, Model model) {
		if (contact.getStudent() == null) {
			result.rejectValue("student", "student", "Please choose a student");
		}
		if (result.hasErrors()) {
			List<Student> students = genServ.getAllStudents();
			model.addAttribute("students", students);
			return "new_contact.jsp";
		} else {
			genServ.createContact(contact);
			return "redirect:/students";
		}
	}
	//// DORM
	// new dorm view
	@RequestMapping("/dorm/new")
	public String newDorm(@ModelAttribute("dorm") Dorm dorm) {
		return "new_dorm.jsp";
	}
	// submit dorm
	@RequestMapping(value="/dorm/submit", method=RequestMethod.POST)
	public String submitDorm(@Valid @ModelAttribute("dorm") Dorm dorm, BindingResult result) {
		if (result.hasErrors()) {
			return "new_dorm.jsp";
		} else {
			dorm = genServ.createDorm(dorm);
			return "redirect:/dorms/" + dorm.getId();
		}
	}
	// show dowm (intital dorm page)
	@RequestMapping("/dorms/{id}")
	public String showDrom(@PathVariable("id") Long id, Model model) {
		Dorm dorm = genServ.getDormById(id);
		List<Student> students = genServ.getNoneDormedStud();
		List<Dorm> dorms = genServ.getAllDorms();
		
		dorms.remove(dorm);
		students.removeAll(dorm.getStudents());
		
		model.addAttribute("dorms", dorms);
		model.addAttribute("students", students);
		model.addAttribute("dorm", dorm);
		return "show_dorm.jsp";
	}
	// show dorm POST (to view another dorm)
	@RequestMapping(value="/dorm/show", method=RequestMethod.POST)
	public String redirectToGetRoute(@RequestParam(value="dorm_id") Long dorm_id) {
		return "redirect:/dorms/" + dorm_id;
	}
	// add student to dorm
	@RequestMapping(value="/dorm/student/add", method=RequestMethod.POST)
	public String addTenant(@RequestParam(value="student_id") Long student_id, @RequestParam(value="dorm_id") Long dorm_id) {
		Dorm dorm = genServ.getDormById(dorm_id);			// get dorm
		Student student = genServ.getStudentById(student_id);
		student.setDorm(dorm);
		genServ.createStudent(student);
		
		return "redirect:/dorms/" + dorm_id;
	}
	// remove tenant
	@RequestMapping("/student/remove/{id}/{dorm_id}")
	public String removeTenant(@PathVariable("id") Long id, @PathVariable("dorm_id") Long dorm_id) {
		Student student = genServ.getStudentById(id);
		student.setDorm(null);
		genServ.createStudent(student);
		
		return "redirect:/dorms/" + dorm_id;
	}
	//// CLASS
	// new class view
	@RequestMapping("/class/new")
	public String newClass(@ModelAttribute("classs") Classs classs) {
		return "new_class.jsp";
	}
	// submit class
	@RequestMapping(value="/class/submit", method=RequestMethod.POST)
	public String submitClass(@Valid @ModelAttribute("classs") Classs classs, BindingResult result) {
		if (result.hasErrors()) {
			return "new_class.jsp";
		} else {
			genServ.createClass(classs);
			return "redirect:/";			
		}
	
	}
	// show student
	@RequestMapping("/student/{id}")
	public String showStudent(@PathVariable("id") Long id, Model model, HttpSession session) {
		Student student = genServ.getStudentById(id);
		List<Classs> classes = genServ.getAllClasses();
		classes.removeAll(student.getClasses());
		
		session.setAttribute("student_id", student.getId());
		model.addAttribute("classes", classes);
		model.addAttribute("student", student);
		return "show_student.jsp";
	}
	// add class to student
	@RequestMapping(value="/class/add", method=RequestMethod.POST)
	public String addStudentToClass(@RequestParam(value="student_id") Long student_id, @RequestParam(value="class_id") Long class_id) {
		Student student = genServ.getStudentById(student_id);
		Classs classs = genServ.getClassById(class_id);
		List<Classs> classes = student.getClasses();
		classes.add(classs);
		student.setClasses(classes);
		genServ.createStudent(student);
		return "redirect:/student/" + student_id;
	}
	// show class
	@RequestMapping("/class/{id}")
	public String showClass(@PathVariable("id") Long id, Model model) {
		model.addAttribute("class", genServ.getClassById(id));
		return "show_class.jsp";
	}
	// drop classes
	@RequestMapping("/class/drop/{class_id}")
	public String dropClass(@PathVariable("class_id") Long class_id, HttpSession session, RedirectAttributes redirectAttribute) {
		Long student_id = (Long) session.getAttribute("student_id");
		System.out.println(student_id);
		Student student = genServ.getStudentById(student_id);
		List<Classs> classes = student.getClasses();
		classes.remove(genServ.getClassById(class_id));
		student.setClasses(classes);
		genServ.createStudent(student);
		redirectAttribute.addAttribute("success", "Successfully dropped class");
		return "redirect:/student/" + student_id;
	}
}
