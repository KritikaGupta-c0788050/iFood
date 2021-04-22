package iFoodProject;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/iFoodOrderDetails")
public class OrderDetails extends HttpServlet{
		public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			String dine = request.getParameter("dine");
			String homeDeliver = request.getParameter("deliver");
			String newDeliver = request.getParameter("newdeliver");
			String newPhone = request.getParameter("phone");
			String newAddress = request.getParameter("address");

//			System.out.println(dine+" "+homeDeliver+" "+newDeliver+" ");
	
//				getting values from existing session variable
				Object products = request.getSession().getAttribute("cart");
				String email = (String) request.getSession().getAttribute("login");
				
//				Converting the object from session into ArrayList of Product
				ArrayList<Product> productsInCart = (ArrayList<Product>) products;
				ArrayList<String> names = new ArrayList<String>();
				ArrayList<String> quantity = new ArrayList<String>();
				double total = 0;
				String items = "";
				String quantities = "";
				
				Iterator<Product> p_it = productsInCart.iterator();
				while(p_it.hasNext()) {
					Product p_obj = (Product) p_it.next();
					names.add(p_obj.getName());
					quantity.add(Integer.toString(p_obj.getQuantity()));
					total = total + p_obj.getTotal();
				}
				
				for(String s : names) {
					items += s;
					items += "\t";
				}
				for(String s : quantity) {
					quantities += s;
					quantities += "\t";
				}
				
				
//				//connection
				Connection conn = DbConnection.getDbConnection("mysql");			
				
				if(dine != null) {
					String msg = "We will be waiting for you, come soon!";
					Customer cust = UsersTable.getUserInfo(email,conn);
					String sent = UsersTable.sendOrder(items,quantities,total,cust.getName(),cust.getEmail(),cust.getPhone(),"dine_in",conn);
					if(sent != null) {
//						System.out.println("Success");
						request.setAttribute("ordertime" , sent);						
						request.getRequestDispatcher("payment.jsp").forward(request, response);
						return;
					}else {
						response.sendError(0, "Try Again");
					}
				}
				
				
				
				if(homeDeliver != null) {
					Customer cust = UsersTable.getUserInfo(email,conn);
					String sent = UsersTable.sendOrder(items,quantities,total,cust.getName(),cust.getEmail(),cust.getPhone(),cust.getAddress(),conn);
					if(sent != null) {
//						System.out.println("Success");
						request.setAttribute("ordertime" , sent);						
						request.getRequestDispatcher("payment.jsp").forward(request, response);
						return;
					}else {
						response.sendError(0, "Try Again");
					}
				}
				
				if(newDeliver != null) {
					Customer cust = UsersTable.getUserInfo(email,conn);
					String sent = UsersTable.sendOrder(items,quantities,total,cust.getName(),cust.getEmail(),newPhone,newAddress,conn);
					if(sent != null) {
//						System.out.println("Success");
						request.setAttribute("ordertime" , sent);						
						request.getRequestDispatcher("payment.jsp").forward(request, response);
						return;
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
			
