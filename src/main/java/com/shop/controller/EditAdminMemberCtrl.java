package com.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.MemberVO;
import com.shop.model.MemberDAO;

@WebServlet("/EditAdminMemberCtrl")
public class EditAdminMemberCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditAdminMemberCtrl() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String cid = request.getParameter("cid");
		String upw = request.getParameter("upw");
		String uname = request.getParameter("uname");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String postcode = request.getParameter("postcode");
		String birth = request.getParameter("birth");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		vo.setCid(cid);
		vo.setUpw(upw);
		vo.setUname(uname);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPostcode(postcode);
		vo.setBirth(birth);
		int cnt = dao.editMember(vo);
		if(cnt>0) {  //회원정보수정 성공
			response.sendRedirect("GetMemberListCtrl");
		} else {  //회원정보수정 실패
			response.sendRedirect("./member/myPage.jsp");
		}	
	}

}
