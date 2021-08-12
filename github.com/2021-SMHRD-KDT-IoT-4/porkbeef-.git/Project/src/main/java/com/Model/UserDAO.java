package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {

	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int cnt = 0;
	private MemberDTO dto = null;
	private ArrayList<MemberDTO> dtos = null;

	public void UserDAO_Connetion() {

		String ip_number = "localhost";
		String port_number = "1521";
		String nick_name = "xe";
		String oracle_id = "pigManage";
		String oracle_password = "pig";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String path = "jdbc:oracle:thin:@" + ip_number + ":" + port_number + ":" + nick_name;

			conn = DriverManager.getConnection(path, oracle_id, oracle_password);

		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
			System.out.println("UserDAO에서 UserDAO_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("UserDAO에서 UserDAO_Connetion SQLException 에러");
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int userJoin(MemberDTO dto) {

		try {
			UserDAO_Connetion();

			String sql = "insert into Members values(?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getMb_id());
			psmt.setString(2, dto.getMb_pw());
			psmt.setInt(3, dto.getMb_grade());
			psmt.setString(4, dto.getNick_name());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public MemberDTO userLogin(MemberDTO login_dto) {

		try {
			UserDAO_Connetion();

			String sql = "select * from Members where mb_id = ? and mb_pw =?";

			psmt = conn.prepareStatement(sql);

			psmt.setString(1, login_dto.getMb_id());
			psmt.setString(2, login_dto.getMb_pw());
			
		
			
			rs = psmt.executeQuery();
			System.out.println(rs.getRow());
			if (rs.next()) {
				String mb_id = rs.getString("mb_id");
				String mb_pw = rs.getString("mb_pw");
				int mb_grade = Integer.parseInt(rs.getString("mb_grade"));
				String nick_name = rs.getString("nick_name");
				dto = new MemberDTO(mb_id, mb_id, mb_grade, nick_name);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public int userUpdate(MemberDTO dto) {

		try {
			UserDAO_Connetion();

			String sql = "update Members set mb_grade = ? where mb_id = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getMb_grade());
			psmt.setString(2, dto.getMb_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int userDelete(MemberDTO dto) {

		try {
			UserDAO_Connetion();

			String sql = "delete Members where mb_id = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getMb_id());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<MemberDTO> getAllMember() {
		dtos = new ArrayList<MemberDTO>();

		try {
			UserDAO_Connetion();
			String sql = "select * from members";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String mb_id = rs.getString("mb_id");
				String mb_pw = rs.getString("mb_pw");
				int mb_grade = Integer.parseInt(rs.getString("mb_grade"));
				String nick_name = rs.getString("nick_name");
				dto = new MemberDTO(mb_id, mb_pw, mb_grade, nick_name);
				dtos.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dtos;
	}
}
