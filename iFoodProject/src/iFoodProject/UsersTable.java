package iFoodProject;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Set;

import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    

/**
 * 
 * 
 * @author Kritika Gupta c0788050
 *
 */

public class UsersTable {
	
//	Method for checking if the user mail already exists 
	public static boolean existingMail(String email,Connection conn) {
		PreparedStatement stmt = null;
		ResultSet rst = null;
//		System.out.print("All Good1");
//		 table and checking if the entered email matches any
		
		try {
			DatabaseMetaData dbm = conn.getMetaData();
			ResultSet tables = dbm.getTables(null, null, "register", null);
			if (tables.next()) {
//				Selecting data from database table and checking if the entered email matches any
				stmt =conn.prepareStatement("Select * from register where email = ?");
				stmt.setString(1, email);
			
//				Storing the result
				rst = stmt.executeQuery();		
			
//				if result exists Than
				if(rst.next()) {
				
//				checking if the ResultSet has the same email address
					if(rst.getString("email").contentEquals(email)){
						return true;	//if yes then sending True as there is a match				
					}else {
					return false; //no existing mail
					}
				}else {
					return false; //no resulted fetched
				}
			}else {//if table donot exist then creating table and returning false as email cannot exist
				stmt =conn.prepareStatement("CREATE TABLE IF NOT EXISTS register ("
						+"id BIGINT NOT NULL AUTO_INCREMENT,"
						+"name VARCHAR(25),"
						+"email VARCHAR(35),"
						+"address TEXT,"
						+"phone INT(20)"
						+"password VARCHAR(30),"
						+"PRIMARY KEY(id),"
						+"UNIQUE (email)"
						+")");
				return false;
			}
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return false;
	}
	
//	Method for User regisstration
	public static int RegisterRecord(String username, String email, String address, String phone, String password, Connection conn)
	{
		PreparedStatement stmt = null;	
		try {
			
//			sql for data insertion
			stmt =conn.prepareStatement("insert into register (name, email, address, phone, password) values(?,?,?,?,?)");
			stmt.setString(1, username);
			stmt.setString(2, email);
			stmt.setString(3, address);
			stmt.setString(4, phone);
			stmt.setString(5, password);
		
//			executind query
			int query_success = stmt.executeUpdate();
			
//		sending boolean true is the statement executed successfuly
			return query_success;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return 0;
		
		
	}
	
//	Method for checking login credentials of User with Database
	public static boolean loginPermissionRecord(String usermail, String password, Connection conn)
	{
//		System.out.println(usermail+password);
		PreparedStatement stmt = null;
		ResultSet rst = null;
//		System.out.print("All Good1");
		try {
//			Select statement to find the user's login credentials in database if exists
			stmt =conn.prepareStatement("Select * from register where email = ?");
			stmt.setString(1, usermail);
			rst = stmt.executeQuery();		
			
//			if the query has the resultset
			if(rst.next()) {
//				System.out.print(rst.getString("email")+" "+rst.getString("password"));
//				Matching the user's email and password with the entered mail and password
				if(rst.getString("email").contentEquals(usermail) && rst.getString("password").contentEquals(password)){
					return true;		//if there is a match then it sends boolean true			
				}else {
					return false;	//else false
				}
			}else {
				return false;	// if there is no resultset in that case too it sends false
			}
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return false;
	}
	
	public static  int contactUsData(String firstname, String lastname, String email, String phone, String message,
			Connection conn) {
		
		PreparedStatement stmt = null;
		
		try {
			stmt =conn.prepareStatement("insert into contactUs (firstname, lastname, email, phone, message) values(?,?,?,?,?)");
			stmt.setString(1, firstname);
			stmt.setString(2, lastname);
			stmt.setString(3, email);
			stmt.setString(4,phone);
			stmt.setString(5, message);
			
			int query_status = stmt.executeUpdate();
			return query_status;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return 0;
		
	}
	

	public static ArrayList<Food> getFoodItems(Connection conn)
	{
		PreparedStatement stmt = null;
		ResultSet result = null;
		ArrayList<Food> food_list = new ArrayList<Food>();
		try {
			stmt =conn.prepareStatement("SELECT food, price FROM menu");
			result = stmt.executeQuery();
			System.out.println("Success");
			while(result.next()) {
				Food food_obj = new Food();
				
				food_obj.setFood(result.getString("food"));
				food_obj.setPrice(result.getDouble("price"));
//				System.out.println(result.getString("food")+result.getDouble("price"));
				food_list.add(food_obj);
				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return food_list;
		
		
	}
	
	public static Boolean addMenu(String menuname, String price, String token, String filePath,
			Connection conn) {
//      query to insert name and image name
     PreparedStatement pst;
      try {
    	  String query = "INSERT INTO menu (food,price,token,food_url) values (?, ?,?,?)";
    	  pst = conn.prepareStatement(query);
    	  pst.setString(1, menuname);
    	  pst.setString(2, price);
    	  pst.setString(3, token);
    	  pst.setString(4, filePath);
    	  pst.executeUpdate();
    	  return true;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
		return null;
	}
	
	public static Customer getUserInfo(String email, Connection conn) {
		PreparedStatement stmt = null;
		ResultSet result = null;
		Customer cust = new Customer();
		try {
			stmt =conn.prepareStatement("SELECT name, email, address, phone FROM register where email = ?");
			stmt.setString(1, email);
			result = stmt.executeQuery();
//			System.out.println("Success");
			while(result.next()) {
				cust.setName(result.getString("name"));
				cust.setEmail(result.getString("email"));
				cust.setPhone(result.getString("phone"));
				cust.setAddress(result.getString("address"));
//				System.out.println(result.getString("name")+result.getString("email")+result.getString("phone")+result.getString("address"));
				
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return cust;
		
	}

	public static String sendOrder(String items, String quantities, int total, String name, String email,
			String phone, String address, Connection conn) {
		PreparedStatement pst;
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now(); 
	      try {
	    	  String query = "INSERT INTO customer_orders (items,quantity,cost,username,email,phone,address) values (?,?,?,?,?,?,?)";
	    	  pst = conn.prepareStatement(query);
	    	  pst.setString(1, items);
	    	  pst.setString(2, quantities);
	    	  pst.setInt(3, total);
	    	  pst.setString(4, name);
	    	  pst.setString(5, email);
	    	  pst.setString(6, phone);
	    	  pst.setString(7, address);
	    	  pst.executeUpdate();
	    	  String ordertime = dtf.format(now);
	    	  return ordertime;
	      } catch (SQLException e) {
	  		// TODO Auto-generated catch block
	  		e.printStackTrace();
	  	}
	        
		return null;
	}
	
	
	public static Boolean updatepayment(String email, int total, String orderTime, Connection conn) {
		PreparedStatement stmt = null;
		String paid = "paid";
		try {
			stmt =conn.prepareStatement("UPDATE customer_orders SET payment_status = ? WHERE email = ? AND cost = ? AND time = ?");
			stmt.setString(1, paid);
			stmt.setString(2,email);
			stmt.setInt(3,total);
			stmt.setString(4,orderTime);
			
			stmt.executeUpdate();
			return true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return false;
	}
	
	public static String getname(String usermail,Connection conn)
	{
//		System.out.println(usermail+password);
		PreparedStatement stmt = null;
		ResultSet rst = null;
//		System.out.print("All Good1");
		try {
//			Select statement to find the user's login credentials in database if exists
			stmt =conn.prepareStatement("Select name from register where email = ?");
			stmt.setString(1, usermail);
			rst = stmt.executeQuery();		
			
//			if the query has the resultset
			if(rst.next()) {
				return rst.getString(0);
			}else {
				return null;	// if there is no resultset in that case too it sends false
			}
		} 
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return null;
	}
	
	public static ArrayList<GetPreviousOrders> getorders(String email, Connection conn) {
		PreparedStatement stmt = null;
		ResultSet rst = null;
		ArrayList<GetPreviousOrders> list_order = new ArrayList<>();
//		System.out.print("All Good1");
		try {
//			Select statement to find the user's login credentials in database if exists
			stmt =conn.prepareStatement("Select * from customer_orders where email = ?");
			stmt.setString(1, email);
			rst = stmt.executeQuery();		
//			System.out.print("All Good2");
//			if the query has the resultset
			while(rst.next()) {
//				System.out.print("All Good3");
				GetPreviousOrders orders = new GetPreviousOrders(rst.getString("items"),rst.getString("quantity"),rst.getInt("cost"),rst.getString("username"),rst.getString("phone"),rst.getString("address"),rst.getString("payment_status"),rst.getString("time"),rst.getString("order_status"),rst.getString("email"));
//				System.out.print("All Good4");
				list_order.add(orders);
//				System.out.print("All Good5");
				
			}
			return list_order;
		} 
		catch(SQLException e) {
			System.out.print("Oops");
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		return null;
	}
	
	public static void deleteUsersRecord(String username, String password, String firstname, String lastname, Connection conn)
	{
		
		PreparedStatement stmt = null;
		
		try {
			stmt =conn.prepareStatement("_________________________________");
			stmt.setString(1, " _______");
			stmt.setString(2,"   ______________");
			
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		
		
	}
	
	public static void updateUsersRecord(String username, String password, String firstname, String lastname, Connection conn)
	{
		
		PreparedStatement stmt = null;
		
		try {
			stmt =conn.prepareStatement("_________________________________");
			stmt.setString(1, " _______");
			stmt.setString(2,"   ______________");
			
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		finally {
			try {
				stmt.close();
			}
			catch(SQLException s)
			{
				s.printStackTrace();
			}
		}
		
		
	}



	

	

	






	
	


	
	
}
