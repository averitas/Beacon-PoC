<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
  <head>  
    <title>Beacon Patient Page</title>  
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
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" style="width:80%; text-align:center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto; MARGIN-TOP:5%;">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Patient User Form </span><a style="align:right;" href="<c:url value="/logout"/>">Logout</a></div>
              <div class="formcontainer">
                  <form:form action="editsave" name="myForm" class="form-horizontal">
                      <input type="hidden" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <form:input class="form-control input-sm" path="uname"/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="password">password</label>
                              <div class="col-md-7">
                                  <form:input class="form-control input-sm" path="password"/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="fname">First Name</label>
                              <div class="col-md-7">
                                  <form:input class="form-control input-sm" path="fname"/>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="lname">Last Name</label>
                              <div class="col-md-7">
                                  <form:input class="form-control input-sm" path="lname"/>
                              </div>
                          </div>
                      </div>   
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Address</label>
                              <div class="col-md-7">
                                 <form:input class="form-control input-sm" path="address"/>
                              </div>
                          </div>
                      </div>
 
 						<input type="hidden"id="role" value="${role}" placeholder="ROLE_USER"/>
 						
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Email</label>
                              <div class="col-md-7">
                                  <form:input class="form-control input-sm" path="email"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="Submit" class="btn btn-primary btn-sm" />
                              <button type="button" class="btn btn-warning btn-sm" >Reset Form</button>
                          </div>
                      </div>
                  </form:form>
              </div>
          </div>
      </div>
      
      <script>var csrf_token = '${_csrf.token}'</script> 
  </body>
</html>