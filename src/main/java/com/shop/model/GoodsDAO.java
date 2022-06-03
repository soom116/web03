package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.common.GoodsVO;
import com.shop.common.JDBCConnection;

public class GoodsDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql = "";
	int cnt = 0;
	public ArrayList<GoodsVO> getGoodsList() {
		ArrayList<GoodsVO> list = null;
		try {
			conn = JDBCConnection.getConnection();
			sql = "select * from goods";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<GoodsVO>();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setGno(rs.getInt("gno"));
				vo.setGtype(rs.getString("gtype"));
				vo.setGname(rs.getString("gname"));
				vo.setGprice(rs.getInt("gprice"));
				vo.setGsize(rs.getString("gsize"));
				vo.setGamount(rs.getInt("gamount"));
				vo.setGcontent(rs.getString("gcontent"));
				vo.setGimg(rs.getString("gimg"));
				list.add(vo);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 요청으로 업무를 처리하지 못했습니다.");
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public GoodsVO getGoods(int gno) {
		GoodsVO goods = new GoodsVO();
		try {
			conn = JDBCConnection.getConnection();
			sql = "select * from goods where gno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				goods.setGno(rs.getInt("gno"));
				goods.setGtype(rs.getString("gtype"));
				goods.setGname(rs.getString("gname"));
				goods.setGprice(rs.getInt("gprice"));
				goods.setGsize(rs.getString("gsize"));
				goods.setGamount(rs.getInt("gamount"));
				goods.setGcontent(rs.getString("gcontent"));
				goods.setGimg(rs.getString("gimg"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 요청으로 업무를 처리하지 못했습니다.");
			e.printStackTrace();
		} finally {
			JDBCConnection.close(pstmt, conn);
		}
		return goods;
	}
	

	public int addGoods(GoodsVO vo) {
		try {
			conn = JDBCConnection.getConnection();
			sql = "insert into goods values((select nvl(max(gno), 0)+1 from goods), ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getGtype());
			pstmt.setString(2, vo.getGname());
			pstmt.setInt(3, vo.getGprice());
			pstmt.setString(4, vo.getGsize());
			pstmt.setInt(5, vo.getGamount());
			pstmt.setString(6, vo.getGcontent());
			pstmt.setString(7, vo.getGimg());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 요청으로 업무를 처리하지 못했습니다.");
			e.printStackTrace();
		} finally {
			JDBCConnection.close(pstmt, conn);
		}
		return cnt;
	}
	
	public int editGoods(GoodsVO vo) {
		try {
			conn = JDBCConnection.getConnection();
			if(vo.getGimg()!=null) {
				sql = "update goods set gtype=?, gname=?, gprice=?, gsize=?, gamount=?, gcontent=?, gimg=? where gno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getGtype());
				pstmt.setString(2, vo.getGname());
				pstmt.setInt(3, vo.getGprice());
				pstmt.setString(4, vo.getGsize());
				pstmt.setInt(5, vo.getGamount());
				pstmt.setString(6, vo.getGcontent());
				pstmt.setString(7, vo.getGimg());
				pstmt.setInt(8, vo.getGno());
				cnt = pstmt.executeUpdate();
			} else {
				sql = "update goods set gtype=?, gname=?, gprice=?, gsize=?, gamount=?, gcontent=? where gno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getGtype());
				pstmt.setString(2, vo.getGname());
				pstmt.setInt(3, vo.getGprice());
				pstmt.setString(4, vo.getGsize());
				pstmt.setInt(5, vo.getGamount());
				pstmt.setString(6, vo.getGcontent());
				pstmt.setInt(7, vo.getGno());
				cnt = pstmt.executeUpdate();
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 요청으로 업무를 처리하지 못했습니다.");
			e.printStackTrace();
		} finally {
			JDBCConnection.close(pstmt, conn);
		}
		return cnt;
	}
	
	public int delGoods(int gno) {
		try {
			conn = JDBCConnection.getConnection();
			sql = "delete from goods where gno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, gno);
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩이 실패되었습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 처리되지 못했습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 요청으로 업무를 처리하지 못했습니다.");
			e.printStackTrace();
		} finally {
			JDBCConnection.close(pstmt, conn);
		}
		return cnt;
	}
}