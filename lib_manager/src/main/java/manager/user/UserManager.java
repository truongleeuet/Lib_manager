package manager.user;

import java.util.List;

/*
 */
public interface UserManager {

	/**
	 * save a patron into DataBase
	 * @param patron
	 * @return true if complete
	 * 			failse if fail
	 */
  public boolean add(Patron patron);
  
  /**
   * Delete a patron from DataBase
   * @param userName
   * @return true if success end else
   */
  public boolean remove(String userName);

  /**
   * Update one patron into Database
   * @param patron
   * @return true if success and else
   */
  public boolean update(Patron patron);

  /**
   * load a patron from Database by userName
   * @param userName
   * @return patron has userName
   */
  public Patron get(String userName);

  
  /**
   * Check patron by userName
   * @param userName
   * @return Type_of_patron if exists userName in Database
   * 			null if do not exists
   */
  public String checkUserName(String userID);

  /**
   * Check patron by userName and password
   * @param userName
   * @param password
   * @return Type_of_patron if userName and password validate
   * 			null if failse
   */
  public String checkUser(String userName, String password);

  /**
   * Get all patron which is saved in Database
   * @return All patron which is saved in Database
   * 		null if have no patron in Database
   */
  public List<Patron> gets();

  /**
   * Search patron from Database
   * @param commad
   * @return all patron validate
   * 		null if has no patron validate
   */
  public List<Patron> search(String commad);
  
  public String getUserName(String userID);
}