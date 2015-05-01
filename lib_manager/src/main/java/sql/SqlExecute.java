package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;


public class SqlExecute {
	private static String config="config.config";
	private static ResourceBundle resource;
	
	static{
		
	}
	public static Connection getConnection(){
		Connection connection = null ; 
		try {
            Class.forName("com.mysql.jdbc.Driver");  
 
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
        }
 
        String url = "jdbc:mysql://127.0.0.1:3306/lib_manager"; 
        //?useUnicode=yes&characterEncoding=UTF-8
        try {
           
            connection = DriverManager.getConnection(url, "root", "");
            System.out.print("Kết nối thành công");
        } catch (SQLException e) {
            e.printStackTrace();
            connection = null;
        }
		return connection;
	}
	public static ResultSet executeCommand(String sqlCommand){
		ResultSet resultSet = null ;
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Lỗi kết nối  CSDL");
			return null ;
		}
		try {
			Statement statement = connection.createStatement();
			resultSet = statement.executeQuery(sqlCommand);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Message : " + e.getMessage());
			e.printStackTrace();
			resultSet = null ;
		}
		
		return resultSet;
	}
	public static boolean executeUpdate(String sqlCommand){
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Kết nối CSDL bị lỗi");
			return false ;
		}
		try{
			Statement statement = connection.createStatement();
			statement.executeUpdate(sqlCommand);
		}catch(SQLException e){
			System.out.println("Err ");
			System.out.println("Message : " + e.getMessage());
			e.printStackTrace();
			return false ;
		}
		return true;
	}
}
