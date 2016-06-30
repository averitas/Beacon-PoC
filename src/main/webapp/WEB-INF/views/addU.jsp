<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="add/user" method="POST">
<input type="hidden" name="${_csrf.parameterName}" 
					value="${_csrf.token}"/>
User Name:<input type="text" name="uname"><br/>
Password:<input type="password" name="password"><br/>
<input type="hidden" name="role" value="ROLE_ADMIN">
<input type="submit" name="submit" id="submit" value="Submit"/>
</form>
</body>
</html>