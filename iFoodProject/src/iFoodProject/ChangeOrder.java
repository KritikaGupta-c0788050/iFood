package iFoodProject;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/iFoodChange")
public class ChangeOrder extends HttpServlet{
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String items = request.getParameter("items");
		String cost = request.getParameter("cost");
		String orderby = request.getParameter("orderby");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String payment_status = request.getParameter("payment_status");
		String order_time = request.getParameter("ordertime");
		String order_status = request.getParameter("order_status");
		String review = request.getParameter("review");
		String rev_btn = request.getParameter("rev_btn");
		String cancel = request.getParameter("cancel");
//		System.out.println(items+" "+cost+" "+orderby+" "+phone+" "+address+" "+payment_status+" "+order_time+" "+order_status+" "+review+" "+rev_btn+" "+cancel);

		String email = (String) request.getSession().getAttribute("login");
//		//connection
		Connection con = DbConnection.getDbConnection("mysql");
		
//		Add Review
		if(rev_btn != null && !(review.isEmpty())) {
			int rstatus = UsersTable.addReview(email, items, cost, orderby, phone, address, payment_status, order_time, order_status,review, con);
			if(rstatus > 0) {
				String msg="Review updated. We will always try to reach your expectations.";
				request.setAttribute("msg" , msg);						
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				String msg="Try again!";
				request.setAttribute("msg" , msg);						
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
//		Cancelling Order
		if(cancel != null) {
			int cstatus = UsersTable.cancelOrder(email, items, cost, orderby, phone, address, payment_status, order_time, order_status, con);
			if(cstatus > 0) {
				if(payment_status.contentEquals("paid")) {
					String msg="Order cancelled. You will receive your money within 3 business days.";
					request.setAttribute("msg" , msg);						
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}else {
					String msg="Order cancelled. We don't owe you anything as the order was not paid.";
					request.setAttribute("msg" , msg);						
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
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


