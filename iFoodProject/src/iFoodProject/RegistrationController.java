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

@WebServlet("/iFoodRegister")
public class RegistrationController extends HttpServlet{

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String rePassword = request.getParameter("re_pass");
		

		
//		checking if password and rePassword have save values
		if(password.equals(rePassword)) {
		
//			connection variable
			Connection con = DbConnection.getDbConnection("mysql");
			
//			if user is new that is mail donot exist
			if(!UsersTable.existingMail(email,con)){
				
//				Inserting user details in database
				int query_result = UsersTable.RegisterRecord(username, email, password, con);
//				if inserted 
				if(query_result>0) {
					response.sendRedirect("login.html");
				}else { //else
					response.sendRedirect("error.html");
				}
			}else {	//if mail already exists then :
//				response.sendRedirect("login.html");
				System.out.println("Account already exists. Please try login");
			}
		}else {
			response.sendRedirect("Register.html");
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
