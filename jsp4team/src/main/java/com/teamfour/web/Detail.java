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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.detail(request.getParameter("isbn"));
		
		request.setAttribute("isbn", request.getParameter("isbn"));
		request.setAttribute("book", dto);
		
		RequestDispatcher rd = request.getRequestDispatcher("./detail.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
