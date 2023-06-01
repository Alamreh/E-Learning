package com.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Database {
	public static void main(String [] args) throws Exception
	{
		 
		Class.forName("com.mysql.jdbc.Driver");
		 
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/office?useSSL=false","root","Tabrej@7860");
       
       Scanner sc=new Scanner(System.in);
       String dept=sc.next();
       String sql="Select * from student where Dept=?";
       PreparedStatement ps=conn.prepareStatement(sql);
       ps.setString(1, dept);
       ResultSet rs=ps.executeQuery();
       while(rs.next())
       {
    	   System.out.println(rs.getInt("student_ID")+" "+rs.getString("student_Name"));
       }
        
		 
  
		
		
	}

}
