package com.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CheckAnswer extends HttpServlet{
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jcaoqs?useSSL=false", "root","Tabre@7860");
			PreparedStatement ps=conn.prepareStatement("Select * from java");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String question=rs.getString("question");
				String answer=rs.getString("c_ans");
		        req.setAttribute("question", question);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
