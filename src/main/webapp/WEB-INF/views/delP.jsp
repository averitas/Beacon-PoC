<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script src="<c:url value='/resources/js/jquery-min.js'/>"></script>
<script src="<c:url value='/resources/js/delete.js'/>"></script>
<script src="<c:url value='/resources/js/polyfill.js'/>"></script>
<script>var csrf_token = '${_csrf.token}'</script>

</head>
<body>

<form action="#" method="POST" id="form1" name="form1">
The Patient you want to delete:<input type="text" name="uname" id="uname"><br/>
<input type="button" name="submit" id="submit" value="Submit"/>
</form>
<div id="result"></div>

</body>
</html>