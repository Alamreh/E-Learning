<%-- <%@page import="java.awt.Dialog"%>  
 
<html>
<body> 
<div >

    <div >
        <div class="calendar_box_content">
            <h1>Welcome to my Site</h1>
            <marquee direction="left" style="color: navy;" onmouseover="stop()" onmouseout="start()"><B>Assess Yourself by taking quizs on various sunject</B></marquee>

            <form method="post" action="saveques.jsp" >
                <table>
                    <tr><td>Question:</td><td><textarea rows="3" cols="" name="question" ></textarea></td></tr>
                    <tr><td>Option1:</td><td><input type="text" name="option1" /></td></tr>	
                    <tr><td>Option2:</td><td><input type="text" name="option2" /></td></tr>
                    <tr><td>Option3:</td><td><input type="text" name="option3" /></td></tr>
                    <tr><td>Option4:</td><td><input type="text" name="option4" /></td></tr>
                    <tr><td>Answer:</td><td><input type="text" name="answer" /></td></tr>	
                    <tr><td>Description:</td><td><input type="text" name="description" /></td></tr>			
                    <tr><td></td><td><input type="submit" value="Next"></td></tr>
                    <br>
                    <br>
                </table>
            </form>
        </div>
    </div>
</div><!--end of right content-->

</div> <!--end of center box-->
</div> <!--end of main content-->
</div> <!--end of main container-->
</body></html>
 --%>
 
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz App</title>
</head>
<body>
    <form action="quiz.jsp" method="post">
        <%
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl = "jdbc:mysql://localhost:3306/jcaoqs";
            String dbUser = "root";
            String dbPassword = "Tabrej@7860";
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Retrieve the quiz questions and options from the database
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM java");
             int id=1;
            // Generate HTML code for the quiz form
            while (rs.next()) {
                String question = rs.getString("question");
                String optionA = rs.getString("op_1");
                String optionB = rs.getString("op_2");
                String optionC = rs.getString("op_3");

                out.println("<h3>"+"Question No "+id+" : " + question + "</h3>");
                out.println("<p><input type=\"text\" name=\"userAnswer"  );
               /* . out.println("<input type="button") */
              /*   out.println("<p><input type=\"radio\" name=\"" + question + "\" value=\"B\">" + optionB + "</p>");
                out.println("<p><input type=\"radio\" name=\"" + question + "\" value=\"C\">" + optionC + "</p>"); */
               
            }

            // Close the database connection
            rs.close();
            stmt.close();
            conn.close();
        %>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
 