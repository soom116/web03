package com.shop.controller.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.BasketVO;
import com.shop.model.BasketDAO;

@WebServlet("/AddBasketCtrl")
public class AddBasketCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddBasketCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getGoods.jsp에서 보내온 userid, gno, gcolor, amount, gsize 를 getParameter로 가져와 해당 변수에 저장
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int gno = Integer.parseInt(request.getParameter("gno"));
		String gsize = request.getParameter("gsize");
		HttpSession session = request.getSession();
		String cid = (String) session.getAttribute("sid");
		int gamount = 1;
		
		//BasketVO의 객체 vo를 생성하여 userid, gno, gcolor, amount, gsize를 vo에 저장
		BasketVO vo = new BasketVO();
		vo.setCid(cid);
		vo.setGno(gno);
		vo.setGsize(gsize);
		vo.setGamount(gamount);
		
		//BasketDAO의 객체 dao를 생성하여 addBasket()을 호출하면서 vo를 전달한 후 cnt를 결과로 받음 
		//int cnt = dao.addBasket(vo)
		BasketDAO dao = new BasketDAO();
		int cnt = dao.addBasket(vo);
		
		//이동할 주소 지정 -> response.sendRedirect("");
		if(cnt>0) {
			response.sendRedirect("GetGoodsListCtrl");
		} else response.sendRedirect("GetGoodsCtrl?gno="+gno);
		}
}