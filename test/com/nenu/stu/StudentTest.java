package com.nenu.stu;

import static org.junit.Assert.*;

import org.junit.Test;

public class StudentTest {

	@Test
	public void testGetSid() {
		Student student = new Student();
		
		student.setSid(new String("201215101"));
		assertEquals(new String("201215101"), student.getSid());
		
		student.setSid(new String("201215202"));
		assertEquals(new String("201215202"), student.getSid());
		
		student.setSid(new String("201215303"));
		assertEquals(new String("201215303"), student.getSid());
		
		student.setSid(new String("201215405"));
		assertEquals(new String("201215405"), student.getSid());
	}

	@Test
	public void testGetSname() {
		Student student = new Student();
		
		student.setSname(new String("李英"));
		assertEquals(new String("李英"), student.getSname());
		
		student.setSname(new String("丁香"));
		assertEquals(new String("丁香"), student.getSname());
		
		student.setSname(new String("丁小帅"));
		assertEquals(new String("丁小帅"), student.getSname());
		
		student.setSname(new String("丁大帅"));
		assertEquals(new String("丁大帅"), student.getSname());
	}

	@Test
	public void testGetSbirthday() {
		Student student = new Student();
		
		student.setSbirthday(new String("19990201"));
		assertEquals(new String("19990201"), student.getSbirthday());
		
		student.setSbirthday(new String("19980514"));
		assertEquals(new String("19980514"), student.getSbirthday());
		
		student.setSbirthday(new String("19990305"));
		assertEquals(new String("19990305"), student.getSbirthday());
		
		student.setSbirthday(new String("19990101"));
		assertEquals(new String("19990101"), student.getSbirthday());
	}

	

}
