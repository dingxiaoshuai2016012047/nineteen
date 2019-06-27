<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css">
<title>我的信息</title>
</head>
<body>
	<%
		String Sno = (String) session.getAttribute("Sno");
		String Sname = (String) session.getAttribute("Sname");
		
	%>
	<table>
		<tr >
			<td colspan="7" ><%=Sname%>同学：<a href="login.jsp">退出登录</a></td>
		</tr>
		<tr>
			<td>学生学号</td>
			<td>姓名</td>
			<td>出生日期</td>
			<td>班级</td>
			<td>课程编号</td>
			<td>课程名</td>
			<td>成绩</td>
		</tr>
		<%
			String sql = "select STU.sid,sname,sbirthday,sclass,ELEC.cid,cname,grade from STU,COUS,ELEC where STU.sid like '%" + Sno
					+ "%' and STU.sid=ELEC.sid and ELEC.cid=COUS.cid";
			ResultSet rs = connDbBean.executeQuery(sql);
			while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
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