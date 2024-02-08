package com.teamfour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import com.teamfour.dto.MemberDTO;

public class MemberDAO extends AbstractDAO {

	public int join(MemberDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO member (mid, mname, mpw) VALUES (?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getMpw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}
	
	
	public int idCheck(MemberDTO dto) {
		int result = 1;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM member WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
				
		return result;
	}
	


	public MemberDTO login(MemberDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) count, mname, mno FROM member WHERE mid=? AND mpw=? AND mgrade > 4";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setCount(rs.getInt("count"));
				dto.setMname(rs.getString("mname"));
				dto.setMno(rs.getInt("mno"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			 System.out.println("MemberDAO 오류");
		} finally {
			close(rs, pstmt, con);
		}
		
		return dto;
	}

	public String getIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}


	public int checkAdmin(MemberDTO dto) {
		int mgrade = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mgrade FROM member WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mgrade = rs.getInt("mgrade");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return mgrade;
	}
	
}
