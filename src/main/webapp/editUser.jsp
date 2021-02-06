<%@page import="org.hibernate.query.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.example.demo.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit User</title>
<%@include file="all_js_css.jsp" %>
<style>
#formDiv{
background-color:white;
width:50%; 
margin-right: auto;
margin-left: auto; 
margin-top:10%; 
padding:20px 20px 10px 20px;
}

</style>
</head>
<body style="background-color:black;">

<%

int userid=Integer.parseInt(request.getParameter("userId").trim());
Session s= FactoryProvider.getFactory().openSession();

UserData user=(UserData) s.get(UserData.class, userid);
%>

<div id="formDiv">
<h3 style="margin-left:40%;">EDIT USER</h3>
</hr>
<form action="EditUserServlet?userId=<%=user.getId() %>" method="post">
<div class="form-group">
    <label for="userName">UserName</label>
    <input type="text" class="form-control" id="userName" name="userName" placeholder="" value="<%=user.getName() %>">
  </div>
  <div class="form-group">
    <label for="mobileNo">MobileNo</label>
    <input type="number" name="mobile_number" class="form-control" id="mobileNo" placeholder="" value="<%=user.getMobile() %>">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" name="email" class="form-control" id="inputEmail4" placeholder="" value="<%=user.getEmail() %>">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" name="password" class="form-control" id="inputPassword4" placeholder="Password" value="<%=user.getPassword() %>">
    </div>
  </div>
  
  <button type="submit" class="btn btn-primary">Save</button>
</form>
<hr>
</div>
</body>
</html>