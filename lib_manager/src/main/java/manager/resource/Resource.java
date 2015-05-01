package manager.resource;

import java.util.ArrayList;
import java.util.List;

//import manager.user.Patron;

/*
 */
public class Resource {

	private String isbn;

	private String name;

	private String description;

	private int amount;

	private String categories;

	private String authors;

	private String images;

	private String publisher;

	private String published;

	private String pages;
	
	

	public Resource() {
	}



	public Resource(String isbn, String name, String description, int amount,
			String categories, String authors, String images, String publisher,
			String published, String pages) {
		super();
		this.isbn = isbn;
		this.name = name;
		this.description = description;
		this.amount = amount;
		this.categories = categories;
		this.authors = authors;
		this.images = images;
		this.publisher = publisher;
		this.published = published;
		this.pages = pages;
	}



	public String getIsbn() {
		return isbn;
	}



	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public int getAmount() {
		return amount;
	}



	public void setAmount(int amount) {
		this.amount = amount;
	}



	public String getCategories() {
		return categories;
	}



	public void setCategories(String categories) {
		this.categories = categories;
	}



	public String getAuthors() {
		return authors;
	}



	public void setAuthors(String authors) {
		this.authors = authors;
	}



	public String getImages() {
		return images;
	}



	public void setImages(String images) {
		this.images = images;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	public String getPublished() {
		return published;
	}



	public void setPublished(String published) {
		this.published = published;
	}



	public String getPages() {
		return pages;
	}



	public void setPages(String pages) {
		this.pages = pages;
	}

	
}