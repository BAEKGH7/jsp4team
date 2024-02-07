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
import com.teamfour.dao.CommentDAO;
import com.teamfour.dto.CommentDTO;

@WebServlet("/recomment")
public class reComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public reComment() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("cno"));
		System.out.println(request.getParameter("comment"));
		HttpSession session = request.getSession();
		int result = 0;
		
		if (session.getAttribute("mid") != null && Util.intCheck2(request.getParameter("cno"))
				&& request.getParameter("comment") != null) {
			
			CommentDTO dto = new CommentDTO();
			dto.setMid((String) session.getAttribute("mid"));
			dto.setCno(Util.str2Int2(request.getParameter("cno")));
			dto.setComment(Util.addBR(request.getParameter("comment")));
			
			CommentDAO dao = new CommentDAO();
			result = dao.commentUpdate(dto);
		}

		// response.setContentType("application/json");
		// response.setCharacterEncoding("utf-8");

		PrintWriter pw = response.getWriter();
		pw.print(result);

	}
}
