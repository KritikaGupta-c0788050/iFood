package iFoodProject;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addP")
public class AddToCart extends HttpServlet{

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
//		getting user'd input value
		String pName = request.getParameter("item_name");
		String price = request.getParameter("amount");
		String total = request.getParameter("amount");
		String pImg = request.getParameter("img");
//		onverting quantity into integer value
		double num_total = Double.parseDouble(total);
		double num_price = Double.parseDouble(price);
		int quantity = 1;
	
//	checking if session variable is null that is there or creating one	
		if(request.getSession().getAttribute("cart")==null) {

//			Creating a new ArrayList of Product class
			ArrayList<Product> productsInCart = new ArrayList<Product>();
			
//			Creting a Session Variable and giving it arraylist
			request.getSession().setAttribute("cart", productsInCart);

		}
		
//		getting values from existing session variable
		Object products = request.getSession().getAttribute("cart");
		
//		Converting the object from session into ArrayList of Product
		ArrayList<Product> productsInCart = (ArrayList<Product>) products;

//		Calling a function to check if the product entered exists already
		Product pTmp = findExistingProduct(pName,num_total,productsInCart);
		
//		if the product entered is new then adding it to cart
		if(pTmp == null) {
				Product p_obj = new Product(pName,num_price,quantity,num_total,pImg);
				productsInCart.add(p_obj);
		}
		
//		Showing the user's cart	
//		System.out.println("*******Add Cart Servlet*********");
		response.sendRedirect("cart.jsp");
		
	}
	
//	Method to check if the product entered by user exists already
	private Product findExistingProduct(String pName, double total, ArrayList<Product> productsInCart) {
//		iterator for the existing arrayList
		Iterator<Product> p_it = productsInCart.iterator();
		while(p_it.hasNext()) {
			
			Product p_obj2 = (Product) p_it.next();
			
//			if the product exists then adding the quantity to the cart
			if(p_obj2.getName().contentEquals(pName))	{
				
				//System.out.println("Yes2");
				int tmp_quantity = p_obj2.getQuantity();
				double tmp_total = p_obj2.getTotal();
				p_obj2.setQuantity(tmp_quantity+1);
				p_obj2.setTotal(tmp_total+total);
				
				return p_obj2;
			}
		}
		return null;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		doMethod(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		doMethod(request, response);
	}
}

