<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="all_js_css.jsp" %>
<link rel="stylesheet" href="css/login.css" />
<title>signUp page</title>
</head>
<body>
<div class="container">
<h1 class="text-primary text-center mt-3">RemindMe</h1>
<div class="p-5 text-center form_container mt-5">
<h3>Sign Up</h3>
<form action="SaveUserServlet" method="post">
<span style="color: #FF0000;"></span>
<input type="text" name="userName" placeholder="username" class="mb-2 form-control input-lg" /></br>
<input type="number" name="mobile_number" placeholder="mobilenumber" class="mb-2 form-control input-lg" /></br>
<input type="email" name="email" placeholder="email" class="mb-2 form-control input-lg" /></br>
<input type="password" name="password" placeholder="Password" class="mb-2 form-control input-lg" /></br>
<input type="password" name="confirm_password" placeholder="confirm_assword" class="mb-2 form-control input-lg" /></br>
<button class="btn btn-success mb-2 login_btn login_btn">SignUp</button>
</form>
<span class="mt-2">Alreadi a member?<a href="index.jsp">Login</a></span>
</div>
</div>
</body>
</html>