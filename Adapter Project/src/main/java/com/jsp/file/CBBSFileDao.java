package com.jsp.file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CBBSFileDao {
	private Connection conn;
	
	public CBBSFileDao() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/adapter";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
			}
	}
	
	public int upload(String fileName, String fileRealName, int bbsID) {
		String sql = "insert into cbbsfile values(?, ?, ?)";
		if(fileName == null) {
			return 0;
		}
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public FileDto load(int bbsID) {
		String sql = "select filerealname from cbbsfile where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			ResultSet rs = null;
			rs = pstmt.executeQuery();
			if(rs.next()) {
				FileDto dto = new FileDto();
				String name = rs.getString(1);
				if(name.isEmpty()) {
					return null;
				} else {
				dto.setFileRealName(name);
				return dto;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
