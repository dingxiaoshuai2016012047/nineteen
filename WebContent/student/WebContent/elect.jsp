<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/biaoge.css" rel="stylesheet" type="text/css">
<title>选课信息</title>
</head>
<body>
	<div>
		</br> <a href="students.jsp">学生信息</a> <a href="courses.jsp">课程信息</a> <a
			href="elect.jsp">选课信息</a> <a href="login.jsp">退出登录</a>
	</div>
	<table>
	<caption>选课信息</caption>
		<tr>
			<td>学生学号</td>
			<td>姓名</td>
			<td>班级</td>
			<td>课程编号</td>
			<td>课程名</td>
			<td>成绩</td>
		</tr>
		<%
			//定义四个变量
			int page_persize = 10;//每页显示记录数
			int page_total = 0;//总的页数
			int page_now = 1;//当前页码
			int rs_total = 0;//总的记录数
			//产生结果集

			String sql = "select STU.sid,sname,sclass,ELEC.cid,cname,grade from STU,COUS,ELEC where STU.sid=ELEC.sid and ELEC.cid=COUS.cid";
			ResultSet rs = connDbBean.executeQuery(sql);
			//计算总的记录数  
			rs.last();//指针到最后一条记录
			rs_total = rs.getRow();//读出当前行号即总的记录数
			//计算总的页数
			if (rs_total % page_persize == 0)
				page_total = rs_total / page_persize;
			else
				page_total = rs_total / page_persize + 1;
			//计算当前页码
			try {
				if (!(request.getParameter("page_now") == null || request.getParameter("page_now").equals("")))
					page_now = Math.min(Math.abs(Integer.parseInt(request.getParameter("page_now"))), page_total);
			} catch (java.lang.NumberFormatException e) {
				out.print("指定页码格式不正确" + e);
			}
			if (page_now == 0)
				page_now = 1;

			//指针跳转到要访问的页码的第一条记录
			rs.absolute((page_now - 1) * page_persize + 1);
			//循环显示当前页码的内容
			for (int i = 1; i <= page_persize; i++) {
		%>

		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>

		</tr>
		<%
			if (!rs.next())
					break;//如果记录数不够则中断循环
			}
			//关闭  
			rs.close();
			connDbBean.closeStmt();
			connDbBean.closeConn();
		%>
		<tr>
			<td colspan="6">
				<%
					//显示页码导航，其中的问号表示由当前页面处理。
					out.print("总共" + rs_total + "条信息　");
					if (page_total > 1) {
						out.print("当前第" + page_now + "页　");
						out.print("共" + page_total + "页　");
						if (page_now != 1) {
							out.print("<a href=?page_now=1>首页</a>　");
							out.print("<a href=?page_now=" + (page_now - 1) + ">上一页</a>　");
						}
						if (page_now != page_total) {
							out.print("<a href=?page_now=" + (page_now + 1) + ">下一页</a>　");
							out.print("<a href=?page_now=" + page_total + ">尾页</a>　");
						}
					}
				%>
			</td>
		</tr>
	</table>
</body>
</html>