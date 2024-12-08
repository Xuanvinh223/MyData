package com.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.objenesis.instantiator.basic.NewInstanceInstantiator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springboot.DAO.studentDAO;
import com.springboot.model.Student;
import com.springboot.model.StudentMap;

@Controller
public class StudentController {

	@Autowired
	studentDAO dao;

	@RequestMapping(value = "/student/index")
	private String index(Model model) {
		
		StudentMap map = dao.findAll();
		model.addAttribute("students", map);
		model.addAttribute("form", new Student());
		return "index";
	}
	
	@GetMapping(value = "/student/edit/{key}")
	private String edit(Model model, @PathVariable("key") String key) {
		model.addAttribute("key",key);
		Student student = dao.findByKey(key);
		model.addAttribute("form",student);
		StudentMap map = dao.findAll();
		model.addAttribute("students", map);
		return "index";
	}
	
	@PostMapping(value = "/student/create")
	private String create(Model model, Student student) {
		dao.create(student);
		return "redirect:/student/index";
	}
	
	@PostMapping(value = "/student/update/{key}")
	private String update(Model model,@PathVariable("key") String key, Student student) {
		dao.update(key,student);
		return "redirect:/student/index";
	}
	
	@RequestMapping(value = "/student/delete/{key}")
	private String delete(Model model,@PathVariable("key") String key) {
		dao.delete(key);
		return "redirect:/student/index";
	}
}
