package com.teamfour.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.teamfour.dao.BasketDAO;
import com.teamfour.dto.CartDTO;

@WebServlet("/basket")
public class Basket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Basket() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		List<CartDTO> list = null;
		List<CartDTO> list2 = null;
		if(session.getAttribute("mid") == null|| session.getAttribute("mname") == null) {
			 response.sendRedirect("./login");
		}else{
			BasketDAO dao = new BasketDAO();
			CartDTO dto = new CartDTO();
			int mno=(int) session.getAttribute("mno");
			dto.setMno(mno);
			list=dao.cartList(mno);
			/*
			 * int choice=(int) request.getAttribute("choice"); list2=dao.priceList(mno,
			 * choice );
			 */
			request.setAttribute("list", list);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("basket.jsp");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("mid"));
		System.out.println(request.getParameter("isbn"));
	//	String mid = request.getParameter("mid");
	//	String isbn = request.getParameter("isbn");
		
	//	CartDTO dto = 
	}

}
