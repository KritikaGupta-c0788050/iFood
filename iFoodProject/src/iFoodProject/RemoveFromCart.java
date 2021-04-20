package iFoodProject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/removeP")
public class RemoveFromCart extends HttpServlet{

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String pName = request.getParameter("pName");		
		
		if(request.getSession().getAttribute("cart")==null) {
			
			ArrayList<Product> productsInCart = new ArrayList<Product>();
			
			request.getSession().setAttribute("cart", productsInCart);

		}
		
		Object products = request.getSession().getAttribute("cart");
		ArrayList<Product> productsInCart = (ArrayList<Product>) products;
		
		int pTmp = findExistingProduct(pName, productsInCart);
			
//		setting the attribute to be forwarded to matrix.jsp
		if(pTmp == 0) {
			
			String message = "Product removed successfully.";
			
			request.setAttribute("msg" , message);
			
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		
		}else {
			
			String message = "Sorry! try removing again!";
			
			request.setAttribute("msg" , message);
			
			request.getRequestDispatcher("cart.jsp").forward(request, response);
//			response.sendRedirect("cart.jsp");
		}

		

		
	}
	
	private int findExistingProduct(String pName, ArrayList<Product> productsInCart) {
		
		Iterator<Product> p_it = productsInCart.iterator();
		while(p_it.hasNext()) {
			
			Product p_obj2 = (Product) p_it.next();
			if(p_obj2.getName().contentEquals(pName))	{
			
				productsInCart.remove(p_obj2);
				return 0;
			}
		}
	
		return 1;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doMethod(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doMethod(request, response);
	}
}
