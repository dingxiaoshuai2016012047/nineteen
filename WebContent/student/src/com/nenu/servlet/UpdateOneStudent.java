package com.nenu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataconn.StuAlter;

/**
 * Servlet implementation class UpdateOneStudent
 */
@WebServlet("/UpdateOneStudent")
public class UpdateOneStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOneStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  
	    String Sno=request.getParameter("Sno");  
	    String Sname=request.getParameter("Sname");  
	    String Sdate=request.getParameter("Sdate");  
	    int Sclass=Integer.parseInt(request.getParameter("Sclass")); 
		StuAlter stu = new StuAlter();
		stu.updateStudent(Sno,Sname,Sdate,Sclass);
		response.sendRedirect("students.jsp");
	
	}

}
