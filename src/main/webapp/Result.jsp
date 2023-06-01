 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


 
<!DOCTYPE html>
<html>
<head>
    <title>E-Learning</title>
     <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <style>
       body{
         background-image: linear-gradient(180deg, #73c0c9, #566e6c); 
       }
       </style>
</head>
<body>
    <h1>Result</h1>
    <% 
    try {
    	 Class.forName("com.mysql.cj.jdbc.Driver");
     	Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/jcaoqs","root","Tabrej@7860");
     	   PreparedStatement ps=conn.prepareStatement("Select * from java");
     	   ResultSet rs=ps.executeQuery();
         
        
        while (rs.next()) {
            String questionId = rs.getString("q_id");
            String correctAnswer = rs.getString("c_ans");
            String userAnswer = request.getParameter("answer_" + questionId);
            
            boolean isCorrect = correctAnswer.equalsIgnoreCase(userAnswer);
            
            out.println("<p>Question: " + rs.getString("question") + "</p>");
            out.println("<p>Correct Answer: " + correctAnswer + "</p>");
            out.println("<p>Your Answer: " + userAnswer + "</p>");
            out.println("<p>Result: " + (isCorrect ? "Correct" : "Incorrect") + "</p>");
            out.println("<hr>");
        }
        
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    %>
</body>
</html>
 