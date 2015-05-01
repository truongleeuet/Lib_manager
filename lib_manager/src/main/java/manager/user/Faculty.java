package manager.user;

public class Faculty extends Patron {

  private String department;

  private String subjects;

  public Faculty(){
	  super();
	  this.department = "";
	  this.subjects="";
  }
  public String getDepartment(){
	  return this.department;
  }
  public void setDepartment(String department){
	  this.department = department;
  }
  public String getSubjects(){
	  return this.subjects;
  }
  public void setSubjects(String subjects){
	  this.subjects = subjects;
  }
	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return Patron.FACULTY_TYPE;
	}
}