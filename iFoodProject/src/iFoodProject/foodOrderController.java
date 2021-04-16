/**
 * 
 */
package iFoodProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * @author kritikagupta
 *
 */
@WebServlet("/foodOrder")
public class foodOrderController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doMethod(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 try (PrintWriter out = response.getWriter()) {
			String op = request.getParameter("operation");
			
			Connection con = DbConnection.getDbConnection("mysql");			
			 
			 if (op.equals("food_item")) {
	                ArrayList<Food> foodlist = UsersTable.getFoodItems(con);
//	                for(int i =0;i<foodlist.size(); i++) {
//	        			
//	        			Food p_obj3 = foodlist.get(i);
//	        			System.out.println(p_obj3.getId()+" "+p_obj3.getFood()+" "+p_obj3.getPrice());
//	        					
//	        			
//	        		}
	                Gson json = new Gson();
	                String listTojson = json.toJson(foodlist);
	                response.setContentType("text/html");
	                System.out.println(listTojson);
	                response.getWriter().write(listTojson);
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
