package com.nenu.stu;

import static org.junit.Assert.*;
import java.math.BigInteger;
import org.junit.Test;

public class CourseTest {
	 
	@Test
	public void testGetCid() {
       
		Course course = new Course();
		
		course.setCid(new BigInteger("1"));
		assertEquals(new BigInteger("1"), course.getCid());
		
		course.setCid(new BigInteger("2"));
		assertEquals(new BigInteger("2"), course.getCid());
		
		course.setCid(new BigInteger("3"));
		assertEquals(new BigInteger("3"), course.getCid());
		
		course.setCid(new BigInteger("4"));
		assertEquals(new BigInteger("4"), course.getCid());
		
		course.setCid(new BigInteger("5"));
		assertEquals(new BigInteger("5"), course.getCid());
	}

	@Test
	public void testGetCname() {
        Course course = new Course();
		
		
		course.setCname(new String("数据库"));
		assertEquals(new String("数据库"), course.getCname());
		
		course.setCname(new String("操作系统"));
		assertEquals(new String("操作系统"), course.getCname());
		
		course.setCname(new String("数据结构"));
		assertEquals(new String("数据结构"), course.getCname());
		
		course.setCname(new String("计算机网络"));
		assertEquals(new String("计算机网络"), course.getCname());
		
	}

}
