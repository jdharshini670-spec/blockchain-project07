package com.example;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            String mysqlUrl = System.getenv("MYSQL_URL");

            if (mysqlUrl == null || mysqlUrl.isEmpty()) {
                System.out.println("MYSQL_URL not found.");
                return null;
            }

            if (mysqlUrl.startsWith("mysql://")) {
                mysqlUrl = "jdbc:" + mysqlUrl;
            }

            return DriverManager.getConnection(mysqlUrl);

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL Driver not found.");
            e.printStackTrace();

        } catch (SQLException e) {

            System.out.println("Database Connection Failed.");
            e.printStackTrace();
        }

        return null;
    }
}