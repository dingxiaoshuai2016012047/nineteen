package com.nenu.stu;

//import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
//import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;

import dataconn.StuAlter;

public class StudentAlterTest {
	static StuAlter stuAlter = null;
	@BeforeClass
	public static void beforeClass() {
		stuAlter = new StuAlter();
	}
	@Test
	public void query() throws SQLException {
		
//		StuAlter stuAlter = new StuAlter();
//		List<Student> students = stuAlter.query();
//		assertTrue(students.size()>0);
	}
	@Test
	public void addStudent() throws SQLException {
		Student student = new Student();
		student.setSid("1");
		student.setSname("1");
		student.setSbirthday("1");
		student.setSclass(1);
		stuAlter.addStudent(student.getSid(), student.getSname(), student.getSbirthday(),student.getSclass());
	}
	@Test
	public void delStudent() {
		stuAlter.delStudent("1");
	}
}
