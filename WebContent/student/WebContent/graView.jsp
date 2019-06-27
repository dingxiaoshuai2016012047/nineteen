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
		<%
			String Cno = request.getParameter("Cno");

			String sql1 = "select max(grade) from ELEC where ELEC.cid like '%" + Cno + "%'";//最高分     
			ResultSet rs1 = connDbBean.executeQuery(sql1);
			while (rs1.next()) {
				String sql11 = "select ELEC.sid,sname,sclass,grade from ELEC,STU where ELEC.sid=STU.sid and grade like '%"
						+ rs1.getString(1) + "%' and ELEC.cid like '%" + Cno + "%'";//最高分     
				ResultSet rs11 = connDbBean.executeQuery(sql11);
				while (rs11.next()) {
		%>
	<table>
		<tr>
			<td colspan="5">课程编号<%=Cno %>最高/最低分</td>
		</tr>
		<tr>
			<td>学生学号</td>
			<td>姓名</td>
			<td>班级</td>
			<td>成绩</td>
			<td>最高/低分</td>
		</tr>
		<tr>
			<td><%=rs11.getString(1)%></td>
			<td><%=rs11.getString(2)%></td>
			<td><%=rs11.getString(3)%></td>
			<td><%=rs11.getString(4)%></td>
			<td>最高分</td>
		</tr>
		<%
			}rs11.close();
			}rs1.close();

			String sql2 = "select min(grade) from ELEC where ELEC.cid like '%" + Cno + "%'";//最低分      
			ResultSet rs2 = connDbBean.executeQuery(sql2);
			while (rs2.next()) {
				String sql22 = "select ELEC.sid,sname,sclass,grade from ELEC,STU where ELEC.sid=STU.sid and grade like '%"
						+ rs2.getString(1) + "%' and ELEC.cid like '%" + Cno + "%'";//最高分     
				ResultSet rs22 = connDbBean.executeQuery(sql22);
				while (rs22.next()) {
		%>
		<tr>
			<td><%=rs22.getString(1)%></td>
			<td><%=rs22.getString(2)%></td>
			<td><%=rs22.getString(3)%></td>
			<td><%=rs22.getString(4)%></td>
			<td>最低分</td>
		</tr>
		<%
			}rs22.close();
			}rs2.close();

			connDbBean.closeStmt();
			connDbBean.closeConn();
		%>
	</table>
</body>
</html>