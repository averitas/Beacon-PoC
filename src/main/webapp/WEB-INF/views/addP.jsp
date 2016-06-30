<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Add Patient</title>
<script src="<c:url value='/resources/js/jquery-min.js'/>"></script>
<script src="<c:url value='/resources/js/post.js'/>"></script>
<script src="<c:url value='/resources/js/polyfill.js'/>"></script>
<script>var csrf_token = '${_csrf.token}'</script>
</head>
<body>
<form action="#" method="POST" id="form1" name="form1">
User Name:<input type="text" name="uname" id="uname"><br/>
<input type="hidden" name="password" value="123" id="password"/>
<input type="hidden" name="role" value="ROLE_USER" id="role">
First Name:<input type="text" name="fname" id="fname"><br/>
Last Name:<input type="text" name="lname" id="lname"><br/>
Email: <input type="text" name="email" id="email"><br/>
Address: <input type="text" name="address" id="address"><br/>
<input type="button" name="submit" id="submit" value="Submit"/>
</form>
<div id="result"></div>
</body>
</html>