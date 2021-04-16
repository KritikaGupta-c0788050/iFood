/**
 * 
 */
package iFoodProject;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * 
 * @author Kritika Gupta c0788050
 *
 */

@WebServlet("/iFoodcontact")

public class ContactController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		
//		connection
		Connection con = DbConnection.getDbConnection("mysql");
		
//		Checking if the user credentials are correct
		int permit = UsersTable.contactUsData(firstname, lastname, email, phone, message, con);
		if(permit > 0) {	//if correct letting in
			String msg="Thank you! your message has reached us. We will contact you shortly!";
			response.sendRedirect("index.jsp?msg="+msg);
		}
		else {	//else error page
			response.sendRedirect("error404/error.html");
		}
//		response.sendRedirect("index.html");
				
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