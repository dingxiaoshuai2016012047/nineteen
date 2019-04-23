    <%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
    <html xmlns="http://www.w3.org/1999/xhtml">  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>修改</title>  
    </head>  
      
    <body>  
    <table align="center">
    <tr><td>********************************</td></tr>
    <tr><td  align="center"><a href="add.jsp">1 插入</a>  </td></tr>
    <tr><td  align="center"><a href="search.jsp">2 查找</a></td></tr>
    <tr><td  align="center"><a href="del.jsp">3 删除</a></td></tr>
    <tr><td  align="center"><a href="edit-1.jsp">4 修改</a></td></tr>
    <tr><td  align="center"><a href="show.jsp">5 输出</a></td></tr>
    <tr><td align="center"><a href="session.jsp">6 退出</a></td></tr>
    <tr><td>********************************</td></tr>
    <tr><td align="center">4 修改</td></tr>
    </table>
    <%  
    String ID=request.getParameter("id");  
     
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");     
    String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=StudentManage;user=sa;password=sa;";  
    Connection conn = DriverManager.getConnection(connectionUrl);        
    Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
    String sql="select * from Student where ID="+ ID;         
    ResultSet rs=stmt.executeQuery(sql);    
    rs.next();  
    %>  
    <form id="form1" name="form1" method="post" action="edit-save.jsp?ID=<%=ID%>">  
    <table align="center">
    <tr>
    <td>学号</td>
    <td><%=rs.getString(1)%></td>
    </tr>
    <tr>
    <td>姓名</td>
    <td><input name="name" type="text" id="name" value="<%=rs.getString("name")%>" size="25" /> </td>
    </tr>
    <tr>
    <td>出生</td>
    <td><input name="birDate" type="text" id="birDate" value="<%=rs.getString("birDate")%>" size="25" /></td>
    </tr>
    <tr>
    <td>性别</td>
    <td>
    <select name="gender" id="gender"  style="width:100%">
    <option value ="男">男</option>
    <option value ="女">女</option>
    </select>
    </td>  
    </tr>
    <tr>
    <td></td>
    <td align="right"><input type="submit" name="Submit" value="确定修改" /> </td> 
    </table>
    </form>  
      
    <%  
    rs.close();         
    stmt.close();         
    conn.close();           
      
    %>  
    </body>  
    </html>  