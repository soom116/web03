package com.shop.controller.goods;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.GoodsVO;
import com.shop.model.GoodsDAO;

@WebServlet("/EditGoodsCtrl")
public class EditGoodsCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditGoodsCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int gno = Integer.parseInt(request.getParameter("gno"));
		String gtype = request.getParameter("gtype");
		String gname = request.getParameter("gname");
		int gprice = Integer.parseInt(request.getParameter("gprice"));
		String gsize = request.getParameter("gsize");
		String gamount = request.getParameter("gamount");
		String gcontent = request.getParameter("gcontent");
		String gimg = request.getParameter("gimg");
		
		GoodsVO vo = new GoodsVO();
		vo.setGno(gno);
		vo.setGtype(gtype);
		vo.setGname(gname);
		vo.setGprice(gprice);
		vo.setGsize(gsize);
		vo.setGamount(gprice);
		vo.setGcontent(gcontent);
		vo.setGimg(gimg);
		
		
		GoodsDAO dao = new GoodsDAO();
		int cnt = dao.editGoods(vo);
		if(cnt>0) {  //글 수정 성공
			response.sendRedirect("GetGoodsListCtrl");
		} else {  //글 수정 실패
			response.sendRedirect("GetGoodsCtrl?gno="+gno);
		}	
	}

}