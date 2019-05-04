<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改</title>
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
			<td align="center">3 修改</td>
		</tr>
	</table>

	<table border="1" cellspacing="0" cellpadding="1" align="center">
		<tr>
			<td align="center">ID</td>
			<td align="center">姓名</td>
			<td align="center">出生日期</td>
			<td align="center">性别</td>
			<td align="center">修改</td>
		</tr>

		<%
			//调用javabean后对数据库进行查询显示  

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=StudentManage;user=sa;password=sa;";
			Connection conn = DriverManager.getConnection(connectionUrl);
			Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			String sql = "select * from Student order by ID";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) 
			{
		%>
		
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><a href="edit-2.jsp?id=<%=rs.getString("id")%>">修改</a></td>
		</tr>
		
		<%
			}
			rs.close();
			stmt.close();
			conn.close();
		%>
		
	</table>

</body>

</html>
