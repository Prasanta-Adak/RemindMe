package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.demo.UserData;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class LoginValidateServlet
 */
public class LoginValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginValidateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("userName");
			String password=request.getParameter("password");
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
		    Query q=s.createQuery("from UserData");
		    List<UserData> list=q.list();
		    ArrayList<String> email_list=new ArrayList<String>();
		    System.out.println(email+" "+password);
		    for(UserData user:list)
		    {
		    	email_list.add(user.getEmail());
//		    	System.out.println(user.getEmail()+" "+user.getPassword());
		    }
//		    System.out.println(email_list);
//		    boolean b=email_list.contains(email);
//		    System.out.println(b);
		    if(email_list.contains(email)) {
		    	String pass="";
		    	int id=0;
		    	for(UserData user:list)
			    {
		    		if(email.equals(user.getEmail())) {
		    			pass=user.getPassword();
		    			id=user.getId();
			    }
			    }
		    	if(pass.equals(password)) {
		    		response.sendRedirect("dashboard.jsp?userId="+id);
		    		//request.setAttribute("userId", id);
					//HttpSession session=request.getSession();
					//session.setAttribute("message", "Prasanta");
					//getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
		    	}
		    	else {
		    		response.sendRedirect("index.jsp");
		    	}
		    }else {
		    	response.sendRedirect("index.jsp");
	    }
		    tx.commit();
			s.close();
//		    response.sendRedirect("dashboard.jsp");
//			request.setAttribute("myMessage", "my name is prasanta $$");
//			HttpSession session=request.getSession();
//			session.setAttribute("message", "Prasanta");
//			getServletContext().getRequestDispatcher("/dashboard.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
