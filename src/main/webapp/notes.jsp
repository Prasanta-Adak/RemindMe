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
.badge { 
            position: relative; 
            top: -15px; 
            left: -25px; 
            border: 1px solid black; 
            border-radius: 50%; 
            background-color:red;
            color:white;
        } 
        
#notifi { 
            margin:5px; 
            cursor:pointer;
        } 
#notificationModel{
  margin-left:40%;
  margin-top:30px;
  }

</style>
</head>
<body>
<%
int notebookId=Integer.parseInt(request.getParameter("notebookid").trim());
Session s= FactoryProvider.getFactory().openSession();
NoteBook notebook1=(NoteBook) s.get(NoteBook.class,notebookId);
int userid=notebook1.getUserId();
UserData user=(UserData) s.get(UserData.class,userid);
%>
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
    
    <a class="navbar-brand" id="addNotebook" style="margin-left:77%; color:#b2b2b2;cursor:pointer;" data-toggle="modal" data-target="#exampleModal">NEW NOTE
      <!-- <i class="fa fa-bell" aria-hidden="true" style="margin-left:3300%;"></i> -->
      
    </a>
    <span id="group"> 
                   
                  <i class="fa fa-bell" id="notifi" style="color:white;" data-toggle="modal" data-target="#notificationModel"></i>
                  <%
                int count=0;
                ArrayList<String> noteTitle=new ArrayList();
                ArrayList<String> endDateArr=new ArrayList();
                ArrayList<Integer> noteIdArr=new ArrayList();
                Query q=s.createQuery("FROM NoteBook");
                List<NoteBook> notebookList=q.list();
                for(NoteBook notebook:notebookList){
                	if(notebook.getUserId()==user.getId()){
                		Query q1=s.createQuery("FROM Note");
                		List<Note> noteList=q1.list();
                		for(Note note:noteList){
                			if(note.getNotebookId()==notebook.getId()){
                		noteIdArr.add(note.getNoteid());
                				   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
                				   LocalDateTime now = LocalDateTime.now();  
                				   String dat=dtf.format(now);
                		
                		String reDate=note.getReDate();
                		int i=reDate.indexOf(" ");
                		String rd=reDate.substring(0, i);
                		if(rd.equals(dat)){
                			count++;
                			noteTitle.add(note.getName());
                			endDateArr.add(note.getEndDate());
                		}
                			}
                		}
                	}
                }
                
                %>
                  <span class="badge badge-light"><%=count %></span> 
                 
               </span>
    <a  href="index.jsp"><i class="fa fa-sign-in" style="float:right;color:#b2b2b2;background-color:none;padding:5px;cursor:pointer"> Logout</i></a>
  </div>
</nav>


<!-- Start sidebar coding -->


<!--  <div id="webpage">-->
<div id="side-bar" class="bg-dark">
		<i class="fa fa-close" style="float:right;color:#b2b2b2;background-color:none;padding:5px;cursor:pointer" onclick="sidebar_close()"></i>
		<p style="color:white; margin-top:20%;font-size:20px;">Hai <%=user.getName() %></p>
		<ul style="color:#b2b2b2; list-style-type:none;">
		<li><a href="noteBooks.jsp?userid=<%= user.getId()%>">NoteBookes</a></li>
		<li><a href="dashboard.jsp?userId=<%= user.getId() %>">Notes</a></li>
		<li><a href="editUser.jsp?userId=<%= user.getId() %>">Edit Users</a></li>
		</ul>
		
	</div>
	<!-- </div> -->
	<div class="rows">
<div class="column1 left1">

<h2>Your Daily Tasks!!!</h2>
<%
Query q2=s.createQuery("FROM Note");
List<Note> noteList=q2.list();
for(Note note:noteList)
{
	 if(note.getNotebookId()==notebookId){
%>
<h3 class="text-primary"><%=note.getName() %></h3>
<h6>StartDate: <%=note.getStartDate() %></h6>
<h6>EndDate: <%=note.getEndDate() %></h6>
<%
	 }
}
%>
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

         <h3>Notes</h3>
         <div id="accordion">
         <%
         for(Note note:noteList)
         {
        	 if(note.getNotebookId()==notebookId){
        		%> 
        	
        
  <div class="card mt-3">
    <div class="card-header" id="headingOne">
    
    <div class="container">
  <div class="row">
    <div class="col-sm-2" style="background-color:none;">
      <p><%=note.getName() %></p>
    </div>
    <div class="col-sm-4" style="background-color:none;">
      <p>Started on :<%=note.getStartDate()%></p>
      
    </div>
    <div class="col-sm-6" style="background-color:none;">
     <button type="button" class="btn btn-primary"><%= note.getStatus()%></button>
    </div>
  </div>
</div>
    
      <h5 class="mb-0">
        <button class="btn btn-lg" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <i class="fa fa-plus"></i>
        </button>
      </h5>
      
             <i class="fa fa-edit float-right" style="cursor:pointer;color:#0077CC;" data-toggle="modal" data-target="#editModal">Edit </i>
             <i class="fa fa-close float-right mr-2" style="cursor:pointer;color:#0077CC;">Delete</i>
    </div>



    <div id="collapseOne" class="collapse hide" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
      <%=note.getDescription() %>
      </div>
    </div>
  </div>
  

<% 
 }
         }
         %>
</div>
			<!-- <div class="alert alert-light mt-5 ml-5" role="alert">
            <a href="#" class=""></a>
            <i class="fa fa-edit float-right" style="cursor:pointer;color:#0077CC;" data-toggle="modal" data-target="#editModal">Edit </i>
             <i class="fa fa-close float-right mr-2" style="cursor:pointer;color:#0077CC;">Delete</i>
            </div> -->
			
		</div>
	</div><br>
</div>

</div>


<!-- start add notebook model form -->

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ADD NOTE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <form action="AddNoteServlet?notebookid=<%=notebook1.getId() %>" method="post">
  <div class="form-group">
    <label for="noteName">NoteName</label>
    <input type="text" class="form-control" id="noteName" name="name" placeholder="Enter note name">
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="startdate">StartDate</label>
      <input type="date" class="form-control" name="startdate" id="inputEmail4" placeholder="start date">
    </div>
    <div class="form-group col-md-4">
      <label for="enddate">End Date</label>
      <input type="date" class="form-control" name="enddate" id="enddate" placeholder="end date">
    </div>
    <div class="form-group col-md-4">
      <label for="remainderdate">End Date</label>
      <input type="date" class="form-control" name="redate" id="remainderdate" placeholder="remainder date">
    </div>
  </div>
  
  <div class="form-group">
    <label for="status">Status</label>
    <select id="inputstatus" name="status" class="form-control">
        <option selected>Choose status...</option>
        <option>Started</option>
        <option>Inprogress</option>
        <option>Finished</option>
      </select>
  </div>
  <div class="form-group">
    <label for="tag">Tag</label>
    <select id="tag" name="tag" class="form-control">
        <option selected>Choose Tag...</option>
        <option>Private</option>
        <option>Public</option>
      </select>
  </div>
  <div class="form-group">
    <label for="description">Description</label>
    <textarea rows="5" name="description" class="form-control" id="description"></textarea>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
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
        <form action="EditNotebookServlet" method="post">
        <label for="notebookName" class="font-weight-bold">NoteBookName</label><br>
        <input class="form-control" type="text" name="notebookName" id="notebookName" style="width:100%;border:2px solid black;"><br>
        <input type="submit" class="btn btn-success mt-2" value="save">
        </form>
      </div>
    </div>
  </div>
</div>

<!-- End Edit notebook model -->


<!-- design notification body -->

<div class="modal fade" id="notificationModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Your Todays Reminder</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
      <%
      if(!noteTitle.isEmpty()){
    	  for(int i=0;i<noteTitle.size();i++){
    		  
    	  
    	  %>
    	  
    	  <p style="color:#96ceb4;" class="mb-0"><%=noteTitle.get(i) %><br><%=endDateArr.get(i) %></p>
    	  <hr>
    	  <%
    	  }
      }
      %>
       
      </div>
    </div>
  </div>
</div>

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