package com.teamfour.web;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamfour.dao.BasketDAO;
import com.teamfour.dto.CartDTO;

@WebServlet("/basketminus")
public class BasketMinus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BasketMinus() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		String isbn = request.getParameter("isbn");
		
		CartDTO dto = new CartDTO();
		dto.setMno(mno);
		dto.setIsbn(isbn);
		
		BasketDAO dao = new BasketDAO();
		int result = dao.minusquantity(dto);
		System.out.println(result);
		PrintWriter pw = response.getWriter(); pw.print(result);
		
	}

}
