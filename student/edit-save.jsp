    <%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
    <html xmlns="http://www.w3.org/1999/xhtml">  
    <head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
    <title>save</title>  
    </head>  
      
    <body>  
    <%  
        request.setCharacterEncoding("utf-8");  
        String ID=request.getParameter("ID");//Ӧ���ж�һ��id�ĺϷ���  
        String name=request.getParameter("name");  
        String birDate=request.getParameter("birDate");  
        String gender=request.getParameter("gender"); 

        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");     
        String connectionUrl = "jdbc:sqlserver://localhost:1433;databaseName=StudentManage;user=sa;password=sa;";  
        Connection conn = DriverManager.getConnection(connectionUrl);        
        Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
        String sql="update Student set name='"+ name +"', birDate='"+ birDate +"' , gender='"+ gender +"'where ID="+ ID;  
        stmt.executeUpdate(sql);   
        stmt.close();         
        conn.close();   
        response.sendRedirect("edit-1.jsp");       
    %>  
      
    </body>  
    </html>  