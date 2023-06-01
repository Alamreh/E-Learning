package com.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname=request.getParameter("name");
		String uemail=request.getParameter("email");
		String upass=request.getParameter("pass");
		String umob=request.getParameter("contact");
		String uconfirmpassword=request.getParameter("re_pass");
		
		String url="jdbc:mysql://localhost:3306/elearning?useSSL=false";
		String username="root";
		String dbpass="Tabrej@7860";
		
		RequestDispatcher dispatcher=null;
		Connection con=null;
		
		if(uname==null || uname.equals(""))
		{
			request.setAttribute("status", "invalidName");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(uemail==null || uemail.equals(""))
		{
			request.setAttribute("status", "invalidEmail");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(upass==null || upass.equals(""))
		{
			request.setAttribute("status", "invalidPassword");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		if(uconfirmpassword==null || uconfirmpassword.equals(""))
		{
			request.setAttribute("status", "invalidPassword");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		 if(!uconfirmpassword.equals(upass))
		{
			request.setAttribute("status", "passnotMatch");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}
		
		if(umob==null || umob.equals(""))
		{
			request.setAttribute("status", "invalidNumber");
			dispatcher=request.getRequestDispatcher("registration.jsp");
			dispatcher.forward(request, response);
		}else if(umob.length()>10)
		{
	    request.setAttribute("status", "invalidNumber");
		dispatcher=request.getRequestDispatcher("registration.jsp");
		dispatcher.forward(request, response);
			
		}
			 
		 
		try {
			Class.forName("com.mysql.jdbc.Driver");
			  con=DriverManager.getConnection(url,username,dbpass);
			PreparedStatement pst=con.prepareStatement("Insert into users (uname,uemail,upass,umobile) values (?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upass);
			pst.setString(4, umob);
			
		   int rowcount=	pst.executeUpdate();
		   dispatcher=request.getRequestDispatcher("registration.jsp");
		   if(rowcount>0)
		  {
			   request.setAttribute("status", "success");
			    
			   
		   }
		   else
			   request.setAttribute("status", "failed");
		  
		   dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		finally {
		   try {
			con.close();
		} catch (SQLException e) {
			 
			e.printStackTrace();
		}
		}
		
		
	}

}
