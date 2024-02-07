package com.teamfour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.teamfour.dto.CartDTO;

public class BasketDAO extends AbstractDAO {
	
	public int checkCart(CartDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM cartview WHERE mno=(SELECT mno FROM member WHERE mid=?) AND isbn=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getIsbn());
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		return result;
	}

	public int addCart(CartDTO dto) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO cart (mno, isbn, quantity) VALUES ((SELECT mno FROM member WHERE mid=?), ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getIsbn());
			pstmt.setInt(3, dto.getQuantity());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		return result;
	}

	public int updateQuantity(CartDTO dto) {
		int result=0;
		Connection conn = db.getConnection();
		String sql = "UPDATE cart SET quantity=quantity+? WHERE mno=(SELECT mno FROM member WHERE mid=?) AND isbn=?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getQuantity());
			pstmt.setString(2, dto.getMid());
			pstmt.setString(3, dto.getIsbn());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		return result;
	}

	public List<CartDTO> cartList(int mno) {
		List<CartDTO> list = new ArrayList<CartDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * from cartview WHERE mno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mno);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO c = new CartDTO();
				c.setCartno(rs.getInt("cartno"));
				c.setIsbn(rs.getString("isbn"));
				c.setBookcover(rs.getString("bookcover"));
				c.setBooktitle(rs.getString("booktitle"));
				c.setBookprice(rs.getInt("bookprice"));
				c.setQuantity(rs.getInt("quantity"));
				c.setSumprice(rs.getInt("sumprice"));
				c.setCcheck(rs.getString("ccheck"));
				c.setMno(rs.getInt("mno"));
				c.setMid(rs.getString("mid"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs, pstmt, conn);
		}
		
		
		return list;
	}

	public List<CartDTO> priceList(int mno) {
		
		return null;
	}

}
