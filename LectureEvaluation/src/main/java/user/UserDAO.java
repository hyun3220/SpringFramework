package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();	// ResultSet을 이용해 DB에서 검색, 조회할때 사용
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1;	// 로그인 성공
				}
				else {
					return 0;	// 로그인 실패 (비밀번호 틀림)
				}
			}
			return -1;	// 아이디가 존재하지 않음
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -2;	// 데이터베이스 오류
	}
	
	public int Join(UserDTO user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, false)";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserEmail());
			pstmt.setString(4, user.getUserEmailHash());
			
			return pstmt.executeUpdate();	// INSERT, DELETE, UPDATE는 executeUpdate() 함수 사용
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return -1;	// 데이터베이스 오류, 회원가입 실패 발생
	}
	
	public String getUserEmail(String userID) {
		String SQL = "SELECT userEmail FROM USER WHERE userID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString(1);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return null;	// 데이터베이스 오류, 회원가입 실패 발생
	}
	
	public boolean getUserEmailChecked(String userID) {
		String SQL = "SELECT userEmailChecked FROM USER WHERE userID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getBoolean(1);
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return false;	// 데이터베이스 오류, 회원가입 실패 발생
	}
	
	public boolean setUserEmailChecked(String userID) {
		String SQL = "UPDATE USER SET userEmailChecked = true WHERE userID = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);	
			pstmt.executeUpdate();
			
			return true;	// 특정 이메일 확인 링크를 누르면 해당 사용자에 대한 이메일 인증이 됨 (이미 인증이 된 상태여도 인증 메일 발송)
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try { if(conn != null) { conn.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) { pstmt.close(); } } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) { rs.close(); } } catch (Exception e) { e.printStackTrace(); }
		}
		
		return false;	// 데이터베이스 오류, 회원가입 실패 발생
	}
}
