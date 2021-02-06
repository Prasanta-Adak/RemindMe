<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="all_js_css.jsp" %>
<link rel="stylesheet" href="css/login.css" />
<title>Login Page</title>
</head>
<body>

<div class="p-5 text-center form_container">
<h3 class="logintitle">Login</h3>
<form action="LoginValidateServlet" method="get">
<input type="email" name="userName" placeholder="email" class="mb-2 form-control input-lg" /></br>
<input type="password" name="password" placeholder="Password" class="mb-2 form-control input-lg" /></br>
<button class="btn btn-success mb-2 login_btn login_btn">Login</button>
</form>
<span class="mt-2">Not a member?<a href="signUp.jsp">Sign Up</a></span>
</div>

<script>
    function validateUser() {
	var flag=true;
	var email = document.getElementById("email").value;
	var password = document.getElementById("password").value;
	if(password== ""){
		flag = false;
		document.getElementById("password_error").style.display = 'block';
		} 
	else{
			document.getElementById("password_error").style.display = 'none';
			}
	if(email== "")
		{
		flag=false;
		document.getElementById("email_error").style.display= 'block';
		}
	else{
		document.getElementById("email_error").style.display= 'none';
       }
	

	return flag;
		
	}
</body>
</html>