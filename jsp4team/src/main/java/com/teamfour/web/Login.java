package com.teamfour.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamfour.dao.MemberDAO;
import com.teamfour.dto.MemberDTO;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		//System.out.println("세션");
		//System.out.println(session.getAttribute("mname"));
		
		String url = null;
		if(session.getAttribute("mname") != null) {
			url = "already.jsp";
		} else {
			url = "login.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("로그인 시도");
		if (request.getParameter("id") != null && request.getParameter("pw") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMid(request.getParameter("id"));
			dto.setMpw(request.getParameter("pw"));

			MemberDAO dao = new MemberDAO();
			dto = dao.login(dto);
			System.out.println("로그인 dto");
			
			//아이피 저장 - 안써먹을지 모르지만 일단 남겨둠..
			Map<String, Object> log = new HashMap<String, Object>();
			log.put("ip", dao.getIP(request));
			System.out.println("ip 담기");
			log.put("url", "./login");
			System.out.println("login url 담기");
			log.put("data", "id:"+dto.getMid()+", pw:"+dto.getMpw() + " 결과 : " + dto.getCount());
			System.out.println("id pw 담기");
			
			

			if (dto.getCount() == 1) {
				System.out.println("정상 로그인");
				// 세션만들기
				HttpSession session = request.getSession();
				session.setAttribute("mname", dto.getMname()); // mname이라는 이름으로 세션 만듦
				session.setAttribute("mid", dto.getMid()); // mid라는 이름으로 세션 만듦
				session.setAttribute("mno", dto.getMno()); 
				// 로그인 완료 시 페이지 이동 
				response.sendRedirect("./index");
			} else {
				//로그인 실패 시
				response.sendRedirect("./login?error=1");
			}

		} 

	}

}
