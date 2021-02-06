package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.demo.UserData;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveUserServlet
 */
public class SaveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=new Random().nextInt(10000);
			String name=request.getParameter("userName");
			double mobile=Double.parseDouble(request.getParameter("mobile_number"));
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String confirmPassword=request.getParameter("confirm_password");
			
			UserData userdata=new UserData(id,name,mobile,email,password);
			Session s= FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			s.save(userdata);
			
//			if(s.save(userdata)!=null) {
//				request.setAttribute("errorMessage", "User is Added Successfully");
//				request.getRequestDispatcher("signUp.jsp").include(request, response);
//			}
//			else {
//				request.setAttribute("errorMessage", "User is not Added");
//				request.getRequestDispatcher("signUp.jsp").include(request, response);
//			}
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<h1 style='text-align:center;'>User is Added Successfully<h1/>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
