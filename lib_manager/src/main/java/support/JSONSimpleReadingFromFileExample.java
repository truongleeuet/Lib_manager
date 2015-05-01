package support;



import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;

import manager.resource.Resource;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

/*
 * @Author : Arpit Mandliya
 */
public class JSONSimpleReadingFromFileExample {
	public String readUrl(String isbn) throws Exception {
		BufferedReader reader = null;
		try {
			URL url = new URL(
					"https://www.googleapis.com/books/v1/volumes?q=isbn%3A"
							+ isbn);
			InputStream is = url.openStream();
			reader = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			StringBuffer buffer = new StringBuffer();
			int read;
			char[] chars = new char[1024];
			while ((read = reader.read(chars)) != -1)
				buffer.append(chars, 0, read);

			return buffer.toString();
		} finally {
			if (reader != null)
				reader.close();
		}
	}

//	public String readFileJson(String isbn) {
//		Gson gson = new Gson();
//
//		String url = "";
//		try {
//			url = this.readUrl(isbn);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		// System.out.println(url);
//
//		return url;
//	}

	public Resource getInfo(String isbn) throws Exception {
		JSONSimpleReadingFromFileExample json = new JSONSimpleReadingFromFileExample();
		Resource resource = new Resource();
		resource.setIsbn(isbn);
		JsonObject jobject = null;
		JsonArray jsonArray = null;
		try {
			String resource1 = json.readUrl(isbn);
			//System.out.println(resource1);
			JsonElement jelement = new JsonParser().parse(resource1);
			jobject = jelement.getAsJsonObject();
			jsonArray = null;
		} catch (JsonSyntaxException e5) {
			// TODO Auto-generated catch block
			e5.printStackTrace();
		}
		try {
			jsonArray = (JsonArray) jobject.get("items");
		} catch (Exception e4) {
			// TODO Auto-generated catch block
			e4.printStackTrace();
		}
		for (int i = 0; i < jsonArray.size(); i++) {
			JsonObject jobId = (JsonObject) jsonArray.get(i);
			// get volumeinfo
			JsonObject volumeInfo = null;
			try {
				volumeInfo = (JsonObject) jobId.get("volumeInfo");
				String title = volumeInfo.get("title").toString().replace("\"", "");
				resource.setName(title);
			} catch (Exception e4) {
				// TODO Auto-generated catch block
				e4.printStackTrace();
			}
			// System.out.println("Title: "+
			// volumeInfo.get("title").toString().replace("\"", ""));
			// get authors
			try {
				JsonArray listauthors = (JsonArray) volumeInfo.get("authors");
				String authors = "";
				for (int j = 0; j < listauthors.size(); j++) {
					String strauthors = listauthors.get(j).toString()
							.replace("\"", "");
					authors = authors + strauthors + ",";
				}
				authors = authors.length() > 0 ? authors.substring(0,
						authors.length() - 1) : authors;
				resource.setAuthors(authors);
				// System.out.println(authors);
			} catch (Exception e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}

			// get publisher
			try {
				String publisher = volumeInfo.get("publisher").toString()
						.replace("\\\"", "");
				resource.setPublisher(publisher);
			} catch (Exception e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			// System.out.println("Publisher: " + publisher);

			try {
				String published = volumeInfo.get("publishedDate").toString()
						.replace("\"", "");
				resource.setPublished(published);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// System.out.println("Publish Date: " + published);

			// get Description
			try {
				String description = volumeInfo.get("description").toString()
						.replace("\"", "");
				System.out.println("Description: " + description);
				resource.setDescription(description);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println("Description: " + description);

			// get Page Count
			try {
				String pages = volumeInfo.get("pageCount").toString()
						.replace("\"", "");
				resource.setPages(pages);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println("Page Count: " + pages);

			// get Categories
			try {
				JsonArray listcategories = (JsonArray) volumeInfo
						.get("categories");
				String categories = "";
				for (int k = 0; k < listcategories.size() - 1; k++) {
					categories = listcategories.get(k).toString()
							.replace("\"", "");
					categories = categories + ",";
				}
				categories = listcategories.get(listcategories.size() - 1)
						.toString().replace("\"", "");
				resource.setCategories(categories);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println("Categories: " + categories);

			// get ImageLink
			// System.out.println("Small Thumbnail: "+
			// imageLinks.get("smallThumbnail").toString());
			try {
				
				JsonObject imageLinks = (JsonObject) volumeInfo
						.get("imageLinks");

				String thumbnail = imageLinks.get("thumbnail").toString()
						.replace("\"", "");
				resource.setImages(thumbnail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println("Thumbnail: " + thumbnail);

		}
		return resource;
	}
	public static void main(String[] args) throws Exception{
		JSONSimpleReadingFromFileExample json = new JSONSimpleReadingFromFileExample();
		String isbn = "6048010591";
		json.getInfo(isbn);
	}
}
