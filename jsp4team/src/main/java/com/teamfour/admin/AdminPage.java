package com.teamfour.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamfour.dao.BookDAO;
import com.teamfour.dao.MemberDAO;
import com.teamfour.dto.BookDTO;
import com.teamfour.dto.MemberDTO;
import com.teamfour.util.Util;

@WebServlet("/admin/bookform")
public class AdminPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//System.out.println(session.getAttribute("mid"));
		MemberDAO dao = new MemberDAO();
		if(session.getAttribute("mid") == null) {
			response.sendRedirect("../");
		} else {
			MemberDTO dto = new MemberDTO();
			dto.setMid(String.valueOf(session.getAttribute("mid")));
			if (dao.checkAdmin(dto) > 5) {
				request.getRequestDispatcher("/admin/bookform.jsp").forward(request, response);
			} else {
				response.sendRedirect("../");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") == null) {
			response.sendRedirect("../");
		} else {
			MemberDTO dto = new MemberDTO();
			MemberDAO dao = new MemberDAO();
			dto.setMid(String.valueOf(session.getAttribute("mid")));
			if (dao.checkAdmin(dto) > 5) {
				//책정보쓰기 기능. db 업데이트
				
				//getParameter로 값 받아오기
				String isbn = request.getParameter("isbn");
				String booktitle = request.getParameter("booktitle");
				String bookprice = request.getParameter("bookprice");
				String author = request.getParameter("author");
				String bookpublisher = request.getParameter("bookpublisher");
				String bookpublishdate = request.getParameter("bookpublishdate");
				String category = request.getParameter("category");
				String bookcover = request.getParameter("bookcover");
				String bookdetail = request.getParameter("bookdetail");
				String bookindex = request.getParameter("bookindex");
				String profile = request.getParameter("profile");
				
//				System.out.println(isbn);
//				System.out.println(booktitle);
//				System.out.println(bookprice);
//				System.out.println(author);
//				System.out.println(bookpublisher);
//				System.out.println(bookpublishdate);
//				System.out.println(category);
//				System.out.println(bookcover);
//				System.out.println(bookdetail);
//				System.out.println(bookindex);
//				System.out.println(profile);
				
				BookDTO dto2 = new BookDTO();
				
				dto2.setIsbn(isbn);
				dto2.setBooktitle(booktitle);
				dto2.setBookprice(Util.str2Int(bookprice));
				dto2.setAuthor(author);
				dto2.setPublisher(bookpublisher);
				dto2.setPublishdate(bookpublishdate);
				dto2.setCategory(category);
				dto2.setBookcover(bookcover);
				dto2.setBookdetail(bookdetail);
				dto2.setBookindex(bookindex);
				dto2.setProfile(profile);
				
				BookDAO dao2 = new BookDAO();
				int result = dao2.bookInfo(dto2);
				
				System.out.println("글쓰기 결과 : " + result);
				
				if (result == 1) {
					response.sendRedirect("../");
				} else {
					response.sendRedirect("./bookform");
				}
				
				
				//request.getRequestDispatcher("/admin/bookform.jsp").forward(request, response);
			}
		}
	}

}
