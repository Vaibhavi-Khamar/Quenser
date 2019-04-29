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
<meta name="viewport" content="width=device-width, initial-scale=1">

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
    
<title>Register</title>
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
    <sec:authentication property="name" />
	<sec:authentication property="authorities" />
	<br />

	<div class="container">
			<h1>Create an account</h1>
		<div class="row">
			<div class="col-sm-4">
				<form:form modelAttribute="usr" action="register" method="post" enctype="multipart/form-data">
					<fieldset>
						<p>
							<form:label for="firstName" path="firstName" cssErrorClass="alert-error">FIRST NAME</form:label>
							<br />
							<form:input path="firstName" class="form-control" />
							<form:errors path="firstName" />
						</p>
						<p>
							<form:label for="lastName" path="lastName" cssErrorClass="error">LAST NAME</form:label>
							<br />
							<form:input path="lastName" class="form-control" />
							<form:errors path="lastName" />
						</p>
						<p>
							<form:label for="email" path="email" cssErrorClass="error">EMAIL ID</form:label>
							<br />
							<form:input type="email" path="email" class="form-control" />
							<form:errors path="email" />
						</p>
						<p>
							<form:label for="password" path="password" cssErrorClass="error">PASSWORD</form:label>
							<br />
							<form:password path="password" class="form-control" />
							<form:errors path="password" />
						</p>
						<p>
							<form:label for="passwordConfirm" path="passwordConfirm" cssErrorClass="error">CONFIRM PASSWORD</form:label>
							<br />
							<form:password path="passwordConfirm" class="form-control" />
							<form:errors path="passwordConfirm" />
						</p>
						<p>
							<form:label for="photo" path="photo" cssErrorClass="photo">PROFILE PIC</form:label>
							<br />
							<form:input path="photo" class="form-control" type="file" />
							<form:errors path="photo" />
						</p>
						<p>
							<input type="submit" class="btn btn-primary"/>
						</p>

					</fieldset>
				</form:form>
			</div>
			<img src="https://media.giphy.com/media/DqVKmAX0SGjN6/giphy.gif" class="float-right" alt="img not found" width="404" height="504">
		</div>
		
	</div>
<!-- <img src="https://media.giphy.com/media/DqVKmAX0SGjN6/giphy.gif" class="float-right" alt="img not found" width="404" height="504">-->
</body>
</html>