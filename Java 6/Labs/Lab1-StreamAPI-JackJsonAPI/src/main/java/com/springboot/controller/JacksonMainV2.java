package com.springboot.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.w3c.dom.ls.LSOutput;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.exc.StreamReadException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.springboot.bean.Contact;
import com.springboot.bean.Student;

public class JacksonMainV2 {
	public static void main(String[] args) throws StreamReadException, DatabindException, IOException {
		demo7();
	}

	private static void demo7() throws JsonProcessingException {
		Contact contact = new Contact("vinhpxpc02986@fpt.edu.vn", "0926546560", null);
		List<String> subjects = Arrays.asList("IT17301","SP17301");
		Student student = new Student("Phạm Xuân Vinh", false, 6.7, contact, subjects);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(student);
		System.out.println(json);
	}

	private static void demo6() throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> student = new HashMap<String,Object>();
		Map<String, Object> contact = new HashMap<String,Object>();
		List<String> subjects = Arrays.asList("IT17301","SP17301");
		contact.put("email", "vinhpxpc02986@fpt.edu.vn");
		contact.put("phone", "0926546260");
		
		student.put("name", "Phạm Xuân vinh");
		student.put("marks", 5.6);
		student.put("gender",true);
		student.put("contact", contact);
		student.put("subjects", subjects);
		
		String json = mapper.writeValueAsString(student);
		System.out.println(json);
	}

	private static void demo5() throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode student = mapper.createObjectNode();
		student.put("name", "Phạm Xuân vinh");
		student.put("marks", 5.6);
		student.put("gender",true);
		ObjectNode contact = student.putObject("contact");
		contact.put("email", "vinhpxpc02986@fpt.edu.vn");
		contact.put("phone", "0926546260");
		ArrayNode subjects = student.putArray("subjects");
		subjects.add("IT17301");
		subjects.add("SP17301");
		
		String Json =mapper.writeValueAsString(student);
		mapper.writeValue(System.out, student);
		mapper.writeValue(new File("C:/Users/ACER/Documents/students.json"), student);
	}

	private static void demo4() throws StreamReadException, DatabindException, IOException {
		String json = "C:\\Users\\ACER\\eclipse-workspace\\Lab1-StreamAPI-JackJsonAPI\\src\\main\\resources\\static\\students.json";
		TypeReference<List<Student>> type = new TypeReference<List<Student>>() {};
		ObjectMapper mapper = new ObjectMapper();
		List<Student> students = mapper.readValue(new File(json), type);
		students.forEach(student -> System.out.println(student.getName()));
		
	}

	private static void demo3() throws StreamReadException, DatabindException, IOException {
		String json = "C:\\Users\\ACER\\eclipse-workspace\\Lab1-StreamAPI-JackJsonAPI\\src\\main\\resources\\static\\student.json";

		ObjectMapper mapper = new ObjectMapper();
		Student student = mapper.readValue(new File(json), Student.class);
		Contact contact = student.getContact();
		List<String> subjects = student.getSubjects();
		System.out.println(student.getName());
		System.out.println(student.getMarks());
		System.out.println(student.isGender());
		System.out.println(contact.getEmail());
		System.out.println(contact.getPhone());
		subjects.forEach(subject -> System.out.println(subject));
	}

	private static void demo2() throws StreamReadException, DatabindException, IOException {
		String json = "C:\\Users\\ACER\\eclipse-workspace\\Lab1-StreamAPI-JackJsonAPI\\src\\main\\resources\\static\\students.json";

		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> students = mapper.readValue(new File(json) , List.class);
		students.forEach(student -> System.out.println(student.get("name")));
	}

	private static void demo1() throws StreamReadException, DatabindException, IOException {
		String json = "C:\\Users\\ACER\\eclipse-workspace\\Lab1-StreamAPI-JackJsonAPI\\src\\main\\resources\\static\\student.json";

		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> student = mapper.readValue(new File(json), Map.class);
		System.out.println(student.get("name"));
		System.out.println(student.get("marks"));
		System.out.println(student.get("gender"));
		
		Map<String, Object> contact = (Map<String, Object>) student.get("contact");
		System.out.println(contact.get("email"));
		System.out.println(contact.get("phone"));
		
		List<String> subjects = (List<String>) student.get("subjects");
		subjects.forEach(subject -> System.out.println(subject));
	}
}
