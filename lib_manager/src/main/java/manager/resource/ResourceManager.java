package manager.resource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sql.SqlExecute;

/*
 */
public class ResourceManager {
	protected final String BOOK_TABLE_NAME = "book";
	protected final String BOOK_ISBN = "isbn";
	protected final String BOOK_NAME = "name";
	protected final String BOOK_AUTHORS = "authors";
	protected final String BOOK_CATEGORIES = "categories";
	protected final String BOOK_AMOUNT = "amount";
	protected final String BOOK_IMAGES = "images";
	protected final String BOOK_DESCRIPTION = "description";
	protected final String BOOK_PAGES = "pages";
	protected final String BOOK_PUBLISHER = "publisher";
	protected final String BOOK_PUBLISH_YEAR = "publish_year";

	public boolean add(Resource resource) {
		String sql = "INSERT INTO " + BOOK_TABLE_NAME + "(" + BOOK_ISBN + ","
				+ BOOK_NAME + "," + BOOK_AUTHORS + "," + BOOK_CATEGORIES + ","
				+ BOOK_AMOUNT + "," + BOOK_IMAGES + "," + BOOK_DESCRIPTION
				+ "," + BOOK_PAGES + "," + BOOK_PUBLISHER + ","
				+ BOOK_PUBLISH_YEAR + ")" + " VALUES(?,?,?,?,?,?,?,?,?,?);";
		Connection connection = SqlExecute.getConnection();
		if (connection == null) {
			System.out.println("Loi ket noi CSDL");
			return false;
		}
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement(sql);
			if (preparedStatement == null) {
				System.out
						.println("Loi tao doi tuong preparedStatement trong ham addResourceBorrow");
				return false;
			}
			
			preparedStatement.setString(1, resource.getIsbn());
			preparedStatement.setString(2, resource.getName());
			preparedStatement.setString(3, resource.getAuthors());
			preparedStatement.setString(4,resource.getCategories());
			preparedStatement.setInt(5, resource.getAmount());
			preparedStatement.setString(6, resource.getImages());
			preparedStatement.setString(7, resource.getDescription());
			preparedStatement.setString(8, resource.getPages());
			preparedStatement.setString(9, resource.getPublisher());
			preparedStatement.setString(10, resource.getPublished());

			System.out.println(preparedStatement.toString());

			preparedStatement.executeUpdate();
			// Dong ket noi
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

	public boolean update(Resource resource) {
		String sql = "UPDATE " + BOOK_TABLE_NAME + " SET " + BOOK_NAME + "='"
				+ resource.getName() + "' , " + BOOK_AUTHORS + "='"
				+ resource.getAuthors() + "' , " + BOOK_CATEGORIES + "='"
				+ resource.getCategories() + "' ,  " + BOOK_AMOUNT + "="
				+ resource.getAmount() + ", " + BOOK_IMAGES + "='"
				+ resource.getImages() + "' , " + BOOK_DESCRIPTION + "='"
				+ resource.getDescription() + "' , " + BOOK_PUBLISHER + "='"
				+ resource.getPublisher() + "' , " + BOOK_PUBLISH_YEAR + "='"
				+ resource.getPublished() + "' , " + BOOK_PAGES + "='"
				+ resource.getPages() + "' " + " WHERE " + BOOK_ISBN + "='"
				+ resource.getIsbn() + "';";

		return SqlExecute.executeUpdate(sql);
	}
	public boolean check(String Isbn){
		String sql = "SELECT * FROM " + BOOK_TABLE_NAME + " WHERE " + BOOK_TABLE_NAME + "."+BOOK_ISBN +" = '" + Isbn + "'";
		return SqlExecute.executeUpdate(sql);
	}
	public boolean decreaseAmount(String isbn){
		String sql = "UPDATE " + BOOK_TABLE_NAME + " SET " + BOOK_AMOUNT + " = " + BOOK_AMOUNT + "- 1" + " WHERE " + BOOK_ISBN
				+ " = '" + isbn + "'";
		return SqlExecute.executeUpdate(sql);
	}
	public boolean creaseAmount(String isbn){
		String sql = "UPDATE " + BOOK_TABLE_NAME + " SET " + BOOK_AMOUNT + " = " + BOOK_AMOUNT + "+ 1" + " WHERE " + BOOK_ISBN
				+ " = '" + isbn + "'";
		return SqlExecute.executeUpdate(sql);
	}
	public boolean remove(String Isbn) {
		String sql = "DELETE FROM " + BOOK_TABLE_NAME + " WHERE " + BOOK_ISBN
				+ " = '" + Isbn + "'";
		return SqlExecute.executeUpdate(sql);
	}
	public List<Resource> listKindBook(String kind){
		List<Resource> list = null;
		String sql = "SELECT * FROM " + BOOK_TABLE_NAME + " WHERE "
				+ BOOK_TABLE_NAME + "." + BOOK_CATEGORIES + " LIKE '%" + kind + "%';";
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if(resultSet == null){
			return null;
		}
		list = new ArrayList<Resource>();
		try{
			while(resultSet.next()){
				Resource resource = new Resource();
				
				resource.setIsbn(resultSet.getString(BOOK_ISBN));
				resource.setName(resultSet.getString(BOOK_NAME));
				resource.setAuthors(resultSet.getString(BOOK_AUTHORS));
				resource.setCategories(resultSet.getString(BOOK_CATEGORIES));
				resource.setAmount(resultSet.getInt(BOOK_AMOUNT));
				resource.setImages(resultSet.getString(BOOK_IMAGES));
				resource.setDescription(resultSet.getString(BOOK_DESCRIPTION));
				resource.setPublisher(resultSet.getString(BOOK_PUBLISHER));
				resource.setPublished(resultSet.getString(BOOK_PUBLISH_YEAR));
				resource.setPages(resultSet.getString(BOOK_PAGES));
				
				list.add(resource);
			}
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		return list;
	}
	public Resource get(String Isbn) {
		Resource resource = new Resource();
		String sql = "SELECT * FROM " + BOOK_TABLE_NAME + " WHERE "
				+ BOOK_TABLE_NAME + "." + BOOK_ISBN + "='" + Isbn + "';";
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		
		if (resultSet == null) {
			return null;
		}
		
		try {

			while (resultSet.next()) {
				resource.setIsbn(Isbn);
				resource.setName(resultSet.getString(BOOK_NAME));
				resource.setAuthors(resultSet.getString(BOOK_AUTHORS));
				resource.setCategories(resultSet.getString(BOOK_CATEGORIES));
				resource.setAmount(resultSet.getInt(BOOK_AMOUNT));
				resource.setImages(resultSet.getString(BOOK_IMAGES));
				resource.setDescription(resultSet.getString(BOOK_DESCRIPTION));
				resource.setPublisher(resultSet.getString(BOOK_PUBLISHER));
				resource.setPublished(resultSet.getString(BOOK_PUBLISH_YEAR));
				resource.setPages(resultSet.getString(BOOK_PAGES));
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resource;
	}

	public List<Resource> gets() {
		List<Resource> list = null;
		String sql = "SELECT * FROM " + BOOK_TABLE_NAME;
		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if (resultSet == null) {
			return null;
		}
		list = new ArrayList<Resource>();
		try {

			while (resultSet.next()) {
				Resource resource = new Resource();

				resource.setIsbn(resultSet.getString(BOOK_ISBN));
				resource.setName(resultSet.getString(BOOK_NAME));
				resource.setAuthors(resultSet.getString(BOOK_AUTHORS));
				resource.setCategories(resultSet.getString(BOOK_CATEGORIES));
				resource.setAmount(resultSet.getInt(BOOK_AMOUNT));
				resource.setImages(resultSet.getString(BOOK_IMAGES));
				resource.setDescription(resultSet.getString(BOOK_DESCRIPTION));
				resource.setPages(resultSet.getString(BOOK_PAGES));
				resource.setPublisher(resultSet.getString(BOOK_PUBLISHER));
				resource.setPublished(resultSet.getString(BOOK_PUBLISH_YEAR));

				list.add(resource);
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Resource> search(String command) {
		List<Resource> list = null;

		String sql = "SELECT * FROM " + BOOK_TABLE_NAME + " WHERE ("
				+ BOOK_TABLE_NAME + "." + BOOK_ISBN + " LIKE '%" + command + "%'" 
				+ " OR " + BOOK_TABLE_NAME + "." + BOOK_NAME + " LIKE '%" + command + "%'"
				+ " OR " + BOOK_TABLE_NAME + "." + BOOK_AUTHORS + " LIKE '%" + command + "%'" 
				+ " OR " + BOOK_TABLE_NAME + "." + BOOK_DESCRIPTION + " LIKE '%" + command + "%'" + ")";

		ResultSet resultSet = SqlExecute.executeCommand(sql);
		if (resultSet == null) {
			return null;
		}
		list = new ArrayList<Resource>();
		try {

			while (resultSet.next()) {
				Resource resource = new Resource();
				resource.setIsbn(resultSet.getString(BOOK_ISBN));
				resource.setName(resultSet.getString(BOOK_NAME));
				resource.setAuthors(resultSet.getString(BOOK_AUTHORS));
				resource.setCategories(resultSet.getString(BOOK_CATEGORIES));
				resource.setAmount(resultSet.getInt(BOOK_AMOUNT));
				resource.setImages(resultSet.getString(BOOK_IMAGES));
				resource.setDescription(resultSet.getString(BOOK_DESCRIPTION));
				resource.setPages(resultSet.getString(BOOK_PAGES));
				resource.setPublisher(resultSet.getString(BOOK_PUBLISHER));
				resource.setPublished(resultSet.getString(BOOK_PUBLISH_YEAR));
				list.add(resource);
			}
			resultSet.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}