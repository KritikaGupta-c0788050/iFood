package iFoodProject;
import java.sql.Connection;

public class Test {

	public static void main(String[] args) throws Exception {
			
		Connection con = DbConnection.getDbConnection("mysql");
		UsersTable.insertUsersRecord("Harmandeep12", "password", "Harman", "Kaur", con);
		
	}

}
