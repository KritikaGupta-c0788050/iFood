package iFoodProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogout")
public class AdminLogoutController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		HttpSession session = request.getSession(false); //getting to session object

		if(session!=null) // check if condition the session not null

		{

			session.invalidate(); //using this method to destroy the sesion object

			request.setAttribute("errorMS", "Logged out successfully"); //send "errorMSG" object on client side. And get using request.getAttribute() method

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminLogin.jsp"); // using RequestDispatcher method forward to login page.

			requestDispatcher.forward(request, response);

			
	}
}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			doMethod(request, response);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try {
			doMethod(request, response);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
