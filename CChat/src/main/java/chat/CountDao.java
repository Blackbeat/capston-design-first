package chat;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CountDao {
	private Connection conn;
	 
	public CountDao() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/adapter";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int count(String roomID) {
		System.out.println("열기실행됨");
		PreparedStatement pstmt = null;
		String sql = "update cbbs set chatCount = chatCount +1 where bbsID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, roomID);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null) conn.close();
			}
		catch (Exception e2) {
			e2.printStackTrace();
			}
		}
		return -1;
	}
	
	public int uncount(String roomID) {
		PreparedStatement pstmt = null;
		String sql = "update cbbs set chatCount = chatCount -1 where bbsID = ?";
		System.out.println("닫기 dao 실행됨");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, roomID);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null) conn.close();
			}
		catch (Exception e2) {
			e2.printStackTrace();
			}
		}
		return -1;
	}
}
