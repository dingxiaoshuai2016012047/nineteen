package com.nenu.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.nenu.stu.Student;

//import dataconn.StuAlter;
import dataconn.dataconn;;
/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		if (username == null || username.equals("") || password == null || password.equals("")) {
			response.sendRedirect("login.jsp");
		}else if (role.equals("teacher") && username.equals("admin") && password.equals("12345")) {
			response.sendRedirect("students.jsp");
			
			}else if (role.equals("student") && password.equals("123456789")) {
				String sql = "select * from STU where sid='" + username + "'";
				dataconn da = new dataconn();
				ResultSet rs = da.executeQuery(sql);
				
				try {
					if (rs.next()) {
						//request.setAttribute("Sno", username);
						HttpSession session=request.getSession();
						String name1 = rs.getString("sname");
						session.setAttribute("Sname", name1);
						session.setAttribute("Sno", username);
						rs.close();
						response.sendRedirect("mine.jsp");
						//request.getRequestDispatcher("mine.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				da.closeStmt();
				da.closeConn();
			}else {
				response.sendRedirect("login.jsp");
			} 
	}

}
