package iFoodProject;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/iFoodPayment")
public class PaymentGateway extends HttpServlet{
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String card_num = request.getParameter("card_num");
		String card_name = request.getParameter("card_name");
		String card_cvv = request.getParameter("card_cvv");
		String payDone = request.getParameter("payDone");
		String paylater = request.getParameter("paylater");
		String orderTime = request.getParameter("ordertime");

		if(paylater != null) {
			
			request.getSession().setAttribute("cart", null); 
			request.setAttribute("pay_msg" , "Order placed! payment will be settled on food delivery!");						
			request.getRequestDispatcher("index.jsp").forward(request, response); return;
		}

//			getting values from existing session variable
			Object products = request.getSession().getAttribute("cart");
			String email = (String) request.getSession().getAttribute("login");
			
//			Converting the object from session into ArrayList of Product
			ArrayList<Product> productsInCart = (ArrayList<Product>) products;
			double total = 0;
		
			
			Iterator<Product> p_it = productsInCart.iterator();
			while(p_it.hasNext()) {
				Product p_obj = (Product) p_it.next();
				total = total + p_obj.getTotal();
			}
			
			
			
//			//connection
			Connection conn = DbConnection.getDbConnection("mysql");
			
			
			if(payDone != null || payDone.length() != 0) {
				Boolean sent = UsersTable.updatepayment(email, total, orderTime,conn);
				if(sent) {
					request.getSession().setAttribute("cart", null);
					request.setAttribute("pay_msg" , "Order placed! payment Successful.");						
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}else {
					response.sendError(0, "Try Again");
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
		
