package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Manual_Control_DAO {

	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int cnt = 0;
	private Manual_Control_DTO dto = null;

	public void Manual_Control_Connetion() {

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
			System.out.println("Manual_Control_DAO에서 Manual_Control_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Manual_Control_DAO에서 Manual_Control_Connetion SQLException 에러");
		}
	}

	private void close() {
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

	public Manual_Control_DTO GetManual() {

		try {
			Manual_Control_Connetion();
			String sql = "select * from Manual_Control";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			if (rs.next()) {

				int act_feed = rs.getInt("act_feed");
				int act_door = rs.getInt("act_door");
				int act_absor = rs.getInt("act_absor");
				int act_aircon = rs.getInt("act_aircon");
				int act_pump = rs.getInt("act_pump");
				int act_boil = rs.getInt("act_boil");
				int act_humid = rs.getInt("act_humid");
				int enableGrade = rs.getInt("enableGrade");

				dto = new Manual_Control_DTO(act_feed, act_door, act_absor, act_aircon, act_pump, act_boil, act_humid,
						enableGrade);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;

	}

	public int SetManual(Manual_Control_DTO dto) {

		try {
			Manual_Control_Connetion();

			String sql = "update Manual_Control set act_feed = ?," + "act_door = ?," + "act_absor = ?,"
					+ "act_aircon = ?," + "act_pump = ?," + "act_boil = ?," + "act_humid = ?," + "enableGrade = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getAct_feed());
			psmt.setInt(2, dto.getAct_door());
			psmt.setInt(3, dto.getAct_absor());
			psmt.setInt(4, dto.getAct_aircon());
			psmt.setInt(5, dto.getAct_pump());
			psmt.setInt(6, dto.getAct_boil());
			psmt.setInt(7, dto.getAct_humid());
			psmt.setInt(8, dto.getEnableGrade());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.toString());
		} finally {
			close();
		}
		return cnt;
	}
}
