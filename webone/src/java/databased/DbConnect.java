package databased;

import java.sql.Connection;
import oracle.jdbc.OracleDriver;
import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Scanner;

public class DbConnect {
    public static void main(String[] args) {
       
        Connection c=connect();
        System.out.println(c);
    }
    public static Connection connect() {
        try {
            String user = "system", url = "jdbc:oracle:thin:@localhost:1521:xe", password = "wrong";
            DriverManager.registerDriver(new OracleDriver());
            return DriverManager.getConnection(url, user, password);
        } catch (Exception ex) {
            System.out.println(ex);
            return null;
        }
    }

  
    }

