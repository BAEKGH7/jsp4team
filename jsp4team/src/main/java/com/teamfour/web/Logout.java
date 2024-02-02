package com.teamfour.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get으로 들어왔어요");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mname") != null) {
			System.out.println("세션 유효시간 : " + session.getMaxInactiveInterval()); //1800 : 30분
			System.out.println("mname : " + session.getAttribute("mname"));
			session.removeAttribute("mname"); //mname 세션만 삭제
		}
		if(session.getAttribute("mid") != null) {
			System.out.println("mid : " + session.getAttribute("mid"));
			session.removeAttribute("mid");//mid 세션만 삭제
		}
		session.invalidate(); //해당 브라우저와 관계된 모든 세션 삭제
		System.out.println("로그아웃 완료~");
		//login페이지로 보내기
		//response.sendRedirect("./logout.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post로 들어왔어요");
	}

}
