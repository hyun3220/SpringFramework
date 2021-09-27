package yuhan.mvc.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import yuhan.mvc.board.dto.BoardDto;

public class BoardDao {
	DataSource dataSource;
	
	public BoardDao() {
		try {
			Context context = new InitialContext();	// WAS와 Context를 연동하기 위해 선언
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BoardDto> list() {
		ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet result = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT b_no, b_name, b_subject, b_content, b_date FROM yuhan_board";
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			
			while(result.next()) {
				int b_no = result.getInt("b_no");
				String b_name = result.getString("b_name");
				String b_subject = result.getString("b_subject");
				String b_content = result.getString("b_content");
				Timestamp b_date = result.getTimestamp("b_date");
				
				BoardDto dto = new BoardDto(b_no, b_name, b_subject, b_content, b_date);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(result != null) result.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return dtos;
	}
	
}
