package manager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.SqlExecute;

public class ResourceRequestManagetImpl implements ResourceRequestManager {
	private static String TABLE_NAME = "request";
	private static String BOOK_ISBN = "book_isbn";
	private static String PATRON_ID = "user_id";
	private static String REQUEST_DATE="borrow_date";

	@Override
	public boolean add(ResourceRequest resourceRequest) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO "+TABLE_NAME +
        "(" + BOOK_ISBN +","+ PATRON_ID + ","+REQUEST_DATE+")" 
        + "VALUES(?,?,?)";
		
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
			
			preparedStatement.setString(1, resourceRequest.getResourceID());
			preparedStatement.setString(2, resourceRequest.getPatronID());
			java.util.Date borrowDate = resourceRequest.getBorrowDate();
			preparedStatement.setDate(3, new java.sql.Date(borrowDate.getTime()));
			
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

	@Override
	public ResourceRequest get(String resourceID, String patronID) {
		// TODO Auto-generated method stub
		ResourceRequest resourceRequest = null ;
		String sql = "SELECT * FROM "+ TABLE_NAME + 
		" WHERE " + BOOK_ISBN +"= ? AND " + PATRON_ID + "= ?";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL trong ham getResourceBorrow");
			return null ;
		}
		try{
			PreparedStatement statement = connection.prepareStatement(sql);
			if(statement != null){
				statement.setString(1, resourceID);
				statement.setString(2, patronID);
				
				ResultSet resultSet = statement.executeQuery();
				if(resultSet == null){
					return null ;
				}
				if(resultSet.next()){
					resourceRequest = new ResourceRequest();
					resourceRequest.setResourceID(resourceID);
					resourceRequest.setPatronID(patronID);
					resourceRequest.setBorrowDate(resultSet.getDate(REQUEST_DATE));
					
				}
				resultSet.close();
				statement.close();
				connection.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return resourceRequest;	
	}

	@Override
	public List<ResourceRequest> getAllByPatron(String patronID) {
		// TODO Auto-generated method stub
		List<ResourceRequest> list = null ;
		String sql = "SELECT * FROM "+ TABLE_NAME + 
		" WHERE " + PATRON_ID + "= ?";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL trong ham getResourceBorrow");
			return null ;
		}
		try{
			PreparedStatement statement = connection.prepareStatement(sql);
			if(statement != null){
				
				statement.setString(1, patronID);
				
				ResultSet resultSet = statement.executeQuery();
				if(resultSet == null){
					return null ;
				}
				list = new ArrayList<ResourceRequest>();
				while(resultSet.next()){
					ResourceRequest resourceRequest = new ResourceRequest();
					resourceRequest.setResourceID(resultSet.getString(BOOK_ISBN));
					resourceRequest.setPatronID(patronID);
					resourceRequest.setBorrowDate(resultSet.getDate(REQUEST_DATE));
					
					list.add(resourceRequest);
				}
				
				resultSet.close();
				statement.close();
				connection.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ResourceRequest> getAllByResource(String resourceID) {
		// TODO Auto-generated method stub
		List<ResourceRequest> list = null ;
		String sql = "SELECT * FROM "+ TABLE_NAME + 
		" WHERE " + BOOK_ISBN + "= ?";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL trong ham getResourceBorrow");
			return null ;
		}
		try{
			PreparedStatement statement = connection.prepareStatement(sql);
			if(statement != null){
				
				statement.setString(1, resourceID);
				
				ResultSet resultSet = statement.executeQuery();
				if(resultSet == null){
					return null ;
				}
				list = new ArrayList<ResourceRequest>();
				while(resultSet.next()){
					
					ResourceRequest resourceRequest = new ResourceRequest();
					resourceRequest.setResourceID(resourceID);
					resourceRequest.setPatronID(resultSet.getString(PATRON_ID));
					resourceRequest.setBorrowDate(resultSet.getDate(REQUEST_DATE));
					list.add(resourceRequest);
				}
				resultSet.close();
				statement.close();
				connection.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ResourceRequest> gets() {
		// TODO Auto-generated method stub
		List<ResourceRequest> list = null ;
		String sql = "SELECT * FROM "+ TABLE_NAME ;
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			System.out.println("Truy van CSDL bi loi o ham gets tat ca ResourceBorrow");
			return null; 
		}
		list = new ArrayList<ResourceRequest>();
		try{
			while(resultSet.next()){
				ResourceRequest resourceRequest = new ResourceRequest();
				
				resourceRequest.setResourceID(resultSet.getString(BOOK_ISBN));
				resourceRequest.setPatronID(resultSet.getString(PATRON_ID));
				resourceRequest.setBorrowDate(resultSet.getDate(REQUEST_DATE));
				
				list.add(resourceRequest);
				
			}
			resultSet.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean remove(String resourceID, String patronID) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM "+ TABLE_NAME + 
		" WHERE " + BOOK_ISBN +"= ? AND " + PATRON_ID + "= ?";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL trong ham getResourceBorrow");
			return false ;
		}
		try{
			PreparedStatement statement = connection.prepareStatement(sql);
			if(statement != null){
				
				statement.setString(1, resourceID);
				statement.setString(2, patronID);
				
				statement.executeUpdate();
				
				statement.close();
				connection.close();
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return true ;
	}

	@Override
	public boolean update(ResourceRequest resourceRequest) {
		// TODO Auto-generated method stub
		String sql = "UPDATE "+ TABLE_NAME + 
		" SET " + REQUEST_DATE +"= ?  " + 
		" WHERE " + BOOK_ISBN +"= ? AND " + PATRON_ID + "= ?";
		Connection connection = SqlExecute.getConnection();
		if(connection == null){
			System.out.println("Loi ket noi CSDL trong ham getResourceBorrow");
			return false ;
		}
		try{
			PreparedStatement statement = connection.prepareStatement(sql);
			if(statement != null){
				statement.setDate(1, new java.sql.Date(resourceRequest.getBorrowDate().getTime()));
				statement.setString(2, resourceRequest.getResourceID());
				statement.setString(3, resourceRequest.getPatronID());
				
				statement.executeUpdate();
				
				statement.close();
				connection.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
}