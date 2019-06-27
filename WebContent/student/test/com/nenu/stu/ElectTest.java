package com.nenu.stu;

import static org.junit.Assert.*;

import java.math.BigInteger;

import org.junit.Test;

public class ElectTest {

	@Test
	public void testGetSid() {
		Elect elect = new Elect();
		
		elect.setSid(new BigInteger("201215101"));
		assertEquals(new BigInteger("201215101"), elect.getSid());
		
		elect.setSid(new BigInteger("201215202"));
		assertEquals(new BigInteger("201215202"), elect.getSid());
		
		elect.setSid(new BigInteger("201215303"));
		assertEquals(new BigInteger("201215303"), elect.getSid());
		
		elect.setSid(new BigInteger("201215404"));
		assertEquals(new BigInteger("201215404"), elect.getSid());
		
		elect.setSid(new BigInteger("201215505"));
		assertEquals(new BigInteger("201215505"), elect.getSid());
	}

	@Test
	public void testGetCid() {
		Elect elect = new Elect();
		
		elect.setCid(new BigInteger("1"));
		assertEquals(new BigInteger("1"), elect.getCid());
		
		elect.setCid(new BigInteger("2"));
		assertEquals(new BigInteger("2"), elect.getCid());
		
		elect.setCid(new BigInteger("3"));
		assertEquals(new BigInteger("3"), elect.getCid());
		
		elect.setCid(new BigInteger("4"));
		assertEquals(new BigInteger("4"), elect.getCid());
		
	}

	@Test
	public void testGetGrade() {
		Elect elect = new Elect();
		
		elect.setGrade(new String("89"));
		assertEquals(new String("89"), elect.getGrade());
		
		elect.setGrade(new String("90"));
		assertEquals(new String("90"), elect.getGrade());
		
		elect.setGrade(new String("74"));
		assertEquals(new String("74"), elect.getGrade());
		
		elect.setGrade(new String("68"));
		assertEquals(new String("68"), elect.getGrade());
	}

}
