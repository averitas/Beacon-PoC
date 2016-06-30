<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>Beacon Admin Page</title>  
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
  <body ng-app="myApp" class="ng-cloak" id="home">
      <div class="generic-container" ng-controller="patientController as ctrl" style="width:80%; text-align:center;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">Patient Administration Form </span><a style="float:right;" href="<c:url value="/logout"/>">Logout</a></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.user.id" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.uname" id="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="password">password</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.password" id="password" class="password form-control input-sm" placeholder="Enter your password" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.password.$error.required">This is a required field</span>
                                      <span ng-show="myForm.password.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.password.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="fname">First Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.fname" id="fname" class="form-control input-sm" placeholder="Enter your First Name." required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.fname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.fname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="lname">Last Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.lname" id="fname" class="form-control input-sm" placeholder="Enter your Last Name." required/>
                              	  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.lname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.lname.$invalid">This field is invalid </span>
                                  </div>	
                              </div>
                          </div>
                      </div>   
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.address" id="address" class="form-control input-sm" placeholder="Enter your Address."/>
                              </div>
                          </div>
                      </div>
 
 						<input type="hidden" ng-model="ctrl.user.role" id="role" placeholder="ROLE_USER"/>
 						
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="email">Email</label>
                              <div class="col-md-7">
                                  <input type="email" ng-model="ctrl.user.email" id="email" class="email form-control input-sm" placeholder="Enter your Email" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span data-ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span data-ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="Submit" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" data-ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="panel-heading"><span class="lead">List of Users </span><tr>
			<button ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">Previous</button>
			{{currentPage+1}}/{{numberOfPages()}}
			<button ng-disabled="currentPage >= emps.length/rowLimit - 1" ng-click="currentPage=currentPage+1">Next</button>
		</tr></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>First Name</th>
                              <th>Last Name</th>
                              <th>User Name</th>
                              <th>Address</th>
                              <th>Email</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.users | orderBy:sortColumn | startFrom:currentPage*rowLimit | limitTo:rowLimit">
                              <td><span ng-bind="u.fname"></span></td>
                              <td><span ng-bind="u.lname"></span></td>
                              <td><span ng-bind="u.uname"></span></td>
                              <td><span ng-bind="u.address"></span></td>
                              <td><span ng-bind="u.email"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.uname)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.uname)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                          
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
      
      <script>var csrf_token = '${_csrf.token}'</script> 
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.js"></script>
      <script src="<c:url value='/resources/js/app.js' />"></script>
      <script src="<c:url value='/resources/js/service.js' />"></script>
      <script src="<c:url value='/resources/js/controllers.js' />"></script>
      <script src="<c:url value='/resources/cssjs/modernizr-2.8.3.min.js' />"></script>
      <script src="<c:url value='/resources/cssjs/bootstrap.js' />"></script>
      <script src="<c:url value='/resources/cssjs/owl.carousel.js' />"></script>
      <script src="<c:url value='/resources/cssjs/script.js' />"></script>
      <script src="<c:url value='/resources/cssjs/stickUp.min.js' />"></script>
      <script src="<c:url value='/resources/cssjs/wow.min.js' />"></script>
      <script>
	 new WOW().init();
	</script>
      <script src="<c:url value='/resources/cssjs/classie.js' />"></script>
      <script src="<c:url value='/resources/cssjs/uiMorphingButton_inflow.js' />"></script>
      <script src="<c:url value='/resources/cssjs/script.js' />"></script>
  </body>
</html>