package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.example.demo.UserData;
import com.helper.FactoryProvider;
import com.sun.xml.fastinfoset.util.StringIntMap;

/**
 * Servlet implementation class EditUserServlet
 */
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserServlet() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String name=request.getParameter("userName");
		double mobile=Double.parseDouble(request.getParameter("mobile_number"));
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		int userid=Integer.parseInt(request.getParameter("userId").trim());
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		UserData userData=s.get(UserData.class, userid);
		
		userData.setName(name);
		userData.setMobile(mobile);
		userData.setEmail(email);
		userData.setPassword(password);
		
		tx.commit();
		s.close();
		response.sendRedirect("dashboard.jsp?userId="+userid);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
