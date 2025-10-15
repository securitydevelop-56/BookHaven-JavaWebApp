package com.bookhaven.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {
    private static String DB_URL;
    private static String DB_USER;
    private static String DB_PASSWORD;

    static {
        try {
            Properties props = new Properties();
            InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
            
            if (input != null) {
                props.load(input);
                DB_URL = props.getProperty("db.url");
                DB_USER = props.getProperty("db.username");
                DB_PASSWORD = props.getProperty("db.password");
                input.close();
            } else {
                DB_URL = "jdbc:postgresql://localhost:5432/bookhaven";
                DB_USER = "postgres";
                DB_PASSWORD = "postgres";
            }
            
            Class.forName("org.postgresql.Driver");
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
