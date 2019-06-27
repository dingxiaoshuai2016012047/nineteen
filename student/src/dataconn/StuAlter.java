package dataconn;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import org.apache.catalina.connector.Request;

import com.nenu.stu.Student;
import dataconn.dataconn;

public class StuAlter {
	// 查询多个学生
	public ArrayList<Student> query() throws SQLException {
		dataconn da = new dataconn();
	
		 ArrayList<Student> studentsRealese = new ArrayList();
		 String sql = "select * from STU order by sid asc";
		 ResultSet rs = da.executeQuery(sql);
         while (rs.next()) {   
             Student stu = new Student();
             stu.setSid(rs.getString("sid"));
             stu.setSname(rs.getString("sname"));
             stu.setSbirthday(rs.getString("sbirthday"));
             stu.setSclass(rs.getInt("sclass"));
             studentsRealese.add(stu);
         }
         rs.close();
         da.closeStmt();
         da.closeConn();
		return studentsRealese;
	}

	public List<Student> queryStudent(String main,String select) {
		dataconn da = new dataconn();
		String sql = null;
		if (select.equals("Sno")) {
			sql = "select * from STU  where sid like '%" + main + "%' order by sid asc";
		} else if (select.equals("Sname")) {
			sql = "select * from STU  where sname like '%" + main + "%' order by sid asc";
		} else {
			sql = "select * from STU  where sclass like '%" + main + "%' order by sid asc";
		}
		ResultSet rs = da.executeQuery(sql);
		ArrayList<Student> list = new ArrayList<Student>();
		try {
			while (rs.next()) {
				Student student = new Student();
				student.setSid(rs.getString(1));
				student.setSname(rs.getString(2));
				student.setSbirthday(rs.getString(3));
				student.setSclass(Integer.parseInt(rs.getString(4)));
				list.add(student);
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		da.closeStmt();
		da.closeConn();
		return list;
		

	}

	public void delStudent(String sno) {
		dataconn da = new dataconn();
		String sql="delete  from STU where sid="+ sno +"";  
	    da.executeUpdate(sql);   
	    da.closeStmt();         
	    da.closeConn();   
	}

	public void updateStudent(String Sno,String Sname,String Sdate,int Sclass) {
		dataconn da = new dataconn();
		String sql="update STU set sname='"+ Sname +"', sbirthday='"+ Sdate +"' , sclass='"+ Sclass +"' where sid='"+ Sno +"'";  
		ResultSet rs = da.executeQuery(sql);   
	    da.closeStmt();         
	    da.closeConn();  
	}

	public void addStudent(String Sno,String Sname,String Sdate,int Sclass) throws SQLException {
		
		dataconn da = new dataconn();
		String sql="insert into STU(sid,sname,sbirthday,sclass) values('"+ Sno +"','"+ Sname +"','"+ Sdate +"','"+ Sclass +"')";  
		ResultSet rs = da.executeQuery(sql);
		da.closeStmt();
		da.closeConn();
	}
	
}
