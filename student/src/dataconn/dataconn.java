package dataconn;  
import java.sql.*;  
  
public class  dataconn{  
      
    String sConnStr = "jdbc:sqlserver://localhost:1433;DatabaseName=student";  
    String user="sa";   
    String password="sa";   
    static Connection conn = null;  
    Statement stmt = null;  
    ResultSet rs = null;  
  
public dataconn() {  
	try {  
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
		}  
	catch(java.lang.ClassNotFoundException e) {  
		System.err.println("news_conn(): " + e.getMessage());  
	}  
}  
 
public ResultSet executeQuery(String sql) {  
	rs = null;  
	try {  
		conn = DriverManager.getConnection(sConnStr,user,password);   
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
		rs = stmt.executeQuery(sql);  
		}   
	catch(SQLException ex) {   
		System.err.println("aq.executeQuery: " + ex.getMessage());  
		System.err.println("aq.executeQuerystrSQL: " + sql);  
	}  
	return rs;  
}  
  
          
public void executeUpdate(String sql) {  
	try {  
		conn = DriverManager.getConnection(sConnStr,user,password);   
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
		stmt.executeUpdate(sql);  
		}   
	catch(SQLException ex) {   
		System.err.println("aq.executeUpdate: " + ex.getMessage());  
		System.err.println("aq.executeUpadatestrSQL: " + sql);  
		}  
}  
          
public void closeStmt()  
    {  
	try{  
		stmt.close();  
	   }  
	catch(SQLException e){  
		e.printStackTrace();  
	   }  
    }  
  
      
public void closeConn()  
	{  
	try{  
		conn.close();  
	   }  
	catch(SQLException e){  
		e.printStackTrace();  
	   }  
	} 
}