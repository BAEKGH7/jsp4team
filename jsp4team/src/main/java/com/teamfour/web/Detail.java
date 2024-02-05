package com.teamfour.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamfour.dao.BookDAO;
import com.teamfour.dto.BookDTO;

@WebServlet("/detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Detail() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getParameter("isbn"));
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.detailBook(request.getParameter("isbn"));
		
		request.setAttribute("isbn", request.getParameter("isbn"));
		request.setAttribute("book", dto);
		
		System.out.println(dto.getTotalpage());
		System.out.println(dto.getBooktitle());
		System.out.println(dto.getAuthor());
		System.out.println(dto.getIsbn());
		System.out.println(dto.getBookprice());
		request.setAttribute("book", dto);
		
		// 리퀘스트디스패쳐 호출하기
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("commentcontent"); // form에 있는 name
		// System.out.println(content);

		response.sendRedirect("./detail");
	}

}
