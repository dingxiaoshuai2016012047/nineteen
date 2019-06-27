<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css"/>
<title>学生信息查询</title>
</head>
<body>
	<div>
		</br> 
		<a href="students.jsp">学生信息</a> 
		<a href="courses.jsp">课程信息</a>
		<a href="elect.jsp">选课信息</a> 
		<a href="login.jsp">退出登录</a>
	</div>
	<table>
		<tr>
			<td colspan="4"><h3>查询结果</h3></td>
		</tr>
		<tr>
			<td>学生学号</td>
			<td>姓名</td>
			<td>出生日期</td>
			<td>班级</td>
		</tr>
		<c:forEach items="${list}" var="student">
			<tr>
				<td>${student.getSid()}</td>
				<td>${student.getSname()}</td>
				<td>${student.getSbirthday()}</td>
				<td>${student.getSclass() }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
