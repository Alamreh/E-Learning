package com.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uemail=request.getParameter("username");
		String upass=request.getParameter("password");
		
	 
  
		
		RequestDispatcher dispatcher=null;
		 
		HttpSession session=request.getSession();
		
		//Email Validation
		if(uemail==null || uemail.equals(""))
		{
			request.setAttribute("status", "invalidEmail");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		//password validation
		if(upass==null || upass.equals(""))
		{
            request.setAttribute("status", "invalidPassword");
			dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}
		 	 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning?useSSL=false","root","Tabrej@7860");
			PreparedStatement pst=conn.prepareStatement("Select * from users where uemail= ? and upass= ? ");
			pst.setString(1, uemail);
			pst.setString(2, upass);
			
			ResultSet rst=pst.executeQuery();
			if(rst.next())
			{
				session.setAttribute("name", rst.getString("uname"));
			   dispatcher=request.getRequestDispatcher("OQDescP.jsp");
			}
			else
				 {
				   dispatcher=request.getRequestDispatcher("login.jsp");
				   request.setAttribute("status", "failed");
				   
				 }
			dispatcher.forward(request, response);
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		} 
 
	
		
	
	}

}
