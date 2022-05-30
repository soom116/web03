package com.shop.controller.goods;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.common.GoodsVO;
import com.shop.model.GoodsDAO;

@WebServlet("/AddGoodsCtrl")
public class AddGoodsCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddGoodsCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String saveFolder = "D:/soom/jsp2/web03/src/main/webapp/upload";
		String encType = "UTF-8";
		int maxSize = 10 * 1024 * 1024;	// 10MB
		try {
			MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType);
			
			String gtype = multi.getParameter("gtype");
			String gname = multi.getParameter("gname");
			int gprice = Integer.parseInt(multi.getParameter("gprice"));
			String gsize = multi.getParameter("gsize");	
			int gamount = Integer.parseInt(multi.getParameter("gamount"));
			String gcontent = multi.getParameter("gcontent");
			String gimg = "";
			
			if (multi.getFilesystemName("gimg") != null) {
				String name = multi.getFilesystemName("gimg");
				File f = multi.getFile(name);
				gimg = name;
			}
			
			GoodsVO vo = new GoodsVO();
			vo.setGtype(gtype);
			vo.setGname(gname);
			vo.setGprice(gprice);
			vo.setGsize(gsize);
			vo.setGamount(gamount);
			vo.setGcontent(gcontent);
			vo.setGimg(gimg);
			
			GoodsDAO dao = new GoodsDAO();
			int cnt = dao.addGoods(vo);
			if(cnt>0) {  //제품 등록 성공
				response.sendRedirect("GetGoodsListCtrl");
			} else {  //제품 등록 실패
				response.sendRedirect("./goods/addGoodsForm.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
