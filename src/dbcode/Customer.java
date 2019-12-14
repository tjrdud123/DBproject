package dbcode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Customer {
	String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
	String user = "hsy";
	String pass = "hsy";
	Connection conn = null;
	String query = null;
	String id = new String();

	public Customer() {

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

	public int loginCheck(String cid, String cpass) { // 로그인 성공 1 , 로그인 실패 0

		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();

			query = "select id, password from customer order by cid";
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				String id = rs.getString(1);
				String password = rs.getString(2);

				System.out.println(id + " " + cid + " " + password + " " + cpass);

				if (id.equals(cid) && password.equals(cpass)) {
					System.out.println("login succes");
					return 1;
				}
			}
			
			conn.commit();
			conn.setAutoCommit(true);
		
			stmt.close();
		} catch (Exception e) {
			System.err.println("Sql error: " + e.getMessage());
		}

		System.out.println("login failed");
		return 0;
	}

	public int isOverlapped(String _id)// 중복이면 1, 아니면 0 반환
	{
		int result = 0;
		try {
			conn.setAutoCommit(false);

			Statement stmt = conn.createStatement();
			query = "select id from customer";
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				id = rs.getString(1);

				if (id.equals(_id)) {
					result = 1;
				}
			}

			rs.close();
			stmt.close();
			conn.setAutoCommit(true);
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public int newCustomer(String cid, String cpass) {
	
		int result;

		try {
			conn.setAutoCommit(false);
			String sql = "insert into customer values(customerId.nextval, ?, ?)";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, cpass);

			result = pstmt.executeUpdate();
			System.out.println("변경된 row : " + result);

			conn.commit();
			conn.setAutoCommit(true);
			pstmt.close();

		} catch (Exception e) {
			System.err.println("Sql error: " + e.getMessage());
		}

		return 0;
	}

}