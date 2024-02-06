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

import com.teamfour.dto.CommentDTO;
import com.teamfour.dao.BookDAO;
import com.teamfour.dao.CommentDAO;
import com.teamfour.dto.BookDTO;

@WebServlet("/detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Detail() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println(request.getParameter("isbn"));
		
		
		BookDAO dao = new BookDAO();
		BookDTO dto = dao.detail(request.getParameter("isbn"));
		// request.setAttribute("isbn", dto.getIsbn());
		request.setAttribute("book", dto);
		String isbn = request.getParameter("isbn");
		
		CommentDAO dao2 = new CommentDAO();
		
		List<CommentDTO> commentList = dao2.commentList(isbn); //해당 내용 뽑아내기
		
		if(commentList.size() > 0) {
			request.setAttribute("commentList", commentList);
		}
		
		//로그인했을 때 session 값 잡기
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		request.setAttribute("mid", mid);
		System.out.println(mid);
		
		// 리퀘스트디스패쳐 호출하기
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("commentcontent"); // form에 있는 name
		// System.out.println(content);

		response.sendRedirect("./detail");
	}

}
