package manager.user;

public class LibManager extends Patron {

  private int permission;
  
  public int getPermission(){
	  return this.permission;
  }
  public void setPermission(int permission){
	  this.permission = permission;
  }

  @Override
	public String getType() {
		// TODO Auto-generated method stub
		return Patron.LIB_MANAGER_TYPE;
	}
}