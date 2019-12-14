package dbcode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBC {
   String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
   String user = "kdhong";
   String pass = "kdhong";
   Connection conn = null;
   String query = null;
   
   public JDBC() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         System.out.println("드라이버 검색 성공!");
      } catch (ClassNotFoundException e) {
         System.err.println("error = " + e.getMessage());
         System.exit(1);
      }
      try {
         conn = DriverManager.getConnection(url, user, pass);
      } catch (SQLException e) {
         System.err.println("sql error = " + e.getMessage());
         System.exit(1);
      }
   }

   public boolean isOverlapped(String _id)// 중복이면 true, 아니면 false 반환
   {
      Boolean result = false;
      try {
         conn.setAutoCommit(false);

         Statement stmt = conn.createStatement();
         query = "select id from customer;";
         ResultSet rs = stmt.executeQuery(query);

         while (rs.next()) {
            String id = rs.getString(1);

            if (id.equals(_id)) {
               result = true;
            }
         }

         rs.close();
         stmt.close();
         conn.setAutoCommit(true);
         conn.close();

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      return result;
   }
}