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
public class StudentManager extends AbstractUserManager {
	private final String STUDENT_TABLE_NAME="student";
	//private final String PATRON_ID = "";
	private final String STUDENT_ID= "student_id";
	private final String STUDENT_NAME= "user_name";
	private final String STUDENT_CLASSROOM="classroom";
	private final String STUDENT_DEPARTMENT="department";

	public boolean add(Patron patron) {
		// TODO Auto-generated method stub
		if(!(patron instanceof Student)){
			System.out.println("Ban insert khong dung kieu");
			return false ;
		}
		boolean insertOK = super.insert(patron);
		if(!insertOK){
			System.out.println("Insert vao bang Resource bi loi");
			return false ;
		}
		String sql = "INSERT INTO "+ STUDENT_TABLE_NAME +
					"(" + PATRON_USER_NAME +","+ STUDENT_ID +","+ STUDENT_CLASSROOM +","+ STUDENT_DEPARTMENT + ")" +
					"VALUES(?,?,?,?)";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL - phuong thuc add Student");
			return false ;
		}
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			if(preparedStatement == null){
				System.out.println("Loi tao doi tuong preparedStatement trong ham add student");
				return false ;
			}
			Student student = (Student)patron;
			
			preparedStatement.setString(1, student.getUser_name());
			preparedStatement.setString(2, student.getStudentID());
			preparedStatement.setString(3, student.getClassrom());
			preparedStatement.setString(4, student.getDepartment());
			
			
			preparedStatement.executeUpdate();
			//Dong ket noi
			preparedStatement.close();
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Err: Message : " + e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<Patron> gets() {
		// TODO Auto-generated method stub
		List<Patron> list = null ;
		String sql = "SELECT * FROM " + PATRON_TABLE_NAME + " , " + STUDENT_TABLE_NAME +
						" WHERE " + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + "="+STUDENT_TABLE_NAME+"." + PATRON_USER_NAME;
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		list = new ArrayList<Patron>();
		try{
			
			while(resultSet.next()){
				Student student = new Student();
				student.setUser_id(resultSet.getString(PATRON_USER_ID));
				student.setUser_name(resultSet.getString(PATRON_USER_NAME));
				student.setUser_password(resultSet.getString(PATRON_PASSWORD));
				student.setEmail(resultSet.getString(PATRON_EMAIL));
				student.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				student.setAddress(resultSet.getString(PATRON_ADDRESS));
				student.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				student.setStudentID(resultSet.getString(STUDENT_ID));
				student.setStudentName(resultSet.getString(STUDENT_NAME));
				student.setClassrom(resultSet.getString(STUDENT_CLASSROOM));
				student.setDepartment(resultSet.getString(STUDENT_DEPARTMENT));
				
				list.add(student);
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	public boolean remove(String userName) {
		// TODO Auto-generated method stub
		
		String sql = "DELETE FROM "+STUDENT_TABLE_NAME + 
				" WHERE " + PATRON_USER_NAME + " = '"+userName + "'"; 
		SqlExecute.executeUpdate(sql);
		return super.delete(userName);
		
	}

	@Override
	public boolean update(Patron patron) {
		// TODO Auto-generated method stub
		if(!(patron instanceof Student)){
			System.out.println("Khong dung roi - add Student");
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
		Student student = (Student)patron;
		
		String sql1 = "UPDATE " + STUDENT_TABLE_NAME + " SET " +
			STUDENT_ID + "='"+student.getStudentID()+"' , " +
			STUDENT_CLASSROOM + "='"+ student.getClassrom() + "' ,  " +
			STUDENT_DEPARTMENT + "='"+student.getDepartment()+"' " +
			" WHERE "+ PATRON_USER_NAME + "='"+student.getUser_name()+"';";
		return  super.update(patron) && SqlExecute.executeUpdate(sql1);
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
				Student student = new Student();
				
				student.setUser_name(resultSet.getString(PATRON_USER_NAME));
				student.setUser_password(resultSet.getString(PATRON_PASSWORD));
				student.setEmail(resultSet.getString(PATRON_EMAIL));
				student.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				student.setAddress(resultSet.getString(PATRON_ADDRESS));
				student.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				student.setStudentID(resultSet.getString(STUDENT_ID));
				student.setClassrom(resultSet.getString(STUDENT_CLASSROOM));
				student.setDepartment(resultSet.getString(STUDENT_DEPARTMENT));
				list.add(student);
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	public Patron get(String userName) {
		// TODO Auto-generated method stub
		Student student = null ;
		
		String sql = "SELECT * FROM " + PATRON_TABLE_NAME + " , " + STUDENT_TABLE_NAME +
						" WHERE (" + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + "="+STUDENT_TABLE_NAME+"." + PATRON_USER_NAME +
						") AND (" + PATRON_TABLE_NAME + "." + PATRON_USER_NAME + " = '"+userName+"')" ;
		
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null ;
		}
		
		try{
			
			if(resultSet.next()){
				student = new Student();
				
				student.setUser_name(resultSet.getString(PATRON_USER_NAME));
				student.setUser_password(resultSet.getString(PATRON_PASSWORD));
				student.setEmail(resultSet.getString(PATRON_EMAIL));
				student.setBirthday(resultSet.getDate(PATRON_BIRTHDAY));
				student.setAddress(resultSet.getString(PATRON_ADDRESS));
				student.setFull_name(resultSet.getString(PATRON_FULL_NAME));
				
				student.setStudentID(resultSet.getString(STUDENT_ID));
				student.setClassrom(resultSet.getString(STUDENT_CLASSROOM));
				student.setDepartment(resultSet.getString(STUDENT_DEPARTMENT));
				
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return student;
	}
}