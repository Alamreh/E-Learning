package com.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String newPassword=request.getParameter("password");
		String confPassword=request.getParameter("confPassword");
		
		RequestDispatcher dispatcher=null;
		if(newPassword!=null && confPassword!=null && newPassword.equals(confPassword))
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/elearning?useSSL=false","root","Tabrej@7860");
				PreparedStatement pst=conn.prepareStatement("Update users set upwd = ? where uemail =? ");
				pst.setString(1, newPassword);
				pst.setString(2,(String)session.getAttribute("email"));
				
				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					dispatcher = request.getRequestDispatcher("login.jsp");
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("login.jsp");
				}
				dispatcher.forward(request, response);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
	}

}
