<%@page import="org.hibernate.query.*"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.example.demo.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/dashboard.css" />
<%@include file="all_js_css.jsp" %>
<title>note books</title>
<style>
#side-bar{
		display:block;
		height:100vh;
		/*background-color:white;*/
		position: absolute;
		z-index: 1000;
		/*background-color:#FF7466;*/
		box-shadow: 0px 0px 2px 2px #ddd;
		overflow:hidden;
		padding:20px;
	}
.column1 {
  float: left;
  padding: 10px;
  height: 700px; 
}

.changes1{
	margin-left:10px;
}
.dochanges1{
	margin-left:720px;
}
.center1{
	width:2%;
	background-color:white;
}
.left1 {
  width: 18%;
	background-color: #f2f2f2;
  height:1000%;
}

.right1 {
  width: 80%;
  	background-color: #f2f2f2;
  	margin-rigth:200px;
}


</style>
</head>
<body>

<!-- navbar coding -->
<div class="collapse" id="navbarToggleExternalContent">
  <div class="bg-dark p-4">
    <h5 class="text-white h4">Collapsed content</h5>
    <span class="text-muted">Toggleable via the navbar brand.</span>
  </div>
</div>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
  
    <button class="navbar-toggler" type="button" onclick="sidebar()" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" id="addNotebook" style="margin-left:77%; color:#b2b2b2;cursor:pointer;" data-toggle="modal" data-target="#exampleModal">NEW NOTEBOOK
      <!-- <i class="fa fa-bell" aria-hidden="true" style="margin-left:3300%;"></i> -->
    </a>
    <a  href="index.jsp"><i class="fa fa-sign-in" style="float:right;color:#b2b2b2;background-color:none;padding:5px;cursor:pointer"> Logout</i></a>
  </div>
</nav>


<!-- Start sidebar coding -->
<%
int userid=Integer.parseInt(request.getParameter("userid").trim());

Session s= FactoryProvider.getFactory().openSession();

UserData user=(UserData) s.get(UserData.class, userid);
%>
<!--  <div id="webpage">-->
<div id="side-bar" class="bg-dark">
		<i class="fa fa-close" style="float:right;color:#b2b2b2;background-color:none;padding:5px;cursor:pointer" onclick="sidebar_close()"></i>
		<p style="color:white; margin-top:20%;font-size:20px;">Hai <%=user.getName() %></p>
		<ul style="color:#b2b2b2; list-style-type:none;">
		<li><a href="noteBooks.jsp?userid=<%= user.getId() %>">NoteBookes</a></li>
		<li><a href="dashboard.jsp?userId=<%= user.getId() %>">Notes</a></li>
		<li><a href="editUser.jsp?userId=<%= user.getId() %>">Edit Users</a></li>
		</ul>
		
	</div>
	<!-- </div> -->
	<div class="rows">
<div class="column1 left1">

<h2>Note Books</h2>


</div>
<div class="column1 center1">
</div>
<div class="column1 right1">
<div class="row">
		<div class="col-md-4 text-left dochanges1">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search"
					id="myInput" />
				<div class="input-group-btn">
					<button class="btn btn-primary" type="submit" id="submit">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="col-md-8 text-left changes1">
			<%
			Query q=s.createQuery("FROM NoteBook");
			List<NoteBook> list=q.list();
			for(NoteBook notebook:list)
			{
				if(notebook.getUserId()==userid)
				{
			%>
			<div class="alert alert-light mt-5 ml-5" role="alert">
            <a href="notes.jsp?notebookid=<%=notebook.getId() %>" class=""><%=notebook.getNoteBook_name() %></a>
            <i class="fa fa-edit float-right" style="cursor:pointer;color:#0077CC;" data-toggle="modal" data-target="#editModal">Edit </i>
             <i class="fa fa-close float-right mr-2" style="cursor:pointer;color:#0077CC;">Delete</i>
            </div>
			<%
				}
			}
			
			%>
		</div>
	</div><br>
</div>

</div>

<!-- start add notebook model form -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ADD NOTEBOOK</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddNotebookServlet?userid=<%= user.getId() %>" method="post">
        <label for="notebookName" class="font-weight-bold">NoteBookName</label><br>
        <input class="form-control" type="text" name="notebookName" id="notebookName" style="width:100%;border:2px solid black;"><br>
        <input type="submit" class="btn btn-success mt-2">
        </form>
      </div>
    </div>
  </div>
</div>

<!-- end add note book model form -->


<!-- Start Edit notebook model -->

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">EDIT NOTEBOOK</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="EditNotebookServlet?userid=<%= user.getId() %>" method="post">
        <label for="notebookName" class="font-weight-bold">NoteBookName</label><br>
        <input class="form-control" type="text" name="notebookName" id="notebookName" style="width:100%;border:2px solid black;"><br>
        <input type="submit" class="btn btn-success mt-2" value="save">
        </form>
      </div>
    </div>
  </div>
</div>

<!-- End Edit notebook model -->

<script type="text/javascript">

function sidebar(){
    var sidebar = document.getElementById("side-bar");
    sidebar.style.display="block";
    sidebar.style.animation = "sidebar 0.2s";
    sidebar.style.animationFillMode = "forwards";
}

function sidebar_close(){
    var sidebar = document.getElementById("side-bar");
    sidebar.style.display="none";
}
</script>

<!-- End sidebar coding -->
</body>
</html>