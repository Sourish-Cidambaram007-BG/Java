package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestDB {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/ebook_app"; // Change DB name if needed
        String user = "root"; // Change to your MySQL username
        String password = "Sourish@2004"; // Change to your MySQL password

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection conn = DriverManager.getConnection(url, user, password);

            if (conn != null) {
                System.out.println("✅ Database Connected Successfully!");
            } else {
                System.out.println("❌ Database Connection Failed!");
            }

            // Close connection
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("❌ MySQL JDBC Driver Not Found!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("❌ Database Connection Error!");
            e.printStackTrace();
        }
    }
}
