package com.teamfour.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamfour.dao.MemberDAO;
import com.teamfour.dto.MemberDTO;
import com.teamfour.util.Util;

@WebServlet("/admin/bookform")
public class AdminPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("mid"));
		MemberDAO dao = new MemberDAO();
		if(session.getAttribute("mid") == null) {
			response.sendRedirect("../");
		} else {
			MemberDTO dto = new MemberDTO();
			dto.setMid(String.valueOf(session.getAttribute("mid")));
			if (dao.checkAdmin(dto) > 5) {
				request.getRequestDispatcher("/admin/bookform.jsp").forward(request, response);
			} else {
				response.sendRedirect("../");
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
