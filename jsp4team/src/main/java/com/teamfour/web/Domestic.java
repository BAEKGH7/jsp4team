package com.teamfour.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teamfour.dao.BookDAO;
import com.teamfour.dto.BookDTO;
import com.teamfour.util.Util;

@WebServlet("/domestic")
public class Domestic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Domestic() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page;
		if(request.getParameter("page") != null || request.getParameter("page").isBlank()) {
			page = 1;
		} else {
			page = Util.str2Int(request.getParameter("page"));
		}
		
		BookDAO dao = new BookDAO();
		List<BookDTO> list = dao.domesticList(page);
		int totalBooks = dao.totalBooks();
		
		request.setAttribute("domesticList", list);
		request.setAttribute("totalBooks", totalBooks);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("domestic.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
