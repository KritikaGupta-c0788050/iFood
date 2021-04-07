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

@WebServlet("/iFoodLogin")
public class LoginController extends HttpServlet {

	/**
	 * @param args
	 * @throws Throwable 
	 */
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		//connection
		Connection con = DbConnection.getDbConnection("mysql");
		
//		Checking if the user credentials are correct
		Boolean permit = UsersTable.loginPermissionRecord(username, password, con);
		if(permit) {	//if correct letting in
			response.sendRedirect("food/index.html");
		}
		else {	//else error page
			response.sendRedirect("error.html");
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

