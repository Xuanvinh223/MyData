package com.springboot.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "Students")
@Data
public class Student {
	@Id
	@Column(name = "email")
	private String email;

	@Column(name = "fullname")
	private String fullname;

	@Column(name = "marks")
	private int marks;

	@Column(name = "gender")
	private boolean gender;

	@Column(name = "country")
	private String country;
}
