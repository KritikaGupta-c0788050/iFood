package iFoodProject;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/iFoodOrderStatus")
public class OrderStatus extends HttpServlet{
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//	getting values from existing session variable
		String email = (String) request.getSession().getAttribute("login");
		
//		connection
		Connection conn = DbConnection.getDbConnection("mysql");	
		
//		Get orders from database
		ArrayList<GetPreviousOrders> getOrder = UsersTable.getorders(email,conn);
	
//		Passing data to jsp page
		request.setAttribute("data" , getOrder);
		RequestDispatcher dispatcher = request.getRequestDispatcher("showOrder.jsp");
		dispatcher.forward(request, response);
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
