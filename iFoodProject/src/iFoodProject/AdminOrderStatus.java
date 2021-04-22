package iFoodProject;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/adminUpdateOrder")
public class AdminOrderStatus extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String items = request.getParameter("items");
		String cost = request.getParameter("cost");
		String orderby = request.getParameter("orderby");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String payment_status = request.getParameter("payment_status");
		String order_time = request.getParameter("ordertime");
		String order_status = request.getParameter("order_status");
		String order_delivered = request.getParameter("order_delivered");
		String email = request.getParameter("email");
		
//		System.out.println(items+" "+cost+" "+orderby+" "+phone+" "+address+" "+payment_status+" "+order_time+" "+order_status+" "+order_delivered+" "+email);

//		//connection
		Connection con = DbConnection.getDbConnection("mysql");
		
//		Add Review
		if(order_delivered != null) {
			int update_status = UsersTable.orderDelivered( email, items, cost, orderby, phone, address, payment_status, order_time, order_status, con);
			if(update_status > 0) {
				String msg="Order delivery status updated successfuly.";
				request.setAttribute("msg" , msg);						
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}else {
				String msg="Try again!";
				request.setAttribute("msg" , msg);						
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
		}
////		Cancelling Order
//		if(cancel != null) {
//			int cstatus = UsersTable.cancelOrder(email, items, cost, orderby, phone, address, payment_status, order_time, order_status, con);
//			if(cstatus > 0) {
//				if(payment_status.contentEquals("paid")) {
//					String msg="Order cancelled. You will receive your money within 3 business days.";
//					request.setAttribute("msg" , msg);						
//					request.getRequestDispatcher("index.jsp").forward(request, response);
//				}else {
//					String msg="Order cancelled. We don't owe you anything as the order was not paid.";
//					request.setAttribute("msg" , msg);						
//					request.getRequestDispatcher("index.jsp").forward(request, response);
//				}
//			}
//		}

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



