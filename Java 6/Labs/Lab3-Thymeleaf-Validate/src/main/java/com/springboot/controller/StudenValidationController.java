package com.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.springboot.model.StudentValidation;

import jakarta.validation.Valid;
@Controller
public class StudenValidationController {
	
	
	@GetMapping(value = "/validation/form")
	private String form(Model model) {
		model.addAttribute("student",new StudentValidation());
		return "validation/form";
	}
	
	@PostMapping(value = "/validation/save")
	private String save(@Valid @ModelAttribute("student") StudentValidation student, Errors error) {
		
		if(error.hasErrors()) {
			return "validation/form";
		}
		
		return "validation/success";
	}
}
