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
<meta http-equiv="Content-Type" content="text/html">
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
    

<title>Login</title>

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
    
   
   
    <div class="container">
            <br/>
            <center>
 			<h1>Quenswer</h1><br/>
 			</center>

      			<form action ="j_spring_security_check" method="post">
					<div class="form-group">
						<label for="userName">USER ID</label>
						<input type="email" class="form-control" name="j_username" id="userName" placeholder="Enter Email Id">
					</div>
					<div class="form-group">
						<label for="password">PASSWORD</label>
						<input type="password" name = "j_password" class="form-control" id="password" placeholder="Enter Password">
					</div>
					<button type="submit" value = "Login" class="btn btn-primary">Login</button><br/>

				</form><br/>

				<font color="black">
					<span>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span>
				</font><br/>
				<br>

				<a href="register">Create an account</a>
			</div>
	

<img src="https://media.giphy.com/media/DqVKmAX0SGjN6/giphy.gif" class="float-right" alt="img not found" width="404" height="504">
</body>
</html>