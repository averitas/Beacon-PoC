<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
      
      body{
		background:url("<c:url value='/resources/img/intro/intro5.jpg' />");
		background-color: white;
	 }
 
    </style>

          <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/custom.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/general.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/style.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/animate.css' />" />
     <link rel="stylesheet" href="<c:url value='/resources/css/magnific-popup.css' />" />
     <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	 <link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
 
</head>
<body>
	<div class="login-form" style="width:50%;text-align:center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; MARGIN-TOP: 5%">
		<c:url var="loginUrl" value="/login"/>
		<form action="${loginUrl}" method="post" class="form-horizontal">
			<c:if test="${param.error != null}">
				<div class="alart alert-danger">
					<p>Invalid username and password</p>
				</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">
					<p>You have been logged out successfully
				</div>
			</c:if>
			<div class="input-group input-sm">
				<label class="input-group-addon" for="username"><i class="fa fa-user"></i>Username</label>
				<input type="text" class="form-control" id="username" name="username"
				placeholder="Enter Username" required>
			</div>
			<div class="input-group input-sm">
				<label class="input-group-addon" for="password"><i class="fa fa-lock"></i> Password</label>
				<input type="password" class="form-control" id="password" name="password" 
				placeholder="Enter Password" required/>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="form-actions">
				<input type="submit" class="btn btn-block btn-primary btn-default" value="Log in"/>
			</div>
		</form>
	</div>
</body>
</html>