package iFoodProject;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/iFoodforgotpass")
public class ForgotPassword extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @param args
	 * @throws Throwable 
	 */
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String email = request.getParameter("email");
		
//		//connection
		Connection con = DbConnection.getDbConnection("mysql");
		
//		Checking if the user credentials are correct
		String str_pass = UsersTable.passwordRecovery(email, con);
		if(str_pass != null) {	//if correct letting in
//			sending email to the user for their registeration success
			String subject ="iFood Password Recovery";
			String message ="Your iFood login credentials are: \n email: "+email+" and password: "+str_pass;
			
			String [] recepients =new String[]{email};
			new SendEmailFunctionality().sendMail(recepients, recepients, subject, message);
			request.setAttribute("msg" , "Your login credentials are sent to your registered mail, please check and login");		
			response.sendRedirect("login.jsp");
			
			}else {
				request.setAttribute("msg" , "No such user exist, please register.");		
				response.sendRedirect("Register.jsp");
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

