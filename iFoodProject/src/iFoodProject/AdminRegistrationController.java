package iFoodProject;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminRegister")
public class AdminRegistrationController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String password = request.getParameter("pass");
		String rePassword = request.getParameter("re_pass");
		
		System.out.println("1");
//		checking if password and rePassword have save values
		if(password.equals(rePassword)) {
			System.out.println("2");
//			connection variable
			Connection con = DbConnection.getDbConnection("mysql");
			System.out.println("3");
//			if user is new that is mail donot exist
			if(!UsersTable.adminExistingMail(email,con)){
				System.out.println("9");
//				Inserting user details in database
				int query_result = UsersTable.addAdmin(username, email, phone, password, con);
//				if inserted 
				if(query_result>0) {
					System.out.println("10");
//					sending email to the user for their registeration success
					String subject ="iFood Registration Successful";
					String message ="Your registration with iFood as admin is successful with the credentials: \n email: "+email+" and password: "+password;
					
					String [] recepients =new String[]{email};
					new SendEmailFunctionality().sendMail(recepients, recepients, subject, message);
					System.out.println("11");
					request.setAttribute("msg" , "New admin account created successfuly.");		
					response.sendRedirect("admin.jsp");
				}else { //else
					response.sendRedirect("error.html");
				}
			}else {	//if mail already exists then :
				request.setAttribute("msg" , "Account already exists.");						
				request.getRequestDispatcher("admin.jsp").forward(request, response);
				
//				response.sendRedirect("Register.jsp?acc="+msg);
//				System.out.println("Account already exists. Please try login");
			}
		}else {
			response.sendRedirect("adminAddMenu.jsp");
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
