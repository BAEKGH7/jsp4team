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

@WebServlet("/search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Search() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		if(request.getParameter("page") != null && !request.getParameter("page").isBlank()) {
			page = Util.str2Int(request.getParameter("page"));
		}
		
		String searchItem;
		int searchTotal = 0;
		BookDAO dao = new BookDAO();
		
		if(request.getParameter("keyword") == null || request.getParameter("keyword").equals("")) {
			response.sendRedirect("./");
		} else {
			searchItem = request.getParameter("keyword");
			List<BookDTO> list = dao.searchList(searchItem, page);
			
			searchTotal = dao.searchTotal(searchItem);
			request.setAttribute("keyword", searchItem);
			request.setAttribute("searchedList", list);
			request.setAttribute("totalBooks", searchTotal);
			request.getRequestDispatcher("search.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
