package manager.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.SqlExecute;

/*
 */
public class LibStaffManager extends AbstractUserManager {
	private final String LIB_MANAGER_TABLE_NAME="lib_manager";
	//private final String PATRON_ID = "";
	private final String LIB_MANAGER_PERMISSION="permission";

	public boolean add(Patron patron) {
		// TODO Auto-generated method stub
		if(!(patron instanceof LibManager)){
			System.out.println("Ban insert khong dung kieu");
			return false ;
		}
		boolean insertOK = super.insert(patron);
		if(!insertOK){
			System.out.println("Insert vao bang Resource bi loi");
			return false ;
		}
		String sql = "INSERT INTO "+ LIB_MANAGER_TABLE_NAME +
					"(" + PATRON_USER_NAME +","+ LIB_MANAGER_PERMISSION + ")" +
					"VALUES(?,?)";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL");
			return false ;
		}
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			if(preparedStatement == null){
				System.out.println("Loi tao doi tuong preparedStatement trong ham addResourceBorrow");
				return false ;
			}
			LibManager libManager = (LibManager)patron;
			
			preparedStatement.setString(1, libManager.getUser_name());
			preparedStatement.setInt(2, libManager.getPermission());
			
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
		return true;
	}

	public List<Patron> gets() {
		// TODO Auto-generated method stub
		List<Patron> list = null ;
		String sql = "SELECT * FROM " + PATRON_TABLE_NAME + " , " + LIB_MANAGER_TABLE_NAME +
						" WHERE " + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + "="+LIB_MANAGER_TABLE_NAME+"." + PATRON_USER_NAME;
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		list = new ArrayList<Patron>();
		try{
			
			while(resultSet.next()){
				LibManager libManager = new LibManager();
				libManager.setUser_id(resultSet.getString(PATRON_USER_ID));
				libManager.setUser_name(resultSet.getString(PATRON_USER_NAME));
				libManager.setUser_password(resultSet.getString(PATRON_PASSWORD));
				libManager.setEmail(resultSet.getString(PATRON_EMAIL));
				libManager.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				libManager.setAddress(resultSet.getString(PATRON_ADDRESS));
				libManager.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				libManager.setPermission(resultSet.getInt(LIB_MANAGER_PERMISSION));
				list.add(libManager);
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	public boolean remove(String userName) {
		// TODO Auto-generated method stub
		
		String sql = "DELETE FROM "+LIB_MANAGER_TABLE_NAME + 
				" WHERE " + PATRON_USER_NAME + " = '"+userName + "'"; 
		SqlExecute.executeUpdate(sql);
		return super.delete(userName);
	}

	@Override
	public boolean update(Patron patron) {
		// TODO Auto-generated method stub
		if(!(patron instanceof LibManager)){
			System.out.println("Khong dung roi - update LibManager");
			return false ;
		}
		/*
		java.util.Date birth = patron.getBirthDay();
		java.sql.Date date = new java.sql.Date(birth.getTime());
		String sql = "UPDATE " + PATRON_TABLE_NAME + " SET " +
						PATRON_PASSWORD + "='"+patron.getPassword()+"' , " +
						PATRON_EMAIL + "='"+patron.getEmail()+"' , "+
						PATRON_BIRTHDAY + "='"+date.toString() + "' ,  " +
						PATRON_ADDRESS + "='"+patron.getAddress()+"' " +
						PATRON_FULL_NAME + "='"+patron.getFullName()+"' " +
						" wHERE "+ PATRON_USER_NAME + "='"+patron.getUser_name()+"';";
		*/
		LibManager libManager = (LibManager)patron ;
		
		String sql1 = "UPDATE " + LIB_MANAGER_TABLE_NAME + " SET " +
			LIB_MANAGER_PERMISSION + "="+libManager.getPermission()+"  " +
			" WHERE "+ PATRON_USER_NAME + "='"+libManager.getUser_name()+"';";
		System.out.println("Sql command update libStaff " + sql1);
		return super.update(patron) && SqlExecute.executeUpdate(sql1);
	}

	public Patron get(String userName) {
		// TODO Auto-generated method stub
		LibManager libManager = null ;
		
		String sql = "SELECT * FROM " + PATRON_TABLE_NAME + " , " + LIB_MANAGER_TABLE_NAME +
						" WHERE (" + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + "="+LIB_MANAGER_TABLE_NAME+"." + PATRON_USER_NAME +
						") AND (" + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + " = '"+userName+"')" ;
		
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		
		try{
			
			if(resultSet.next()){
				libManager = new LibManager();
				libManager.setUser_name(resultSet.getString(PATRON_USER_NAME));
				libManager.setUser_password(resultSet.getString(PATRON_PASSWORD));
				libManager.setEmail(resultSet.getString(PATRON_EMAIL));
				libManager.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				libManager.setAddress(resultSet.getString(PATRON_ADDRESS));
				libManager.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				libManager.setPermission(resultSet.getInt(LIB_MANAGER_PERMISSION));
				
				
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return libManager;
	}

	public List<Patron> search(String command) {
		// TODO Auto-generated method stub
		List<Patron> list = null ;
		/*
		String sql = "SELECT * FROM " + RESOURCE_TABLE_NAME + " , " + CD_TABLE_NAME +
						" WHERE (" + RESOURCE_TABLE_NAME + "." + RESOURCE_ID + "="+CD_TABLE_NAME+"." + RESOURCE_ID +
						") AND (" + RESOURCE_TABLE_NAME + "." + RESOURCE_ID + " LIKE '%"+command+"%'" +
						" OR " + RESOURCE_TABLE_NAME + "." + RESOURCE_DESCRIPTION + " LIKE '%"+command+"%'" +
						" OR " + RESOURCE_TABLE_NAME + "." + RESOURCE_NAME + " LIKE '%"+command+"%'" ;
		*/
		ResultSet resultSet = SqlExecute.executeCommand(command);
		if(resultSet == null){
			return null ;
		}
		list = new ArrayList<Patron>();
		try{
			
			while(resultSet.next()){
				LibManager libManager = new LibManager();
				
				libManager.setUser_name(resultSet.getString(PATRON_USER_NAME));
				libManager.setUser_password(resultSet.getString(PATRON_PASSWORD));
				libManager.setEmail(resultSet.getString(PATRON_EMAIL));
				libManager.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				libManager.setAddress(resultSet.getString(PATRON_ADDRESS));
				libManager.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				libManager.setPermission(resultSet.getInt(LIB_MANAGER_PERMISSION));
				
				
				list.add(libManager);
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}}