package org.nimhans.NIMHANSproject.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.nimhans.NIMHANSproject.Database.DatabaseConnection;
import org.nimhans.NIMHANSproject.Doctor.Doctor;
import org.nimhans.NIMHANSproject.Encounter.Encounter;
import org.nimhans.NIMHANSproject.Patient.Patient;

public class UserDatabaseAccess {

	public User getUserByUname(String uname) {
		User u = new User();
		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM user where uname = '" + uname + "'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				u.setUid(rs.getString("uid"));
				u.setUname(rs.getString("uname"));
				u.setPassword(rs.getString("pwd"));
				u.setRole(rs.getString("role"));
				u.setSecQues(rs.getString("sec_ques"));
				u.setSecAns(rs.getString("sec_ans"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public List<User> updatePassword(User u) {
		System.out.println("out of try");
		ArrayList<User> uList = null;
		PreparedStatement pstmt=null;
		Connection con=null;
		
		try {
			DatabaseConnection dc = new DatabaseConnection();
			con = dc.getConnection();
			
			String sqlQuery = "update user set pwd=? where uname=?";
			uList = new ArrayList<User>();
			
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, u.getPassword());
			pstmt.setString(2, u.getUname());

			int i = pstmt.executeUpdate();
			
			return uList;	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - " + e.getMessage());
		} finally {

			try {
				pstmt.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				con.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		return uList;
	}	
	
	public List<User> addUser(User u) {

		List<User> ulist = new ArrayList<User>();

		try {
			DatabaseConnection db = new DatabaseConnection();
			Connection con = db.getConnection();
			String sqlQuery = "insert into user values(?,?,?,?,?,?)";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, u.getUid());
			pstmt.setString(2, u.getUname());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getRole());
			pstmt.setString(5, u.getSecQues());
			pstmt.setString(6, u.getSecAns());
			
			int i = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ulist;
	}

	
}
