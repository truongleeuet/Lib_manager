package manager;

import java.util.Date;

public class ResourceBorrow {

	private String patronID;

	private String resourceID;

	private Date borrowDate;

	private Date renderDate;

	private Date payDate;

	public ResourceBorrow() {
		patronID = "";
		resourceID = "";
		borrowDate = new Date();
		renderDate = new Date();
		payDate = new Date();
	}

	public String getPatronID() {
		return this.patronID;
	}

	public void setPatronID(String patronID) {
		this.patronID = patronID;
	}

	public String getResourceID() {
		return this.resourceID;
	}

	public void setResourceID(String resourceID) {
		this.resourceID = resourceID;
	}

	public Date getBorrowDate() {
		return this.borrowDate;
	}

	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}

	public Date getRenderDate() {
		return this.renderDate;
	}

	public void setRenderDate(Date renderDate) {
		this.renderDate = renderDate;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
}