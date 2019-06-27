<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>  
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>信息删除</title>
</head>
<body>
<%  
    request.setCharacterEncoding("utf-8");  
    String Sno=request.getParameter("Sno");//应该判断一下id的合法性  
    String sql="delete  from STU where sid="+ Sno +"";  
    connDbBean.executeUpdate(sql);   
    connDbBean.closeStmt();         
    connDbBean.closeConn();   
    response.sendRedirect("students.jsp");       
%>  
</body>
</html>