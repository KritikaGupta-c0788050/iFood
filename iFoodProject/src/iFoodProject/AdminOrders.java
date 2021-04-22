package iFoodProject;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminNewOrders")
public class AdminOrders extends HttpServlet{
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		connection
		Connection conn = DbConnection.getDbConnection("mysql");	
		
//		Get orders from database
		ArrayList<GetPreviousOrders> getOrder = UsersTable.getallorders(conn);
	
//		Passing data to jsp page
		request.setAttribute("data" , getOrder);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminNewOrders.jsp");
		dispatcher.forward(request, response);
	  }
	  
	  @Override
	  protected void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		  try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }

	  @Override
	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		  try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	}
