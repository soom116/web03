package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.common.JDBCConnection;
import com.shop.common.MemberVO;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt =null;
	private ResultSet rs = null;
	String sql = "";
	int cnt = 0;
	public ArrayList<MemberVO> getMemberList() {
		ArrayList<MemberVO> list = null;
		try {
			conn = JDBCConnection.getConnection();
			sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<MemberVO>();
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setCid(rs.getString("cid"));
				vo.setUpw(rs.getString("upw"));
				vo.setUname(rs.getString("uname"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setBirth(rs.getDate("birth"));
				vo.setRegdate(rs.getDate("regdate"));
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
	
	public MemberVO getMember(String cid) {
		MemberVO member = new MemberVO();
		try {
			conn = JDBCConnection.getConnection();
			sql = "select * from member where cid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setCid(rs.getString("cid"));
				member.setUpw(rs.getString("upw"));
				member.setUname(rs.getString("uname"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				member.setBirth(rs.getDate("birth"));
				member.setRegdate(rs.getDate("regdate"));
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
		return member;
	}
	
	public int editMember(MemberVO vo) {
		try {
			conn = JDBCConnection.getConnection();
			sql = "update member set upw=?, uname=?, tel=?, email=?, birth=? where cid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUpw());
			pstmt.setString(2, vo.getUname());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getBirth());
			pstmt.setString(6, vo.getCid());
			cnt = pstmt.executeUpdate();
			
			/* if(cnt == 0) {
				response.sendRedirect("GetCustomerCtrl?cid="+cid);
			} else {
				response.sendRedirect("GetCustomerListCtrl");
			} */
			
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
	
	public int delMember(MemberVO vo) {
		try {
			conn = JDBCConnection.getConnection();
			sql = "delete from member where cid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCid());
			cnt = pstmt.executeUpdate();
			
			/*
			  if(cnt == 0) {
				response.sendRedirect("GetCustomerCtrl?cid="+cid);
			} else {
				response.sendRedirect("GetCustomerListCtrl");
			}
			 */
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