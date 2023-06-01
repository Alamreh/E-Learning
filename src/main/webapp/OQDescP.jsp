  
<!DOCTYPE html>
<html>
    <head>
        <title>START YOUR QUIZ</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <style>
 body {
  
  color: snow;
   background:url(q9.jpg);
   background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
 background-image: linear-gradient(180deg, #73c0c9, #566e6c);
  font-family: Arial, Helvetica, sans-serif;
   }
input[type=text], input[type=password] {
  width: 65%;
  padding: 15px;
  margin: 5px  22px ;
  display: inline-block;
  border: none;
  border-radius: 25px;
}
input[type=submit],input[type=reset],input[type=button],select{
  width: 55%;
  padding: 7px;
  font-weight:bold;
  
  display: inline-block;
  font-size: 16px;
  border-radius: 25px;
  color:#00ffff;
  background-color: #00ffff;
  color: black;
  border: none;
  cursor: pointer;
  opacity=0.9 ;
}
input[type=text]:focus, input[type=password]:focus ,input[type=file]:focus,input[type=date]:focus,input[type=email]{
  background-color: #ddd;
  outline: none;
}
.choice {
 background-image: linear-gradient(180deg, #73c0c9, #0d668c);
  border-radius: 21px;
  padding: 10px; 
  margin-top:40px;
  width: 550px;
  height: 550px;
  text-align: center;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}
li {
  float: left;
  border-right:1px solid #bbb;
}
li:last-child {
  border-right: none;
}
li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
li a:hover:not(.active) {
  background-color: #111;
}
.active {
  background-color: #4CAF50;
}
.logo-img{
    position: relative;
    margin: 10px 15px 15px 10px;
}.logo-img1{
    float:right;
    position: relative;
    margin: 10px 15px 15px 10px;
}
footer{
    background-color:black;
}
table{
    width:350px;
    height:350px;
}
table {
  border-collapse: collapse;
  background-image: linear-gradient(180deg, #87cefa, #56baf8);
   
}
p{
    text-align: left;
}
 
 
</style>
    </head>
    <body>
    
    <nav>
    <ul>
      <li><a href="OQDescP.jsp">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Contact</a></li>
      <li><a href="login.jsp"> Logout</a></li>
        
       
       </ul>
    </nav>
    <center>
        <div class="choice">
        <form action="NewFile.jsp" method="post">
            <br><br>
            <center>
 <img class="logo-img" src="images/e-learningsignin.png" width="230" height="145" ALT="align box">
          </center>
              <center>
                 SELECT YOUR QUIZ:
                    <select name="choice">
                        <option>JAVA</option>
                        <option>MYSQL</option>
                        <option>WEB PROGRAMMING</option>
                        <option>SOFTWARE TESTING</option>
                        <option>C++</option>
                        <option>COMPUTER NETWORKS</option>
                    </select><br><br>
            <h3>INFORMATION OF QUIZ</h3>
              </center>
            <p><b>
                1. EVERY QUESTION CARRIES 1 MARK <br>
                2. GIVING A RIGHT ANSWER YOU WILL GET A 1 MARK, IF YOUR ANSWER IS INCORRECT THEN 1 MARK WILL BE DEDUCTED (NEGATIVE MARKING)<br>
                3. THERE ARE TOTAL 20 QUESTIONS ARE AVAILABLE <br>
                4. TOTAL MARKS FOR THIS QUIZ IS 20 MARKS <br>
            </b></p>
                <br><br>
            <center>
        <input type="submit" value="Start your quiz"/>
            </center>
        </form>
        </div>
    </center>
   <!--  <footer>
    <center><h1 style="color: white">© QuizYourIQ, Inc. ALL RIGHTS RESERVED 2019</h1>
        <h2 style="color: white">Created By: NARENDER KESWANI</h2>
    </center>
</footer> -->
    </body>
</html>
