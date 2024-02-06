package com.teamfour.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamfour.dao.BookDAO;
import com.teamfour.dto.BookDTO;
import com.teamfour.util.Util;

@WebServlet("/newBooks")
public class NewBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NewBooks() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		if(request.getParameter("page") != null && !request.getParameter("page").isBlank()) {
			page = Util.str2Int(request.getParameter("page"));
		}
		
		BookDAO dao = new BookDAO();
		List<BookDTO> list = dao.newBookList(page);
		int totalBooks = dao.totalBooks("book");
		
		request.setAttribute("newBookList", list);
		request.setAttribute("totalBooks", totalBooks);
		request.setAttribute("page", page);
		
		request.getRequestDispatcher("newbooks.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
