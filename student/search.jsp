<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>查找</title>
</head>

<body>

	<table style="align: center">
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
			<td align="center">2 查找</td>
		</tr>
		<tr>
			<td align="center">
				<form method='post' action="search-end.jsp">
					<input type="text" name="str"> 
					<input type="submit" value="查找">
				</form>
			</td>
		</tr>
	</table>

</body>

</html>
