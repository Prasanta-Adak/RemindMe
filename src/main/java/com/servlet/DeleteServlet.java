package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.demo.Note;
import com.example.demo.NoteBook;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteServlet
 */
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteid=Integer.parseInt(request.getParameter("noteid").trim());
			int userid=0;
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Note note=(Note)s.get(Note.class, noteid);
			int notebookid=note.getNotebookId();
			NoteBook noteBook=(NoteBook)s.get(NoteBook.class, notebookid);
			userid=noteBook.getUserId();
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("dashboard.jsp?userId="+userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
