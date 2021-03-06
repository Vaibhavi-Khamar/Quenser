<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    
	<title>giveAnswer</title>
    <style>
      body {
           width: 100%;
           height: 400px;
           background-image: url("https://ak9.picdn.net/shutterstock/videos/2714639/thumb/1.jpg");
           background-size: 100% 100%;
           }
    </style>
</head>


<body>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        
        <a class="navbar-brand" href="#">Q?A</a>

        
		<ul class="navbar-nav">
			<li class="nav-item">
                <a class="nav-link" href="/project/home">Home</a>
            </li>
			<li class="nav-item">
                <a class="nav-link" href="/project/viewProfile">Profile</a>
            </li>
			<li class="nav-item">
                <a class="nav-link" href="/project/ques">Questions</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Notifications</a>
            </li>
			<li class="nav-item">
                <a class="nav-link" href="/project/logout">Logout</a>
            </li>
		</ul>

	</nav>


	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2">
				<div class="table-responsive">
					<table class="table">
                        <tr>
							<td>
								<center>
									<img class="img-thumbnail" alt="Profile pic"
										src="/project/profilePic/${usr.userId}"
										style="width: 350px; height: 150px">
								</center>
							</td>
						</tr>
						<tr class="info">
							<td>${usr.firstName}&nbsp${usr.lastName}</td>
						</tr>
						<tr class="info">
							<td>${usr.email}</td>
						</tr>
						<tr class="info">
							<td><a href="/project/ques/addQuest">Ask Question</a></td>
						</tr>
						<tr class="info">
							<td><a href="/project/ques">View Question</a></td>
						</tr>
						<tr class="info">
							<td><a href="/project/updateProfile">Update Profile</a></td>
						</tr>
						<tr class="info">
							<td><a href="/project/flag">Flagged Question</a></td>
						</tr>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<tr class="success">
								<td><a href="/project/admin/viewUsers">View Users</a></td>
							</tr>
						</sec:authorize>
					
					</table>
			</div>
			</div>
		
			<div class="col-sm-8">
				<div class="well well-lg">

					<h1>Question</h1>
					<hr>
					<h4>${question.questionTitle}</h4>
					<h5>${question.questionDesc}</h5>

					<h6 style="color:black">Asked by
						<a href="/project/viewProfile/${question.user.userId}">${question.user.firstName} ${question.user.lastName}</a>   </h6>
					
					<hr>
					
					<form:form modelAttribute="answer"
						action="${pageContext.request.contextPath}/ques/viewQuest"
						method="post">
						<fieldset>

                            <h1>Give Answer</h1>
                           
							<p>
								<form:label for="answerText" path="answerText"
									cssErrorClass="error">Answer text</form:label>
								<br />
								<form:textarea class="form-control input-lg" path="answerText" />
								<form:errors path="answerText" />
							</p>

							<p>
								<button class="btn btn-primary" type="submit">Submit</button>
							</p>

						</fieldset>
					</form:form>
					<a href="#" style="float: center;"><button
										type="button" class="btn btn-outline-primary" id = "${question.questionId}" onclick="reportQuestion(event)" class="btn btn-default">Flag
										<span id = "${question.questionId}" onclick="reportQuestion(event)"></span>
									</button></a> <br/>
									<br/>


					<c:if test="${empty question.answers}">

						<p class="font-weight-light">No answers Yet.</p>
					</c:if>

					<c:if test="${!empty question.answers}">
						<table>

							<c:forEach items="${question.answers}" var="ans">
								<div>
									${ans.answerText}

									<h6 style="color: black">Answered by
									<a href="/project/viewProfile/${ans.user.userId}">${ans.user.firstName} ${ans.user.lastName}</a>
								    </h6>
									
								</div>
							</c:forEach>
						</table>
					</c:if>
				</div>
			</div>
		</div>
	</div>


	<script type = "text/javascript">
	function reportQuestion(e){
		var xmlhttp;
		if (window.XMLHttpRequest) {
		    //modern browsers
		    xmlhttp = new XMLHttpRequest();
		 }
		else {
		    //old IE browsers
		    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readystate ==4 && xmlhttp.status ==200){
				//reload
				location.reload(true);
			}
		}
		var tid = $(e.target)[0].id;
		window.alert("The question has been flagged");
		xmlhttp.open("POST",'/project/ques/report/'+tid ,true);
		xmlhttp.send();

	}
    </script>
<img src="https://media.giphy.com/media/DqVKmAX0SGjN6/giphy.gif" class="float-right" alt="img not found" width="404" height="504">
</body>
</html>