package com.teamfour.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poseidon.util.Util;
import com.teamfour.dao.BasketDAO;
import com.teamfour.dto.CartDTO;

@WebServlet("/addbasket")
public class AddBasket extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddBasket() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("mid"));
		System.out.println(request.getParameter("isbn"));
		System.out.println(request.getParameter("quantity"));
		
		HttpSession session = request.getSession();
		int mno = (int)session.getAttribute("mno");
		String isbn = request.getParameter("isbn");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		BasketDAO dao = new BasketDAO();
		CartDTO dto = new CartDTO();
		dto.setMno(mno);
		dto.setIsbn(isbn);
		dto.setQuantity(quantity);
		
		int result=dao.addCart(dto);
		
		
		PrintWriter pw = response.getWriter(); pw.print(result);
	}

}
