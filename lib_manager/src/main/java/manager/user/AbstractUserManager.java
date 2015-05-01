package manager.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;




import sql.SqlExecute;

/*
 */
public abstract class AbstractUserManager implements UserManager {
	protected final String PATRON_TABLE_NAME = "patron";
	protected final String PATRON_USER_NAME="user_name";
	protected final String PATRON_USER_ID="user_id";
	protected final String PATRON_PASSWORD="user_password";
	protected final String PATRON_EMAIL = "email";
	protected final String PATRON_FULL_NAME ="full_name" ;
	protected final String PATRON_BIRTHDAY="birthday";
	protected final String PATRON_ADDRESS="address";
	protected final String PATRON_TYPE ="patron_type" ;

	
	/**
	 * insert a patron into patron table
	 * @param patron
	 * @return true if success
	 */
  public boolean insert(Patron patron) {
	  //Tao mot cau truy van
	  String sql = "INSERT INTO " + PATRON_TABLE_NAME + 
		"("+PATRON_USER_NAME + "," + PATRON_PASSWORD +","+ PATRON_EMAIL +","+ PATRON_BIRTHDAY +","+ PATRON_ADDRESS + "," + PATRON_FULL_NAME +"," +PATRON_TYPE+ ")"
		+ " VALUES(?,?,?,?,?,?,?)";
	  
	  //Lay ve connection toi CSDL
		Connection connection = SqlExecute.getConnection();
		
		if(connection == null){
			//Connect toi CSDL khong thanh cong
			System.out.println("Loi ket noi CSDL");
			return false ;
		}
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			if(preparedStatement == null){
				System.out.println("Loi tao doi tuong preparedStatement trong ham addResourceBorrow");
				return false ;
			}
			preparedStatement.setString(1, patron.getUser_name());
			preparedStatement.setString(2, patron.getUser_password());
			preparedStatement.setString(3, patron.getEmail());
			preparedStatement.setDate(4, new java.sql.Date(patron.getBirthday().getTime()));
			preparedStatement.setString(5, patron.getAddress());
			preparedStatement.setString(6, patron.getFull_name());
			preparedStatement.setString(7, patron.getType());
			preparedStatement.executeUpdate();
			//Dong ket noi
			preparedStatement.close();
			connection.close();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Err: Message : " + e.getMessage());
			e.printStackTrace();
			return false ;
		}
		return true ;
	  }
  
  /**
   * Delete a row from patron table
   * @param userName
   * @return true if success
   */
  public boolean delete(String userName) {
	  String sql = "DELETE FROM "+PATRON_TABLE_NAME + 
		" WHERE " + PATRON_USER_NAME + " = '"+userName + "'"; 
	  return SqlExecute.executeUpdate(sql);
  }
  
  public boolean update(Patron patron){
	  java.util.Date date = patron.getBirthday();
	  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	  System.out.println("Dinh dang date trong phuong thuc update o class AbstractUserManager : " + df.format(date));
	  String sql = "UPDATE " + PATRON_TABLE_NAME + " SET " +
		PATRON_PASSWORD + "='"+patron.getUser_password()+"' , " +
		PATRON_EMAIL + "='"+patron.getEmail()+"' , "+
		PATRON_BIRTHDAY + "='"+ df.format(date) + "' ,  " +
		PATRON_ADDRESS + "='"+patron.getAddress()+"', " +
		PATRON_FULL_NAME + "='"+patron.getFull_name()+"', " +
		PATRON_TYPE + "='"+patron.getType()+"' " +
		" WHERE "+ PATRON_USER_NAME + "='"+patron.getUser_name()+"';";
	  System.out.println("SQL command : " + sql);
	  return SqlExecute.executeUpdate(sql) ;
  }
  //Check username
  public String checkUser(String userID, String password) {
		// TODO Auto-generated method stub
	  String result = null ;
	  String sql = "SELECT * FROM " + PATRON_TABLE_NAME +  
		" WHERE " + PATRON_USER_ID + " = '" + userID + "'" + 
		" AND " + PATRON_PASSWORD + "='"+password+"';";
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		try {
			if(resultSet.next()){
				result = resultSet.getString(PATRON_TYPE);
				resultSet.close();
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
  }
  //get username with userid
 // @SuppressWarnings("unused")
public String getUserName(String userID){
	  String result = null ;
	  String sql = "SELECT * FROM " + PATRON_TABLE_NAME +  
		" WHERE " + PATRON_USER_ID + " = '" + userID + "';";
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		try {
			if(resultSet.next()){
				result = resultSet.getString(PATRON_USER_NAME);
				resultSet.close();
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return result;
  }
  public String checkUserName(String userID) {
		// TODO Auto-generated method stub
	  String result = null ;
	  String sql = "SELECT * FROM " + PATRON_TABLE_NAME +  
		" WHERE " + PATRON_USER_ID + " = '" + userID + "';";
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		try {
			if(resultSet.next()){
				result = resultSet.getString(PATRON_TYPE);
				resultSet.close();
			}
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return result;
	}


  
}