package com.springboot.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.model.Student;


public interface StudenDAO extends JpaRepository<Student,String> {

}
