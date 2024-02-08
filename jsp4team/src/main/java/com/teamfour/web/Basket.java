package com.teamfour.web;

import java.io.IOException;
import java.io.PrintWriter;
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
		int totalprice=0;

		if(session.getAttribute("mid") == null|| session.getAttribute("mname") == null) {
			 response.sendRedirect("./login");
		}else{
			BasketDAO dao = new BasketDAO();
			CartDTO dto = new CartDTO();
			int mno=(int) session.getAttribute("mno");
			
			dto.setMno(mno);
			list=dao.cartList(mno);
			list2=dao.cartList2(mno);
			
			totalprice = dao.sumprice(mno);
			System.out.println("총액: "+totalprice);

			request.setAttribute("list", list);
			request.setAttribute("list2", list2);
			request.setAttribute("totalprice",totalprice);
			
			RequestDispatcher rd = request.getRequestDispatcher("basket.jsp");
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getParameter("isbn"));
		//System.out.println(request.getParameter("ccheck"));
		HttpSession session = request.getSession();
		int mno = (int) session.getAttribute("mno");
		String isbn = request.getParameter("isbn");
		String ccheck = request.getParameter("ccheck");
		
		CartDTO dto = new CartDTO();
		dto.setMno(mno);
		dto.setIsbn(isbn);
		dto.setCcheck(ccheck);
		
		BasketDAO dao = new BasketDAO();
		int totalprice=0;
		if(isbn == null || isbn == "") {
			int result = dao.allUpdateCcheck(dto);
			if(result==1) {
				totalprice = dao.sumprice(dto);
				//request.setAttribute("totalprice", totalprice);
				System.out.println("1 : "+totalprice);
				PrintWriter pw = response.getWriter(); pw.print(totalprice);				
			} else {
				System.out.println("업데이트 된 ccheck 수 : "+result);
				totalprice = dao.sumprice(dto);
				//request.setAttribute("totalprice", totalprice);
				System.out.println("2 : "+totalprice);
				PrintWriter pw = response.getWriter(); pw.print(totalprice);
			}
		} else {
			int result = dao.updateCcheck(dto);
			totalprice = dao.sumprice(dto);
			System.out.println("3 : "+totalprice);
			PrintWriter pw = response.getWriter(); pw.print(totalprice);
		}		
	}
	

}
