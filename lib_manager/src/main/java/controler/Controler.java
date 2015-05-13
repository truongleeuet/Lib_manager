package controler;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import manager.ResourceBorrow;
import manager.ResourceBorrowManager;
import manager.ResourceBorrowManagerImpl;
import manager.ResourceRequest;
import manager.ResourceRequestManager;
import manager.ResourceRequestManagetImpl;
import manager.resource.Resource;
import manager.resource.ResourceManager;
import manager.user.AbstractUserManager;
import manager.user.Faculty;
import manager.user.FacultyManager;
import manager.user.LibManager;
import manager.user.LibStaffManager;
import manager.user.Patron;
import manager.user.Student;
import manager.user.StudentManager;
import manager.user.UserManager;
import support.JSONSimpleReadingFromFileExample;

/**
 * Servlet implementation class for Servlet: Controler
 * 
 */

public class Controler extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static final long serialVersionUID = 1L;
	private String logedIn = null;
	private String roles = null;
	private String jsp = "index.jsp";
	private String action = null;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public Controler() {
		super();
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request,
	 * HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// ResourceManager resourcemanager = new ResourceManager();
		// List<Resource> listComputer =
		// resourcemanager.listKindBook("Computer");
		// HttpSession session = request.getSession();
		 response.setContentType("application/json");
		 String term = request.getParameter("term");
		 ArrayList<String> list = new ArrayList<String>();
		 ResourceManager resourcemanager = new ResourceManager();
//		List<Resource> listbook = resourcemanager.gets();
//		for(int i=0;i<listbook.size();i++){
//			list.add(listbook.get(i).getIsbn());
//		}
		list = resourcemanager.getIsbn(term);
		String searchList = new Gson().toJson(list);
        response.getWriter().write(searchList);
		// System.out.print(new Gson().toJson(listComputer));
		 //response.getWriter().write(new Gson().toJson(listComputer));
		// System.out.print(new Gson().toJson(listComputer));
		/* session.setAttribute("ListCom", listComputer); */
		doPost(request, response);

	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request,
	 * HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub

		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		// response.setContentType("text/html; charset=UTF-8");
		/*
		 * ResourceManager resourcemanager = new ResourceManager();
		 * List<Resource> listComputer =
		 * resourcemanager.listKindBook("Computer"); HttpSession session
		 * =request.getSession(); session.setAttribute("ListCom", listComputer);
		 */
//		response.setContentType("application/json");
//		 String userid = request.getParameter("userid");
//		ArrayList<String> listuser = new ArrayList<String>();
//		 AbstractUserManager usermanager = new StudentManager();
//		 listuser = usermanager.getIsbn(userid);
//
//      String searchuser = new Gson().toJson(listuser);
//      response.getWriter().write(searchuser);
		
		action = request.getParameter("action");
		PrintWriter out = response.getWriter();

		if (action == null) {
			action = "DEFAULT";
		}
		if ("DEFAULT".equals(action)) {

		} else if ("LOGIN".equals(action)) {

			this.login(request, response);

		} else if ("LOGOUT".equals(action)) {
			this.logout(request, response);

		} else if ("VIEW_RESOURCE".equals(action)) {
			viewResource(request, response);

		} else if ("ADD_BOOK".equals(action)) {
			try {
				addBook(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("SEARCH_RESOURCE".equals(action)) {
			searchResource(request, response);

		} else if ("DELETE_RESOURCE".equals(action)) {
			deleteResource(request, response);

		} else if ("UPDATE_BOOK".equals(action)) {
			updateBook(request, response);
		} else if ("ADD_PATRON".equals(action)) {
			addPatron(request, response);

		} else if ("UPDATE_PATRON".equals(action)) {
			updatePatron(request, response);

		} else if ("DELETE_PATRON".equals(action)) {
			deletePatron(request, response);

		} else if ("VIEW_PATRON".equals(action)) {
			viewPatron(request, response);

		} else if ("REQUEST".equals(action)) {
			request(request, response);
		} else if ("CHECK_OUT".equals(action)) {
			checkOut(request, response);
		} else if ("CHECK_IN".equals(action)) {
			checkIn(request, response);
		} else if ("REQUESTED".equals(action)) {
			requested(request, response);
		} else if ("DIARY_USER".equals(action)) {
			diaryUser(request, response);
		} else if ("DIARY_BOOK".equals(action)) {
			diaryBook(request, response);
		} else if ("SEARCH_ISBN".equals(action)) {
			try {
				searchIsbn(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void checkIn(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userID = request.getParameter("checkIn.userID");
		String Isbn = request.getParameter("checkIn.Isbn");
		String checkInType = request.getParameter("checkIn_type");

		ResourceManager resourceManager = new ResourceManager();

		ResourceBorrowManager resourceBorrowManager = new ResourceBorrowManagerImpl();
		ResourceBorrow resourceBorrow = resourceBorrowManager.get(Isbn, userID);
		if (resourceBorrow == null) {
			jsp = "checkIn.jsp";
			String messageErr = "Không có thông tin bạn đọc hoặc tài nguyên với thông tin như trên";
			request.setAttribute("messageErr", messageErr);
			dispatch(jsp, request, response);
		} else if ("LOAD".equals(checkInType)) {
			request.setAttribute("resourceBorrow", resourceBorrow);
			jsp = "loadCheckIn.jsp";
		} else if ("DELETE".equals(checkInType)) {
			// resourceBorrowManager.remove(resourceBorrow.getResourceID(),resourceBorrow.getPatronID());
			// DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			// ResourceBorrow resBorrow = resourceBorrowManager.get(userID,
			// Isbn);
			Calendar calendar = Calendar.getInstance();
			java.util.Date payDate = calendar.getTime();
			resourceBorrow.setPayDate(payDate);
			resourceBorrowManager.addBorrowWithPayDate(resourceBorrow);
			resourceManager.creaseAmount(Isbn);
			jsp = "index.jsp";
		}
		dispatch(jsp, request, response);
	}

	public void checkOut(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("checkOut.userID");
		String Isbn = request.getParameter("checkOut.Isbn");

		ResourceBorrowManager resourceBorrowManager = new ResourceBorrowManagerImpl();
		// ResourceRequestManager resourceRequestManager = new
		// ResourceRequestManagetImpl();

		ResourceBorrow resourceBorrow = resourceBorrowManager.get(Isbn, userID);
		// ResourceRequest resourceRequest =
		// resourceRequestManager.get(Isbn, userName);
		// System.out.println(resourceBorrow.getPatronID());
		try {
			if (resourceBorrow != null) {
				String messageErr = "Bạn đang mượn cuốn sách này";
				jsp = "checkOut.jsp";
				request.setAttribute("messageErr", messageErr);
				dispatch(jsp, request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		UserManager userManager = new StudentManager();
		ResourceManager resourceManager = new ResourceManager();
		resourceBorrowManager = new ResourceBorrowManagerImpl();

		String patronType = userManager.checkUserName(userID);
		Resource resource = resourceManager.get(Isbn);

		if ((patronType == null) || (resource == null)) {
			String messageErr = "Không có bạn đọc hoặc tài nguyên với thông tin như trên";
			request.setAttribute("messageErr", messageErr);
			jsp = "checkOut.jsp";
			dispatch(jsp, request, response);
		}

		resourceBorrow = new ResourceBorrow();
		Calendar calendar = Calendar.getInstance();

		java.util.Date borrowDate = calendar.getTime();
		resourceBorrow.setBorrowDate(borrowDate);

		// Don vi tinh va thoi gian duoc phep muon cua ban doc
		int amount = 0;
		int unitTime = -1;

		// Kiem tra xem sach co con trong thu vien hay da duoc muon roi
		resourceManager = new ResourceManager();
		// Resource resource = resourceManager.get(Isbn);
		int number = resource.getAmount();
		System.out.println(number);
		List<ResourceBorrow> list = resourceBorrowManager
				.getAllByResource(Isbn);
		if (list == null) {
			list = new ArrayList<ResourceBorrow>();
		}
		int numberBorrow = list.size();
		if (number > numberBorrow) {
			if (Patron.LIB_MANAGER_TYPE.equals(patronType)) {
				// Nhan vien thu vien duoc muon sach trong 1 nam
				unitTime = Calendar.YEAR;
				amount = 1;
			} else if (Patron.STUDENT_TYPE.equals(patronType)) {
				// Sinh vien duoc muon sach trong 4 tuan
				unitTime = Calendar.DATE;
				amount = 28;
			} else if (Patron.FACULTY_TYPE.equals(patronType)) {
				// Giang vien duoc muon sach trong 3 thang
				unitTime = Calendar.MONTH;
				amount = 3;
			}
			calendar.add(unitTime, amount);
			java.util.Date renderDate = calendar.getTime();
			resourceBorrow.setRenderDate(renderDate);
			// Set cac thuoc tinh con lai cua ResourceBorrow
			resourceBorrow.setResourceID(Isbn);
			resourceBorrow.setPatronID(userID);

			// Luu vao CSDL

			resourceBorrowManager.add(resourceBorrow);
			resourceManager.decreaseAmount(Isbn);
			jsp = "index.jsp";
			dispatch(jsp, request, response);
		} else {
			jsp = "checkOut.jsp";
			String messageErr = "Sách này hiện không còn trong thư viện";
			request.setAttribute("messageErr", messageErr);
			dispatch(jsp, request, response);
		}

	}

	public void request(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userID = request.getParameter("request.userID");
		String Isbn = request.getParameter("request.Isbn");

		// Check xem da dat sach nay hay muon sach nay chua
		ResourceBorrowManager resourceBorrowManager = new ResourceBorrowManagerImpl();
		ResourceRequestManager resourceRequestManager = new ResourceRequestManagetImpl();

		ResourceBorrow resourceBorrow = resourceBorrowManager.get(Isbn, userID);
		ResourceRequest resourceRequest = resourceRequestManager.get(Isbn,
				userID);
		if (resourceBorrow == null) {
			System.out.println("fhjkasfkasfhkjasdfh");
		}
		if (resourceRequest == null) {
			System.out.println("aaaaaaaaaaa");
		}
		if (resourceBorrow != null || resourceRequest != null) {
			String messageErr = "Bạn đã đặt hoặc mượn cuốn sách này rồi";
			jsp = "request.jsp";
			request.setAttribute("messageErr", messageErr);
			dispatch(jsp, request, response);
		} else {

			UserManager userManager = new StudentManager();
			String roles = userManager.checkUserName(userID);
			if (roles == null) {
				jsp = "login.jsp";
				dispatch(jsp, request, response);
			}
			ResourceManager resourceManager = new ResourceManager();

			String date = request.getParameter("request.date");
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date borrowDate;
			try {
				borrowDate = df.parse(date);
			} catch (Exception e) {
				borrowDate = new java.util.Date();
			}

			Resource resource = null;
			Calendar dateBorrow = Calendar.getInstance();
			dateBorrow.setTime(borrowDate);
			dateBorrow.add(Calendar.HOUR_OF_DAY, 23);
			dateBorrow.add(Calendar.MINUTE, 59);
			dateBorrow.add(Calendar.SECOND, 59);
			resourceManager = new ResourceManager();
			Calendar currentcalendar = Calendar.getInstance();
			java.util.Date datetest = dateBorrow.getTime();
			boolean test = dateBorrow.before(currentcalendar);
			System.out.println("jfskdjflas" + test);
			// System.out.println(borrowDate);
			// System.out.println(datetest);
			// System.out.println(dateBorrow);
			// System.out.println(currentcalendar);
			if (test) {
				String messageErr = "Ngày mượn không đúng";
				jsp = "request.jsp";
				request.setAttribute("messageErr", messageErr);
				dispatch(jsp, request, response);
			} else {

				resourceBorrowManager = new ResourceBorrowManagerImpl();
				resource = resourceManager.get(Isbn);
				int resourceAmount = resource.getAmount();
				// int resourceBorrowed =
				// resourceBorrowManager.getAllByResource(Isbn).size();

				if (resourceAmount > 0) {
					String messageErr = "Tài nguyên này còn trong thư viện bạn có thể mượn";
					jsp = "request.jsp";
					request.setAttribute("messageErr", messageErr);
					resourceRequestManager = new ResourceRequestManagetImpl();
					resourceRequest = new ResourceRequest();
					resourceRequest.setResourceID(Isbn);
					resourceRequest.setPatronID(userID);
					resourceRequest.setBorrowDate(borrowDate);
					resourceRequestManager.add(resourceRequest);
					resourceManager.decreaseAmount(Isbn);
					dispatch(jsp, request, response);
				} else {
					// resourceRequestManager = new
					// ResourceRequestManagetImpl();
					// resourceRequest = new ResourceRequest();
					// resourceRequest.setResourceID(Isbn);
					// resourceRequest.setPatronID(userID);
					// resourceRequest.setBorrowDate(borrowDate);
					// resourceRequestManager.add(resourceRequest);
					// resourceManager.decreaseAmount(Isbn);
					String messageErr = "Tài nguyên này đã hết";
					jsp = "request.jsp";
					request.setAttribute("messageErr", messageErr);
					// jsp = "index.jsp";
					dispatch(jsp, request, response);
				}
			}
		}
	}

	public void viewResource(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String Isbn = request.getParameter("isbn");
		HttpSession session = request.getSession();
		String roles = (String) session.getAttribute("patron.roles");
		ResourceManager resourceManager = new ResourceManager();

		Resource resource = null;
		jsp = "viewBook.jsp";
		resourceManager = new ResourceManager();
		resource = resourceManager.get(Isbn);
		// if (Patron.LIB_MANAGER_TYPE.equals(roles)) {
		// jsp = "editBook.jsp";
		// }
		request.setAttribute("book_edit", resource);

		dispatch(jsp, request, response);
	}

	public void searchResource(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String searchKey = request.getParameter("searchKey");
		// String searchType = request.getParameter("search.type");
		ResourceManager resourceManager = null;

		resourceManager = new ResourceManager();
		List<Resource> list = resourceManager.search(searchKey);
		HttpSession session = request.getSession();
		session.setAttribute("search_result", list);
		jsp = "body.jsp";
		dispatch(jsp, request, response);
	}

	public void deleteResource(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String Isbn = request.getParameter("delete.resourceID");
		ResourceManager resourceManager = new ResourceManager();

		resourceManager = new ResourceManager();

		resourceManager.remove(Isbn);
		jsp = "index.jsp";
		dispatch(jsp, request, response);
	}

	public void addBook(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		String isbn = request.getParameter("book.isbn");
		// JSONSimpleReadingFromFileExample json = new
		// JSONSimpleReadingFromFileExample();
		// Resource resources = (Resource) session.getAttribute("bookinfo");
		String name = request.getParameter("book.name");
		String categories = request.getParameter("book.domain");
		String authors = request.getParameter("book.authors");
		String publisher = request.getParameter("book.publisher");
		String publishYear = request.getParameter("book.publishYear");
		String pages = request.getParameter("book.pages");
		String images = request.getParameter("book.images");

		int amount = 0;
		try {
			amount = Integer.parseInt(request.getParameter("book.amount"));
		} catch (Exception e) {
			amount = 0;
		}

		String description = request.getParameter("book.description");
		System.out.println(description);
		ResourceManager resourceManager = new ResourceManager();
		Resource book = new Resource();
		book.setIsbn(isbn);
		book.setName(name);
		book.setCategories(categories);
		book.setAuthors(authors);
		book.setPublisher(publisher);
		book.setPublished(publishYear);
		book.setAmount(amount);
		book.setDescription(description);
		book.setImages(images);
		book.setPages(pages);
		resourceManager.add(book);

		jsp = "index.jsp";
		dispatch(jsp, request, response);
	}

	public void updateBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("book.id");
		String name = request.getParameter("book.name");
		String categories = request.getParameter("book.domain");
		String authors = request.getParameter("book.authors");
		String publisher = request.getParameter("book.publisher");
		String publishYear = request.getParameter("book.publishYear");
		// int publishYear = 0;
		// try {
		// publishYear = Integer.parseInt(request
		// .getParameter("book.publishYear"));
		// } catch (Exception e) {
		// publishYear = 0;
		// }
		int amount = 0;
		try {
			amount = Integer.parseInt(request.getParameter("book.amount"));
		} catch (Exception e) {
			amount = 0;
		}

		String description = request.getParameter("book.description");

		ResourceManager resourceManager = new ResourceManager();
		Resource book = new Resource();
		book.setIsbn(id);
		book.setName(name);
		book.setCategories(categories);
		book.setAuthors(authors);
		book.setPublisher(publisher);
		book.setPublished(publishYear);
		book.setAmount(amount);
		book.setDescription(description);
		resourceManager.update(book);

		jsp = "index.jsp";
		dispatch(jsp, request, response);

	}

	public void viewPatron(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Patron patron = null;
		String userName = request.getParameter("update.userName");
		UserManager userManager = new StudentManager();
		String type = userManager.checkUserName(userName);
		if (type == null) {
			request.setAttribute("messageErr",
					"Tên đăng nhập này không tồn tại");
			jsp = "updatePatron.jsp";
			dispatch(jsp, request, response);
		}
		if (Patron.LIB_MANAGER_TYPE.equals(type)) {
			userManager = new LibStaffManager();
		} else if (Patron.FACULTY_TYPE.equals(type)) {
			userManager = new FacultyManager();
		} else if (Patron.STUDENT_TYPE.equals(type)) {
			userManager = new StudentManager();
		}
		patron = userManager.get(userName);
		request.setAttribute("patron_edit", patron);
		jsp = "editPatron.jsp";
		dispatch(jsp, request, response);
	}

	public void deletePatron(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("delete.userName");
		UserManager userManager = new StudentManager();
		String type = userManager.checkUserName(userName);
		if (type == null) {
			request.setAttribute("messageErr",
					"Tên đăng nhập này không tồn tại");
			jsp = "deletePatron.jsp";
			dispatch(jsp, request, response);
		}
		if (Patron.LIB_MANAGER_TYPE.equals(type)) {
			userManager = new LibStaffManager();
		} else if (Patron.FACULTY_TYPE.equals(type)) {
			userManager = new FacultyManager();
		} else if (Patron.STUDENT_TYPE.equals(type)) {
			userManager = new StudentManager();
		}
		userManager.remove(userName);
		jsp = "index.jsp";
		dispatch(jsp, request, response);
	}

	public void updatePatron(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		UserManager userManager = new StudentManager();
		String userName = request.getParameter("patron.userName");
		System.out.println(userName);
		String password = request.getParameter("patron.password");
		String fullName = request.getParameter("patron.fullName");

		String birthday = request.getParameter("patron.birthday");
		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		java.util.Date date = null;
		try {
			date = df.parse(birthday);
		} catch (Exception e) {
			date = new java.util.Date();
		}

		String email = request.getParameter("patron.email");
		String address = request.getParameter("patron.address");

		String roles = userManager.checkUserName(userName);
		System.out.println(roles);
		if (roles == null) {
			jsp = "index.jsp";
			dispatch(jsp, request, response);
		}
		// String roles = request.getParameter("patron.roles");

		String studentID = request.getParameter("student.id");
		String studentClassroom = request.getParameter("student.classrom");
		String studentDepartment = request.getParameter("student.department");

		String facultyDepartment = request.getParameter("faculty.department");
		String facultySubject = request.getParameter("faculty.subjects");
		int permission = 0;
		try {
			permission = Integer.parseInt(request
					.getParameter("libManager.permission"));
		} catch (Exception e) {
			permission = 1;
		}

		if (Patron.LIB_MANAGER_TYPE.equals(roles)) {
			LibManager libManager = new LibManager();
			libManager.setUser_name(userName);
			libManager.setUser_password(password);
			libManager.setFull_name(fullName);
			libManager.setBirthday(date);
			libManager.setEmail(email);
			libManager.setAddress(address);
			libManager.setPermission(permission);
			userManager = new LibStaffManager();
			userManager.update(libManager);
			request.setAttribute("patron_edit", libManager);
		} else if (Patron.FACULTY_TYPE.equals(roles)) {
			Faculty patron = new Faculty();
			patron.setUser_name(userName);
			patron.setUser_password(password);
			patron.setFull_name(fullName);
			patron.setBirthday(date);
			patron.setEmail(email);
			patron.setAddress(address);

			patron.setDepartment(facultyDepartment);
			patron.setSubjects(facultySubject);

			userManager = new FacultyManager();
			userManager.update(patron);
			request.setAttribute("patron_edit", patron);
		} else if (Patron.STUDENT_TYPE.equals(roles)) {
			Student patron = new Student();
			patron.setUser_name(userName);
			patron.setUser_password(password);
			patron.setFull_name(fullName);
			patron.setBirthday(date);
			patron.setEmail(email);
			patron.setAddress(address);

			patron.setDepartment(studentDepartment);
			patron.setClassrom(studentClassroom);
			patron.setStudentID(studentID);

			System.out.println("Patron name : " + patron.getUser_name());

			userManager = new StudentManager();
			userManager.update(patron);
			request.setAttribute("patron_edit", patron);
		}
		jsp = "index.jsp";
		dispatch(jsp, request, response);
	}

	public void addPatron(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("patron.userID");
		String userName = request.getParameter("patron.userName");
		String password = request.getParameter("patron.password");
		String fullName = request.getParameter("patron.fullName");

		String birthday = request.getParameter("patron.birthday");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		try {
			date = df.parse(birthday);
		} catch (Exception e) {
			date = new java.util.Date();
		}

		String email = request.getParameter("patron.email");
		String address = request.getParameter("patron.address");
		String roles = request.getParameter("patron.roles");

		String studentID = request.getParameter("student.id");
		String studentClassroom = request.getParameter("student.classrom");
		String studentDepartment = request.getParameter("student.department");

		String facultyDepartment = request.getParameter("faculty.department");
		String facultySubject = request.getParameter("faculty.subjects");
		int permission = 0;
		try {
			permission = Integer.parseInt(request
					.getParameter("libManager.permission"));
		} catch (Exception e) {
			permission = 1;
		}

		AbstractUserManager userManager = null;
		if (Patron.LIB_MANAGER_TYPE.equals(roles)) {
			LibManager libManager = new LibManager();
			libManager.setUser_id(userID);
			libManager.setUser_name(userName);
			libManager.setUser_password(password);
			libManager.setFull_name(fullName);
			libManager.setBirthday(date);
			libManager.setEmail(email);
			libManager.setAddress(address);
			libManager.setPermission(permission);
			userManager = new LibStaffManager();
			userManager.addPatron(libManager);
			userManager.add(libManager);
		} else if (Patron.FACULTY_TYPE.equals(roles)) {
			Faculty patron = new Faculty();
			patron.setUser_id(userID);
			patron.setUser_name(userName);
			patron.setUser_password(password);
			patron.setFull_name(fullName);
			patron.setBirthday(date);
			patron.setEmail(email);
			patron.setAddress(address);

			patron.setDepartment(facultyDepartment);
			patron.setSubjects(facultySubject);

			userManager = new FacultyManager();
			userManager.add(patron);
		} else if (Patron.STUDENT_TYPE.equals(roles)) {
			Student patron = new Student();
			// patron.getType();
			patron.setUser_id(userID);
			patron.setUser_name(userName);
			patron.setUser_password(password);
			patron.setFull_name(fullName);
			patron.setBirthday(date);
			patron.setEmail(email);
			patron.setAddress(address);

			patron.setDepartment(studentDepartment);
			patron.setClassrom(studentClassroom);
			patron.setStudentID(studentID);
			patron.setStudentName(userName);

			userManager = new StudentManager();
			// userManager.addPatron(patron);
			userManager.add(patron);
		}
		jsp = "index.jsp";
		dispatch(jsp, request, response);
	}

//	public void borrowed(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		String patronID = (String) session.getAttribute("login.done");
//		System.out.println(patronID);
//		ResourceBorrowManager resourceBorrowManager = new ResourceBorrowManagerImpl();
//		List<ResourceBorrow> list = resourceBorrowManager.getAllByPatron(patronID);
//		System.out.println(list.size());
//		if (list != null) {
//			jsp = "borrowed.jsp";
//			session.setAttribute("listborrowed", list);
//		}
//
//		dispatch(jsp, request, response);
//
//	}

	public void requested(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String patronID = (String) session.getAttribute("login.done");
		System.out.println(patronID);
		ResourceRequestManager resourceRequestManager = new ResourceRequestManagetImpl();
		List<ResourceRequest> list = resourceRequestManager.getAllByPatron(patronID);
		System.out.println(list.size());
		if (list != null) {
			jsp = "requested.jsp";
			session.setAttribute("listrequested", list);
		}

		dispatch(jsp, request, response);

	}

	public void searchIsbn(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// request.setCharacterEncoding("UTF-8");
		// response.setCharacterEncoding("UTF-8");
		// response.setContentType("text/html; charset=UTF-8");
		String isbn = request.getParameter("book.isbn");
		Resource bookresource = null;
		try {
			bookresource = new Resource();
			JSONSimpleReadingFromFileExample json = new JSONSimpleReadingFromFileExample();
			bookresource = json.getInfo(isbn);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(bookresource.getName());
		HttpSession session = request.getSession();
		if (bookresource != null) {
			jsp = "editBook.jsp";
			session.setAttribute("bookinfo", bookresource);
		}
		dispatch(jsp, request, response);
	}

	public void diaryUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String userID = request.getParameter("diaryUser.userID");
		ResourceBorrowManagerImpl resbomanager = new ResourceBorrowManagerImpl();
		List<ResourceBorrow> listborrow = resbomanager.showDiaryUser(userID);
		HttpSession session = request.getSession();
		if (listborrow != null) {
			session.setAttribute("listborrowuser", listborrow);
			jsp = "diaryuser.jsp";
		}
		dispatch(jsp, request, response);
	}

	public void diaryBook(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bookIsbn = request.getParameter("diaryBook.bookIsbn");
		ResourceBorrowManagerImpl resbomanager = new ResourceBorrowManagerImpl();
		List<ResourceBorrow> listborrow = resbomanager.showDiaryBook(bookIsbn);
		HttpSession session = request.getSession();
		if (listborrow != null) {
			session.setAttribute("listborrowbook", listborrow);
			jsp = "diarybook.jsp";
		}
		dispatch(jsp, request, response);
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = request.getParameter("login.userName");
		System.out.println(userName);

		String password = request.getParameter("login.password");
		System.out.println(password);

		UserManager userManager = new StudentManager();
		roles = userManager.checkUser(userName, password);
		System.out.println(roles);
		if (roles != null) {
			jsp = "index.jsp";
			logedIn = userName;
			session.setAttribute("login.done", logedIn);
			session.setAttribute("patron.roles", roles);
		} else {
			jsp = "login.jsp";
			request.setAttribute("messageErr",
					"Tên đăng nhập hoặc mật khẩu không đúng");
		}
		dispatch(jsp, request, response);
	}

	public void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		jsp = "index.jsp";
		// logedIn = null;
		// roles = "PATRON_LIB_MANAGER";
		// session.removeAttribute("login.done");
		// session.removeAttribute("patron.roles");
		session.invalidate();
		dispatch(jsp, request, response);
	}

	public void dispatch(String jsp, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (jsp != null) {
			RequestDispatcher rd = request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
	}

}