<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css">
<title>课程信息</title>
</head>
<body>
	<div>
		</br> <a href="students.jsp">学生信息</a> <a href="courses.jsp">课程信息</a> <a
			href="elect.jsp">选课信息</a> <a href="login.jsp">退出登录</a>
	</div>
	<form method="post" action="stuView.jsp">
		选课全体学生查询: <select name="Cno">
			<option value="1">数据库</option>
			<option value="2">操作系统</option>
			<option value="3">数据结构</option>
			<option value="4">Java语言</option>
			<option value="5">计算机网络</option>
			<option value="6">计算机组成原理</option>
		</select> <input type="submit" value="查  询" />
	</form>

	<form method="post" action="graView.jsp">
		课程最高/低分查询 <select name="Cno">
			<option value="1">数据库</option>
			<option value="2">操作系统</option>
			<option value="3">数据结构</option>
			<option value="4">Java语言</option>
			<option value="5">计算机网络</option>
			<option value="6">计算机组成原理</option>
		</select> <input type="submit" value="查  询" />
	</form>

	<table>
	<caption>课程信息</caption>
		<tr>
			<td>课程编号</td>
			<td>课程名</td>
		</tr>
		<%
			String sql = "select * from COUS";
			ResultSet rs = connDbBean.executeQuery(sql);
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<%
			}
			rs.close();
			connDbBean.closeStmt();
			connDbBean.closeConn();
		%>
	</table>
</body>
</html>
