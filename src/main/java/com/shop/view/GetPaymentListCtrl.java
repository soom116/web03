package com.shop.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.PaymentVO;
import com.shop.model.PaymentDAO;

@WebServlet("/GetPaymentListCtrl")
public class GetPaymentListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetPaymentListCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PaymentDAO dao = new PaymentDAO();
		ArrayList<PaymentVO> list = dao.getPaymentList();
		
		request.setAttribute("list", list);;
		RequestDispatcher view = request.getRequestDispatcher("./payment/getPaymentListCtrl");;
		view.forward(request, response);
	}
}