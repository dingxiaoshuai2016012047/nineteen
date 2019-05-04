<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查找</title>
</head>
<body>

	<table align="center">
		<tr>
			<td>********************************</td>
		</tr>
		<tr>
			<td align="center"><a href="add.jsp">1 插入</a></td>
		</tr>
		<tr>
			<td align="center"><a href="search.jsp">2 查找</a></td>
		</tr>
		<tr>
			<td align="center"><a href="del.jsp">3 删除</a></td>
		</tr>
		<tr>
			<td align="center"><a href="edit-1.jsp">4 修改</a></td>
		</tr>
		<tr>
			<td align="center"><a href="show.jsp">5 输出</a></td>
		</tr>
		<tr>
			<td align="center"><a href="session.jsp">6 退出</a></td>
		</tr>
		<tr>
			<td>********************************</td>
		</tr>
		<tr>
			<td align="center">2 查找结果</td>
		</tr>
	</table>

	<%
		//调用javabean后,获取提交的关键字，对数据库的name一列进行关键字查询显示

		request.setCharacterEncoding("utf-8");
		String str = request.getParameter("str");
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=StudentManage;user=sa;password=sa;";
		Connection conn = DriverManager.getConnection(connectionUrl);
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select * from Student where name like '%" + str + "%'";
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) 
		{
	%>

	<table align="center">
		<tr>
			<td>学号</td>
			<td><input value="<%=rs.getString(1)%>" size="25" /></td>
		</tr>
		<tr>
			<td>姓名</td>
			<td><input value="<%=rs.getString(2)%>" size="25" /></td>
		</tr>
		<tr>
			<td>出生</td>
			<td><input value="<%=rs.getString(3)%>" size="25" /></td>
		</tr>
		<tr>
			<td>性别</td>
			<td><input value="<%=rs.getString(4)%>" size="25" /></td>
		</tr>
	</table>

	<%
		}
		rs.close();
		stmt.close();
		conn.close();
	%>

</body>

</html>
