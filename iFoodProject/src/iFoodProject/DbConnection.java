package iFoodProject;
import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	
	public static Connection getDbConnection(String dbName) throws Exception
	{
		Connection conn = null;
		
		if(dbName.equalsIgnoreCase("Oracle"))
		{
			 
				//step1 load the driver class  
				Class.forName("oracle.jdbc.driver.OracleDriver");  
				  
				//step2 create  the connection object  
				conn=DriverManager.getConnection(  
				"jdbc:oracle:thin:@192.168.86.33:1521:xe","Sys as SYSDBA","1234");  
		}
		
		else if(dbName.equalsIgnoreCase("mysql"))
		{
			String url = "jdbc:mysql://localhost:3306/iFood";
			String user = "root";
			String pasword = "";
			
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				conn = DriverManager.getConnection(url,user,pasword);
			
				//here iFood is database name, root is username and password is blank
		}
		
		else
		{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String dbURL = "jdbc:sqlserver://localhost\\sqlexpress;user=sa;password=secret";
			conn = DriverManager.getConnection(dbURL);
		}
		return conn;
		
	}
}
