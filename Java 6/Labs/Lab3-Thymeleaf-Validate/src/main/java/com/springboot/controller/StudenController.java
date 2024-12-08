package com.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.springboot.model.Student;
@Controller
public class StudenController {
	
	
	@GetMapping(value = "/student/form")
	private String form(Model model) {
		model.addAttribute("student",new Student());
		return "student/form";
	}
	
	@PostMapping(value = "/student/save")
	private String save(@ModelAttribute("student") Student student) {
		return "student/success";
	}
}
