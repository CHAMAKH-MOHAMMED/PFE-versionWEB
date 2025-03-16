package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbSingleton {

    // Private static instance of the class
    private static DbSingleton instance;

    // Database connection details
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pfe";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    private Connection conn;

    // Private constructor to prevent instantiation
    private DbSingleton() {
        try {
            Class.forName(jdbcDriver);
            this.conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize database connection", e);
        }
    }

    // Public method to provide access to the singleton instance
    public static  DbSingleton getInstance() {
      
            instance = new DbSingleton();
        
        return instance;
    }

    // Method to get the database connection
    public Connection getConnection() {
        return this.conn;
    }
}