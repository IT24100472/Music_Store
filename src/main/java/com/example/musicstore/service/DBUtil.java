package com.example.musicstore.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    // ✅ Update these values to match your SQL Server configuration
    private static final String DB_URL =
            "jdbc:sqlserver://localhost:1433;databaseName=MusicStore;encrypt=true;trustServerCertificate=true";
    private static final String DB_USER = "sa";
    private static final String DB_PASSWORD = "123";

    /**
     * Always returns a NEW database connection.
     * Use inside try-with-resources:
     *
     * try (Connection conn = DBUtil.getConnection()) { ... }
     */
    public static Connection getConnection() throws SQLException {
        try {
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (SQLException e) {
            System.err.println("❌ Database connection failed: " + e.getMessage());
            throw e; // Let caller handle the exception
        }
    }

    // Prevent instantiation
    private DBUtil() {}
}
