<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css">
<title>登录</title>
</head>
<style type="text/css">
table{
	width:400px;
}
</style>
<body>
<table>
	<%
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		if (username == null || username.equals("") || password == null || password.equals("")) {
	%>
	<tr><td>用户名或密码不能为空</td></tr>
	<tr><td><a href='login.html'>重新登录</a></td></tr>
	<%
			return;
		} else if (role.equals("teacher") && username.equals("admin") && password.equals("12345")) {
			response.sendRedirect("students.jsp");
		} else if (role.equals("student") && password.equals("123456789")) {
			String sql = "select * from STU where sid='" + username + "'";
			ResultSet rs = connDbBean.executeQuery(sql);
			if (rs.next()) {
				session.setAttribute("Sno", username);
				rs.close();
				response.sendRedirect("mine.jsp");
			}
			connDbBean.closeStmt();
			connDbBean.closeConn();
		} else {
	%>
	<tr><td>其他错误！</td></tr>
	<tr><td><a href='login.html'>重新登录</a></td></tr>
	<%
		}
	%>
</tr></table>
</body>
</html>




