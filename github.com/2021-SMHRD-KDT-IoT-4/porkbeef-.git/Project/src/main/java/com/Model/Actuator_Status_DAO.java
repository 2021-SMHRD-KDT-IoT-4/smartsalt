package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Actuator_Status_DAO {
	private Connection conn = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int cnt = 0;
	private Actuator_Status_DTO dto = null;

	public void Actuator_Status_Connetion() {

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
			System.out.println("Actuator_Status_DAO에서 Actuator_Status_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Actuator_Status_DAO에서 Actuator_Status_Connetion SQLException 에러");
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

	public Actuator_Status_DTO GetActuatorStatus() {

		try {
			Actuator_Status_Connetion();
			String sql = "select * from actuator_status";
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

				dto = new Actuator_Status_DTO(act_feed, act_door, act_absor, act_aircon, 
						act_pump, act_boil, act_humid);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public int SetActuatorStatus(Actuator_Status_DTO dto) {

		try {
			Actuator_Status_Connetion();
			
			String sql = "update actuator_status set " + "act_feed = ?," + "act_door = ?," + "act_absor = ?,"
					+ "act_aircon = ?," + "act_pump = ?," + "act_boil = ?," + "act_humid = ?" + "where ROWNUM = 1";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getAct_feed());
			psmt.setInt(2, dto.getAct_door());
			psmt.setInt(3, dto.getAct_absor());
			psmt.setInt(4, dto.getAct_aircon());
			psmt.setInt(5, dto.getAct_pump());
			psmt.setInt(6, dto.getAct_boil());
			psmt.setInt(7, dto.getAct_humid());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
