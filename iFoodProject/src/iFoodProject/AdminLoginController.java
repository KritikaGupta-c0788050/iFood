package iFoodProject;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class AdminLoginController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
//		System.out.println("0");
//		//connection
		Connection con = DbConnection.getDbConnection("mysql");
//		System.out.println("1");
//		Checking if the user credentials are correct
		Boolean permit = UsersTable.adminloginPermission(email, password, con);
		if(permit) {	//if correct letting in
//			System.out.println("2");
			if(request.getSession().getAttribute("adminlogin")==null) {
				System.out.println("3");
				request.getSession().setAttribute("adminlogin", email);
				response.sendRedirect("admin.jsp");
			}else {
				request.getSession().setAttribute("adminlogin", email);
				response.sendRedirect("admin.jsp");
			}
			}else {	//else error page
			response.sendRedirect("error.html");
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


