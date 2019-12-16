package dbcode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Book {
	String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
	String user = "hsy";
	String pass = "hsy";
	Connection conn = null;
	String query = null;
	String id = new String();

	public Book() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			System.err.println("error: " + e.getMessage());
			System.exit(1);
		}

		try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			System.err.println("Sql error: " + e.getMessage());
			System.exit(1);
		}
	}
	

}
