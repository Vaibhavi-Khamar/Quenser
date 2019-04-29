<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- Optional JavaScript
    jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     -->
	<title>Home</title>
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
				<a class="nav-link" href="/project/updateProfile">Update Profile</a>
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
			
			

			<div class="col-sm-8 bg-Light">
				<table>
					<div class="panel panel-info">
						<div class="display-2 text-danger" >
						<center>
						Welcome ${usr.firstName} ${usr.lastName}
						</center>
						<br>
						</div>
						<div class="h3">
						<center>	
								Questions you have asked: ${qcount}<br> 
								Answers you have given: ${acount}
						</center>	
						</div>
					</div>
				</table>
			</div>
			
		</div>
	</div>
<img src="https://media.giphy.com/media/DqVKmAX0SGjN6/giphy.gif" class="float-right" alt="img not found" width="404" height="504">
</body>
</html>
