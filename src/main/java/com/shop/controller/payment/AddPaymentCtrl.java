package com.shop.controller.payment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.PaymentVO;

@WebServlet("/AddPaymentCtrl")
public class AddPaymentCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddPaymentCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String cid = (String) session.getAttribute("sid");
		String paytype = request.getParameter("paytype");
		String payplace = request.getParameter("payplace");
		String payno = request.getParameter("payno");
		payno = payplace + " : " + payno;
		
		int gno = Integer.parseInt(request.getParameter("gno"));
		int gprice = Integer.parseInt(request.getParameter("gprice"));
		int gamount = Integer.parseInt(request.getParameter("gamount"));
		int money = gprice * gamount;
		
		String rname = request.getParameter("rname");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String postcode = request.getParameter("postcode");
		String memo = request.getParameter("memo");
		
		PaymentVO vo = new PaymentVO();
	}
}