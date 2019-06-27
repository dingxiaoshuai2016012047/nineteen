<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css">
<title>选课学生</title>
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
		<%
			String Cno = request.getParameter("Cno");
		%>
		<tr>
			<td colspan="5"><h3>课程编号 <%=Cno%> 选课学生</h3>
			</td>
		</tr>
		<%
			String sql = "select COUS.cid,cname, ELEC.sid,sname,grade from COUS,ELEC,STU where COUS.cid=ELEC.cid and ELEC.sid=STU.sid and COUS.cid like '%"
					+ Cno + "%'";
			ResultSet rs = connDbBean.executeQuery(sql);
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
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