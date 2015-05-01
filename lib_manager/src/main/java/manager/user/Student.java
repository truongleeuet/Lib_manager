package manager.user;

/**
 * 
 **/
public class Student extends Patron {

	private String studentID;

	private String studentName;

	private String classroom;

	private String department;

	public Student() {
		super();
		this.studentID = "";
		this.studentName = "";
		this.classroom = "";
		this.department = "";
	}

	public String getStudentID() {
		return this.studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getClassrom() {
		return this.classroom;
	}

	public void setClassrom(String classroom) {
		this.classroom = classroom;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String getType() {
		// TODO Auto-generated method stub
		return Patron.STUDENT_TYPE;
	}
}