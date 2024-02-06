package com.teamfour.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.teamfour.api.BookAPI;
import com.teamfour.util.Util;

@WebServlet("/new")
public class New extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public New() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		if(request.getParameter("page") != null && !request.getParameter("page").isBlank()) {
			page = Util.str2Int(request.getParameter("page"));
		}
		
		//신간리스트 api
		BookAPI bookAPI = new BookAPI();
		
		JSONArray itemsArray = bookAPI.newBookList(page, 10);
		request.setAttribute("newList", itemsArray);
		request.setAttribute("totalBooks", 100);
		request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("new.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
