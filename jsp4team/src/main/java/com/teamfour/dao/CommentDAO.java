package com.teamfour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.poseidon.util.Util;
import com.teamfour.dto.CommentDTO;

public class CommentDAO extends AbstractDAO {

	public int commentWrite(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO comment (ccomment, BookID, mno, cip) "
				+ "VALUES (?, ?, (SELECT mno FROM member WHERE mid=?), ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getComment());
			pstmt.setString(2, dto.getBookId());
			pstmt.setString(3, dto.getMid());
			pstmt.setString(4, dto.getIp());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}

	public int commentDelete(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE comment SET cdel=0 "
				+ "WHERE cno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getCno());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}		
		return result;
	}

	public int commentUpdate(CommentDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE comment SET ccomment=? "
				+ "WHERE cno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getComment());
			pstmt.setInt(2, dto.getCno());
			pstmt.setString(3, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}		
		return result;
	}

	public List<CommentDTO> commentList(int no) {
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM commentview WHERE isbn=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setCno(rs.getInt("cno"));
				dto.setBookId(rs.getString("bookId"));
				dto.setComment(rs.getString("comment"));
				dto.setCdate(rs.getString("cdate"));
				dto.setMno(rs.getInt("mno"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setIp(Util.ipMasking(rs.getString("cip")));
				list.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}
}
