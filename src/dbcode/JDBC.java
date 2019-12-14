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
         System.out.println("����̹� �˻� ����!");
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

   public boolean isOverlapped(String _id)// �ߺ��̸� true, �ƴϸ� false ��ȯ
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