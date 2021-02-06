package com.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.demo.NoteBook;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AddNotebookServlet
 */
public class AddNotebookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNotebookServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int userId=Integer.parseInt(request.getParameter("userid").trim());
			int id=new Random().nextInt(1000);
			String noteBook_name=request.getParameter("notebookName");
			NoteBook noteBook=new NoteBook(id,noteBook_name,userId);
			Session session=FactoryProvider.getFactory().openSession();
			Transaction transaction=session.beginTransaction();
			
			session.save(noteBook);
			
			transaction.commit();
			session.close();
			response.sendRedirect("noteBooks.jsp?userid="+userId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
