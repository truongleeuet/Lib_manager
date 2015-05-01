package manager.user;

import java.util.Date;

//import manager.resource.Resource;

/**
 * class : Patron file : manager/user/Patron.java description : class Patron
 * mieu ta mot doi tuong ban doc truu tuong. Luu tru cac thong tin chung nhat
 * cua tat ca cac ban doc. author : nttuyen Date : 15/05/2008 version : 1.0
 **/
public abstract class Patron {
	public static final String STUDENT_TYPE = "PATRON_STUDENT";
	public static final String FACULTY_TYPE = "PATRON_FACULTY";
	public static final String LIB_MANAGER_TYPE = "PATRON_LIB_MANAGER";

	// Ten dang nhap cua ban doc
	// Dung khi dat sach la nhieu
	protected String user_id;

	protected String user_name;

	// password de dang nhap
	protected String user_password;

	// Email cua ban doc
	protected String email;

	// ngay sinh cua ban doc
	protected Date birthday;

	// Dia chi hien tai cua ban doc
	protected String address;

	// Ho va ten cua ban doc
	protected String full_name;

	/**
	 * Ham khoi tao cho doi tuong Patron
	 */
	public Patron() {
		this.user_id = "";
		this.user_name = "";
		this.user_password = "";
		this.address = "";
		this.email = "";
		this.birthday = new Date();
		this.full_name = "N/A";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	abstract public String getType();
}