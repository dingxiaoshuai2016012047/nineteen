<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css">
<title>学生信息修改</title>
</head>
<body>
	<div>
		</br> 
		<a href="students.jsp">学生信息</a> 
		<a href="courses.jsp">课程信息</a>
		<a href="elect.jsp">选课信息</a> 
		<a href="login.jsp">退出登录</a>
	</div>
	<%
		String Sno = request.getParameter("Sno");
		String sql = "select * from STU where sid=" + Sno;
		ResultSet rs = connDbBean.executeQuery(sql);
		rs.next();
	%>
	<table>
		<tr>
			<td colspan="7"><h3><%=Sno%>同学：</td>
		</tr>
		<tr>
			<td>学生学号</td>
			<td>姓名</td>
			<td>出生日期</td>
			<td>班级</td>
			<td>确认</td>
		</tr>
		<form method="post" action="UpdateOneStudent?Sno=<%=Sno%>">
			<tr>
				<td><%=rs.getString("sid")%></td>
				<td><input name="Sname" type="text"
					value="<%=rs.getString("sname")%>" /></td>
				<td><input name="Sdate" type="text"
					value="<%=rs.getString("sbirthday")%>" /></td>
				<td><input name="Sclass" type="text"
					value="<%=rs.getString("sclass")%>" /></td>
				<td><input name="Submit" type="submit" value="确认修改" /></td>
			</tr>
		</form>
	</table>

	<%
		rs.close();
		connDbBean.closeStmt();
		connDbBean.closeConn();
	%>
</body>
</html>
