package com.shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.BoardVO;
import com.shop.model.BoardDAO;

@WebServlet("/DelBoardCtrl")
public class DelBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DelBoardCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardVO vo = new BoardVO();
		vo.setSeq(num);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.delBoard(vo);
		
		if(cnt>0) {  //글 삭제 성공
			response.sendRedirect("GetBoardListCtrl");
		} else {  //글 삭제 실패
			response.sendRedirect("GetBoardCtrl?num="+num);
		}	
	}
}