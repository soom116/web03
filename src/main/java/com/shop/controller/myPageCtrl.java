package com.shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.MemberVO;
import com.shop.model.MemberDAO;

@WebServlet("/myPageCtrl")
public class myPageCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public myPageCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("cid");
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.getMember(cid);
		if(member != null) {
			request.setAttribute("member", member);
			RequestDispatcher view = request.getRequestDispatcher("./member/myPage.jsp?cid="+cid);
			view.forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
	}
}