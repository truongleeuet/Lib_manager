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
public class FacultyManager extends AbstractUserManager {
	private final String FACULTY_TABLE_NAME="faculty";
	//private final String PATRON_ID="";
	private final String FACULTY_DEPARTMENT="department";
	private final String FACULTY_SUBJECTS="subjects";

	public boolean add(Patron patron) {
		// TODO Auto-generated method stub
		if(!(patron instanceof Faculty)){
			System.out.println("Ban insert khong dung kieu");
			return false ;
		}
		boolean insertOK = super.insert(patron);
		if(!insertOK){
			System.out.println("Insert vao bang Resource bi loi");
			return false ;
		}
		String sql = "INSERT INTO "+ FACULTY_TABLE_NAME +
					"(" + PATRON_USER_NAME +","+ FACULTY_DEPARTMENT +","+ FACULTY_SUBJECTS + ")" +
					"VALUES(?,?,?)";
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
			Faculty faculty = (Faculty)patron;
			
			preparedStatement.setString(1, faculty.getUser_name());
			preparedStatement.setString(2, faculty.getDepartment());
			preparedStatement.setString(3, faculty.getSubjects());
			
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
		String sql = "SELECT * FROM " + PATRON_TABLE_NAME + " , " + FACULTY_TABLE_NAME +
						" WHERE " + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + "="+FACULTY_TABLE_NAME+"." + PATRON_USER_NAME;
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		list = new ArrayList<Patron>();
		try{
			
			while(resultSet.next()){
				Faculty faculty = new Faculty();
				faculty.setUser_id(resultSet.getString(PATRON_USER_ID));
				faculty.setUser_name(resultSet.getString(PATRON_USER_NAME));
				faculty.setUser_password(resultSet.getString(PATRON_PASSWORD));
				faculty.setEmail(resultSet.getString(PATRON_EMAIL));
				faculty.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				faculty.setAddress(resultSet.getString(PATRON_ADDRESS));
				faculty.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				faculty.setDepartment(resultSet.getString(FACULTY_DEPARTMENT));
				faculty.setSubjects(resultSet.getString(FACULTY_SUBJECTS));
				
				list.add(faculty);
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}



	public boolean remove(String userName) {
		// TODO Auto-generated method stub
		
		String sql = "DELETE FROM "+FACULTY_TABLE_NAME + 
				" WHERE " + PATRON_USER_NAME + " = '"+userName + "'"; 
		SqlExecute.executeUpdate(sql);
		return super.delete(userName);
	}

	@Override
	public boolean update(Patron patron) {
		// TODO Auto-generated method stub
		if(!(patron instanceof Faculty)){
			System.out.println("Khong dung roi");
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
						" wHERE "+ PATRON_USER_NAME + "='"+patron.getUserName()+"';";
		*/
		Faculty faculty = (Faculty)patron ;
		
		String sql1 = "UPDATE " + FACULTY_TABLE_NAME + " SET " +
			FACULTY_DEPARTMENT + "='"+faculty.getDepartment()+"' , " +
			FACULTY_SUBJECTS + "='"+ faculty.getSubjects() + "'   " +
			" WHERE "+ PATRON_USER_NAME + "='"+faculty.getUser_name()+"';";
		return super.update(patron) && SqlExecute.executeUpdate(sql1);
	}

	public Patron get(String userName) {
		// TODO Auto-generated method stub
		Faculty faculty = null ;
		
		String sql = "SELECT * FROM " + PATRON_TABLE_NAME + " , " + FACULTY_TABLE_NAME +
						" WHERE (" + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + "="+FACULTY_TABLE_NAME+"." + PATRON_USER_NAME +
						") AND (" + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + " = '"+userName+"')" ;
		
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		
		try{
			
			if(resultSet.next()){
				faculty = new Faculty();
				
				faculty.setUser_name(resultSet.getString(PATRON_USER_NAME));
				faculty.setUser_password(resultSet.getString(PATRON_PASSWORD));
				faculty.setEmail(resultSet.getString(PATRON_EMAIL));
				faculty.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				faculty.setAddress(resultSet.getString(PATRON_ADDRESS));
				faculty.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				faculty.setDepartment(resultSet.getString(FACULTY_DEPARTMENT));
				faculty.setSubjects(resultSet.getString(FACULTY_SUBJECTS));
				
				
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return faculty;
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
				Faculty faculty = new Faculty();
				
				faculty.setUser_name(resultSet.getString(PATRON_USER_NAME));
				faculty.setUser_password(resultSet.getString(PATRON_PASSWORD));
				faculty.setEmail(resultSet.getString(PATRON_EMAIL));
				faculty.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				faculty.setAddress(resultSet.getString(PATRON_ADDRESS));
				faculty.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				faculty.setDepartment(resultSet.getString(FACULTY_DEPARTMENT));
				faculty.setSubjects(resultSet.getString(FACULTY_SUBJECTS));
				
				list.add(faculty);
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}}