<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@ page import= "org.json.*" %>
<%@page import=" com.registration.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Learning</title>
    <link rel="Stylesheet" href="css/app.css">
</head>
<body>
<% 
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/jcaoqs","root","Tabrej@7860");
   PreparedStatement ps=conn.prepareStatement("Select * from java");
   ResultSet rs=ps.executeQuery();
   ArrayList<Questions> dataList = new ArrayList<>();

   while (rs.next()) {
       Questions q=new Questions(rs.getInt("q_id"),rs.getString("question"),rs.getString("c_ans"));
       // Add more columns as needed
       dataList.add(q);
   }
   int index=0;
   

%>
    <div class="container">
    <div id ="question-container" class="hide">
        <div id="question">Question</div>
       <div id="answer-buttons" class ="btn-grid">
       <!--    <button class="btn">Answer 1</button>
         <button class="btn">Answer 2</button>
         <button class="btn">Answer 3</button>
         <button class="btn">Answer 4</button> --> 
       <span>Ans  <input type ="text" id ="user-answer"></span>
         
       </div> 
        
    </div>
    <div class="controls">
        <button  id="start-btn" class="start-btn btn ">Start</button>
        <button id="submit-btn" class="submit-btn btn hide" onclick="submitQuiz()">Submit</button> 
        
        <button id="next-btn" class="next-btn btn hide" >Next</button></div>

     <div class="score">
        <span id="right-answers">Quiz Score: 0</span>
        
     </div>
    </div>
     

    <script src="script.js"></script>
</body>
 
<script>
const startButton=document.getElementById("start-btn")
const nextButton=document.getElementById("next-btn")
const submitButton=document.getElementById("submit-btn")
const questionContainerElement=document.getElementById("question-container")
const questionElement=document.getElementById('question')
 
const totalScore=document.getElementById('right-answers')
const userAnswer=document.getElementById('user-answer')
 
 
 
startButton.addEventListener('click',startGame)
nextButton.addEventListener('click',() => {
     
     
        loadQuestion();
     
})

 
  
function startGame()
{
    startButton.classList.add('hide')
   // suffledQuestion=questions.sort(() => Math.random() -0.5)
    //currentQuestionIndex=0;
    nextButton.classList.add('hide')
    questionContainerElement.classList.remove('hide')
    
    
    submitButton.classList.remove('hide')
    
     
    //setNextQuestion()
    loadQuestion()
     
}
//function setNextQuestion()
//{
  //  resetState();
   // showQuestion(suffledQuestion[currentQuestionIndex]);

//}
 
 
/* function resetState()
{
    clearStatusClass(document.body)
    nextButton.classList.add('hide')
    while(answerButtonElement.firstChild)
    {
        answerButtonElement.removeChild(answerButtonElement.firstChild)
    }
}
 */
 
 
/* const questions =[
    {
        'question':"A person living permanently in a certain place",
        'ans':"Domicile"
    },
    {
        'question':"Mania for stealing articles?",
        'ans':"kleptomania"
    },
    {
        'question':"A remedy for all disease is",
         'ans':"panacea"
    }
     
    
] */
function loadQuestion(){
	 
	 
	const data = "<%=dataList.get(index).getQuestion() %>";
	  
	 questionElement.innerText= "Question : "+(1) +" "+ data
	const ans=data.column2;
	 nextButton.classList.remove('hide')
    
}

 

function submitQuiz()
{
	  var userinput=userAnswer.value;
	var answer ="<%=dataList.get(index).getCorrect_ans() %>";
	if(userinput==answer)
	{ quizScore++;
	 
	}
	else
		{
		const soundex1 = soundex(userinput);
		const soundex2 = soundex(answer);
		// var similarity = levenshteinDistance(answer, userinput);

		  // Determine the degree of misspelling and declare the answer as correct or incorrect
		  
		  if (soundex1==soundex2) {
		    alert("Misspelled!");
		    setStatusClass(questionContainerElement,true);
		    quizScore+=0.5;
		  } else {
		    alert("Incorrect");
		    setStatusClass(questionContainerElement,false);
		    
		  }
		}
	document.getElementById('right-answers').innerHTML="Quiz Score: "+quizScore
	userAnswer.value='';
	incrementCount();
	nextButton.classList.remove('hide')
	
	
}
 

 
 


function soundex(word) {
	  const codes = "01230120022455012623010202";
	  let soundexCode = "";

	  // Convert the word to uppercase
	  word = word.toUpperCase();

	  // Remove non-alphabetic characters and convert to an array of characters
	  const chars = word.replace(/[^A-Z]/g, "").split("");

	  // Get the first character of the word and append to the Soundex code
	  soundexCode += chars.shift();

	  // Loop through the remaining characters and convert to Soundex codes
	  for (let i = 0; i < chars.length; i++) {
	    const code = codes.charAt(chars[i].charCodeAt(0) - 65);
	    if (i === 0 || code !== codes.charAt(chars[i - 1].charCodeAt(0) - 65)) {
	      soundexCode += code;
	    }
	  }

	  // Pad the Soundex code to four characters
	  soundexCode += "0000";
	  soundexCode = soundexCode.substring(0, 4);

	  return soundexCode;
	}
	
function incrementCount() {
    // Make an AJAX request to the server to increment the count
    // You can use frameworks like jQuery or fetch API for this

    // Assuming you are using jQuery
    $.ajax({
       url: 'increment.jsp',
       method: 'GET',
       success: function(response) {
          // On success, update the count value on the client-side
          <% index++; %>
          
       }
    });
 }
 
	   
</script>

</html>


 