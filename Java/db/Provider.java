package db;
import java.sql.*;

public class Provider {
    public static Connection getOracleConnection()
    {
        Connection con = null;
        try
        { 
            // MySQL Driver class
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // MySQL URL: quizdb database aur aapka username/password
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quizdb?useSSL=false&allowPublicKeyRetrieval=true", "root", "Khushi@12345");
            System.out.println("Connection successful!");
        }
        catch (Exception e) 
        {
            e.printStackTrace();
        }
        return con;
    }
}