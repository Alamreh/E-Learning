 

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest"  %>
<!-- check whether user is logged in or not -->
<%
if(session.getAttribute("name")==null)
{
	response.sendRedirect("login.jsp");
}
%>  

 
<!DOCTYPE html>
<html>
<head>
    <title>E-learning</title>
    <link rel="stylesheet" type="text/css" href="css/nav.css">
</head>
<body>
    
    <div > 
     <nav>
    <ul>
      <li><a href="OQDESCP.jsp">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Contact</a></li>
       <div class="nav-right-side"> 
            <li ><a href="#">Profile</a></li>
             <li ><a href="login.jsp">Logout</a></li>
           
             
             
        </div>
    </ul>
    
  </nav>
    <form action="Result.jsp" method="post">
     

 <div class="question"> 
        <% 
        try {
        	String choice=request.getParameter("choice");
        	 Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/jcaoqs","root","Tabrej@7860");
        	   PreparedStatement ps=conn.prepareStatement("Select * from "+choice);
        	   ResultSet rs=ps.executeQuery();
            
            
            while (rs.next()) {
                String questionId = rs.getString("q_id");
                String questionText = rs.getString("question");
        
                out.println("<p>" +"Question:"+questionId+" "+ questionText + "</p>");
                out.print("<p>"+"Ans: ");
                out.println("<input type='text' name='answer_" + questionId + "'><br>");
                
            }
            
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        %>
        <br>
        <input type="submit" value="Submit">
        </div>
    </form>
    </div>
</body>
</html>
