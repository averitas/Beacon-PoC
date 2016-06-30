<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<script src="<c:url value='/resources/js/jquery-min.js'/>"></script>
<script src="<c:url value='/resources/js/get.js'/>"></script>
<script src="<c:url value='/resources/js/put.js'/>"></script>
<script src="<c:url value='/resources/js/polyfill.js'/>"></script>
<script>var csrf_token = '${_csrf.token}'</script>
</head>
<body>
<h1>
View&Edit patients  
</h1>
<form action="#" method="POST" id="form1" name="form1">
<input type="hidden" name="role" value="ROLE_USER" id="role">
<table>
<tr>
<td>User Name:</td><td><input type="text" name="uname" id="uname"/></td>
</tr>
<tr>
<td>Pass Word:</td><td><input type="password" name="password" id="password"/></td>
</tr>
<tr>
<td>First Name:</td><td><input type="text" name="fname" id="fname"/></td>
</tr>
<tr>
<td>Last Name:</td><td><input type="text" name="lname" id="lname"/></td>
</tr>
<tr>
<td>Email:</td><td><input type="text" name="email" id="email"/></td>
</tr>
<tr>
<td>Address:</td><td><input type="text" name="address" id="address"/></td>
</tr>
<tr>
<td><input type="button" name="search" id="search" value="get patient"/></td><td><input type="button" name="submit" id="submit" value="Submit"/></td>
</tr>
</table>
</form>

<div id="result"></div>
</body>
</html>
