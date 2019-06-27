package com.nenu.servlet;

import java.sql.SQLException;
import java.util.ArrayList;

import com.nenu.stu.Student;

import dataconn.StuAlter;

public class queryAllStudents {
public static void main(String[] args) throws SQLException, ClassNotFoundException {
	StuAlter stu = new StuAlter();
	ArrayList<Student> ss= stu.query();
	for(Student i:ss) {
		System.out.println(i.getSid()+','+i.getSbirthday()+i.getSclass()+i.getSname());
	}
}
}
