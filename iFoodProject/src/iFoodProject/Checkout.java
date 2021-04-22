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

@WebServlet("/iFoodCheckout")
public class Checkout extends HttpServlet{
	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String updates = request.getParameter("updatedData");
		ArrayList<String> names = new ArrayList<String>();
		ArrayList<Integer> quantity = new ArrayList<Integer>();
		if(updates.contains(",")) {
			String[] str = updates.split(",");
//			System.out.println(str);
			for(String s: str) {
				String[] abc = s.split(":");
				names.add(abc[0]);
				quantity.add(Integer.parseInt(abc[1]));
			}
		}else {
			String[] abc = updates.split(":");
			names.add(abc[0]);
			quantity.add(Integer.parseInt(abc[1]));
		}
		
//		checking if session variable is null that is there or creating one	
			if(request.getSession().getAttribute("cart")==null) {

//				Creating a new ArrayList of Product class
				ArrayList<Product> productsInCart = new ArrayList<Product>();
				
//				Creting a Session Variable and giving it arraylist
				request.getSession().setAttribute("cart", productsInCart);

			}
			
//			getting values from existing session variable
			Object products = request.getSession().getAttribute("cart");
			
//			Converting the object from session into ArrayList of Product
			ArrayList<Product> productsInCart = (ArrayList<Product>) products;
			
//			Updating the order
			Iterator<Product> p_it = productsInCart.iterator();
			while(p_it.hasNext()) {
				Product p_obj2 = (Product) p_it.next();
//				System.out.println(p_obj2.getImg()+" "+p_obj2.getName()+" "+p_obj2.getPrice()+" "+p_obj2.getTotal()+" "+p_obj2.getQuantity());
				for(int i = 0; i< names.size(); i++) {
					if(p_obj2.getName().contentEquals(names.get(i))) {
						p_obj2.setQuantity(quantity.get(i));
						double total = quantity.get(i) * p_obj2.getPrice();
						p_obj2.setTotal(total);
					}
				}
			}
			if(request.getSession().getAttribute("login")==null) {
				response.sendRedirect("login.jsp");
			}else {
				
				response.sendRedirect("confirmation.jsp");
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
