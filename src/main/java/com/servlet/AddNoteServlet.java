package com.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.demo.Note;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AddNoteServlet
 */
public class AddNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNoteServlet() {
        super();
        
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int notebookId=Integer.parseInt(request.getParameter("notebookid").trim());
			int noteid=new Random().nextInt(1000);
			String name=request.getParameter("name");
			String startDate=request.getParameter("startdate");
			//Date sDate=new SimpleDateFormat("dd-mm-yyyy").parse(startDate);
			String endDate=request.getParameter("enddate");
			//Date eDate=new SimpleDateFormat("dd-mm-yyyy").parse(endDate);
			String reDate=request.getParameter("redate");
			//Date rDate=new SimpleDateFormat("dd-mm-yyyy").parse(reDate);
			String status=request.getParameter("status");
			String tag=request.getParameter("tag");
			String description=request.getParameter("description");
			Note note=new Note(noteid,name,startDate,endDate,reDate,status,tag,description,notebookId);
			Session session=FactoryProvider.getFactory().openSession();
			Transaction transaction=session.beginTransaction();
			
			session.save(note);
			
			transaction.commit();
			session.close();
			response.sendRedirect("notes.jsp?notebookid="+notebookId);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
