<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.UserDTO"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	UserDTO userdto = (UserDTO)request.getAttribute("userdetails");
	int noofques = (Integer)(request.getAttribute("noofques"));
	int correctAnswers = (Integer)(request.getAttribute("correctAnswers"));
	int incorrectAnswers = (Integer)request.getAttribute("incorrectAnswers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Result</title>
    <!-- Bootstrap library--->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!---- Custom css file ---->
    <link rel="stylesheet" href="css/result.css">
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Answers');
        data.addColumn('number', 'answers');
        data.addRows([
            ['Correct Answers', <%= correctAnswers %>],
            ['Incorrect Answers', <%= incorrectAnswers %>]
          ]);


        // Set chart options
        var options = {'title':'How many answers you give right or wrong',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <!-- Disable Back button -->
    <script type="text/javaScript">
			function disableBackButton()
			{
			window.history.forward();
			}
			setTimeout("disableBackButton()", 0);
	</script>
</head>
<body onload="disableBackButton()">
    <div class="row header">
        <div class="col-lg-12">
          <img src="images/logo.jpg" alt="sitelogo">
             <h2 class="sitename">Exam Viral</h2>
            <h1 class="mainheading">View Student Result</h1>    
            <p class="welcome">Welcome <%= userdto.getUsername() %></p>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2 col-md-2 col-sm-4 leftsidebar">
            <div class="card">
                  <img src="images/newdp.png" alt="John" style="width:100%">
                  <h2><%= userdto.getUsername() %></h2>
                  <p class="title">Student</p>
                  <p><%= userdto.getInstitutename() %></p>
                  <a href="#"><i class="fa fa-dribbble"></i></a> 
                  <a href="#"><i class="fa fa-twitter"></i></a> 
                  <a href="#"><i class="fa fa-linkedin"></i></a> 
                  <a href="#"><i class="fa fa-facebook"></i></a> 
                  <p><button>Contact</button></p>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-4 centerside">
            <div class="panel panel-success">
              <div class="panel-heading">
                    <h3 class="panel-title">Test Submitted Successfully</h3>
              </div>
              <div class="panel-body">
                <p>You Got <c:out value="${requestScope.percentage}"> Percentage</c:out></p>
                <p>Total questions are <%= noofques %></p>
                <p>You gave <c:out value="${requestScope.correctAnswers}"></c:out> correct Answers</p>
                <p>You gave <c:out value="${requestScope.incorrectAnswers}"></c:out> incorrect Answers</p>
              </div>
            </div>
            <a class="btn btn-primary" href="index.jsp">Home</a>
            <a class="btn btn-primary" href="login.jsp">Logout</a>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 rightsidebar">
            <div id="chart_div"></div>
        </div>
    </div>
</body>
</html>