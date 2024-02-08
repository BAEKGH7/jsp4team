package com.teamfour.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamfour.dao.CommentDAO;
import com.teamfour.dto.CommentDTO;
import com.teamfour.util.Util;

@WebServlet("/star")
public class Star extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Star() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mid") != null) {
			String starPoint = request.getParameter("starPoint");
			CommentDTO dto = new CommentDTO();
			dto.setStarpoint(Util.str2Int(starPoint));
			dto.setMid(String.valueOf(session.getAttribute("mid")));
			dto.setIsbn(request.getParameter("isbn"));
			
			CommentDAO dao = new CommentDAO();
			int result = dao.setStarPoint(dto);
			
			System.out.println("별점 입력 결과는: " + result);
		}
	}

}
