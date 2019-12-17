package dbcode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

	public int buy(int bid, String id, int bcnt) {
		try {
			int cid = 0;

			conn.setAutoCommit(false);

			query = "select cid from customer where id = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				cid = rs.getInt(1);
			}

			String sql = "insert into buy values(?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, cid);
			pstmt.setInt(3, bcnt);

			int result = pstmt.executeUpdate();
			System.out.println("변경된 row : " + result);

			sql = "insert into purchase_history values(?, ?, ?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, bid);
			pstmt.setInt(3, bcnt);

			result = pstmt.executeUpdate();

			conn.commit();
			conn.setAutoCommit(true);
			conn.close();

		} catch (Exception e) {
			System.err.println("Sql error: " + e.getMessage());
		}

		return 0;
	}

	public int buyContent(String id) {
		try {
			int cid = 0;

			conn.setAutoCommit(false);

			query = "select cid from customer where id = ?";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				cid = rs.getInt(1);
			}

			query = "select book.book_id, book.book_name, buy.book_cnt from buy, book where buy.cid = ?";

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int empno = rs.getInt(1);
				String ename = rs.getString(2);
				int deptno = rs.getInt(3);

				System.out.println(empno + "\t" + ename + "\t" + deptno + "\t");
			}

			conn.commit();
			conn.setAutoCommit(true);
			conn.close();

		} catch (Exception e) {
			System.err.println("Sql error: " + e.getMessage());
		}

		return 0;
	}

	public ArrayList<Book> recommendBook(int book_id) {
		ArrayList<Book> bookList = new ArrayList<>();

		try {
			conn.setAutoCommit(false);
			String sql = "select gname from book where book_id=" + book_id;
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String gname = null;
			if (rs.next())
				gname = rs.getString(1);

			rs.close();
			stmt.close();

			sql = "select * from(" + "select * from book where gname=? order by dbms_random.value)"
					+ "where rownum < 5";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, gname);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				Book book = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(6), rs.getString(7), rs.getInt(8), rs.getInt(9));
				bookList.add(book);
			}
			conn.commit();
			conn.setAutoCommit(true);
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.err.println("Sql error: " + e.getMessage());
		}

		return bookList;
	}
}