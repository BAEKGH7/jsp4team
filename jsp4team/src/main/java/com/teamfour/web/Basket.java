package com.teamfour.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamfour.dto.CartDTO;

@WebServlet("/basket")
public class Basket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Basket() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mid") == null|| session.getAttribute("mname") == null) {
			 response.sendRedirect("./login");
		}else{
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
