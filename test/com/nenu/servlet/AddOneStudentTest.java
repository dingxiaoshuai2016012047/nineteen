package com.nenu.servlet;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.Test;

import com.nenu.stu.Course;

public class AddOneStudentTest {

	@Test
	public void testAddOneStudent() {
         Course course = new Course();
		
		course.setCid(new BigInteger("1"));
		assertEquals(new BigInteger("1"), course.getCid());
	}

}
