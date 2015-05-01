package manager;

import java.util.Date;

public class ResourceRequest {

  private String resourceID;

  private String patronID;

  private Date borrowDate;
  
  public ResourceRequest(){
	  this.resourceID = "";
	  this.patronID = "";
	  borrowDate = new Date();
  }
  
  public String getResourceID(){
	  return this.resourceID;
  }
  public void setResourceID(String resourceID){
	  this.resourceID = resourceID;
  }
  public String getPatronID(){
	  return this.patronID;
  }
  public void setPatronID(String patronID){
	  this.patronID = patronID;
  }
  public Date getBorrowDate(){
	  return this.borrowDate;
  }
  public void setBorrowDate(Date borrowDate){
	  this.borrowDate = borrowDate;
  }
}