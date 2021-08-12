package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Automatic_Control_DAO {

	private Connection connetion = null;
	private PreparedStatement prepar_statement = null;
	private ResultSet result_set = null;
	private int state_Check = 0; // 성공여부 체크

	private Automatic_Control_DTO automatic_DTO = null;

	public void Automatic_Connetion() {

		String ip_number = "localhost";
		String port_number = "1521";
		String nick_name = "xe";
		String oracle_id = "pigManage";
		String oracle_password = "pig";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String path = "jdbc:oracle:thin:@" + ip_number + ":" + port_number + ":" + nick_name;

			connetion = DriverManager.getConnection(path, oracle_id, oracle_password);

		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Connetion SQLException 에러");
		}
	}

	public int Automatic_SUpdate(Automatic_Control_DTO automatic_dto) {

		state_Check = 0;

		try {
			Automatic_Connetion();

			String sql = "update AUTOMATIC_CONTROL set feed_time = ?, absor_start = ?, absor_stop = ?, "
					+ "aircon_start = ?, aircon_stop = ?, humid_start = ?, humid_stop = ?, boil_start = ?, "
					+ "boil_stop = ?";

			prepar_statement = connetion.prepareStatement(sql);

			prepar_statement.setString(1, automatic_dto.getFeed_time());
			prepar_statement.setInt(2, automatic_dto.getAbsor_start());
			prepar_statement.setInt(3, automatic_dto.getAbsor_stop());
			prepar_statement.setInt(4, automatic_dto.getAircon_start());
			prepar_statement.setInt(5, automatic_dto.getAircon_stop());
			prepar_statement.setInt(6, automatic_dto.getHumid_start());
			prepar_statement.setInt(7, automatic_dto.getHumid_stop());
			prepar_statement.setInt(8, automatic_dto.getBoil_start());
			prepar_statement.setInt(9, automatic_dto.getBoil_stop());

			state_Check = prepar_statement.executeUpdate();

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Update SQL문제 발생");
		} finally {
			Automatic_Close();
		}
		return state_Check;
	}

	public Automatic_Control_DTO get_Automatic_SRead() {

		try {

			Automatic_Connetion();

			String sql = "select * from AUTOMATIC_CONTROL"; // where 조건 필요시 추가하기

			prepar_statement = connetion.prepareStatement(sql);

			result_set = prepar_statement.executeQuery();

			if (result_set.next()) {


				String feed_time = result_set.getString(1);
				int absor_start = result_set.getInt(2);
				int absor_stop = result_set.getInt(3);
				int aircon_start = result_set.getInt(4);
				int aircon_stop = result_set.getInt(5);
				int humid_start = result_set.getInt(6);
				int humid_stop = result_set.getInt(7);
				int boil_start = result_set.getInt(8);
				int boil_stop = result_set.getInt(9);


				automatic_DTO = new Automatic_Control_DTO(feed_time, absor_start, absor_stop, aircon_start, aircon_stop,
						humid_start, humid_stop, boil_start, boil_stop);

			}

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Select SQLException에러");
		} finally {
			Automatic_Close();
		}

		return automatic_DTO;
	}

	public void Automatic_Close() {
		try {

			if (result_set != null) {
				result_set.close();
			}

			if (prepar_statement != null) {
				prepar_statement.close();
			}

			if (connetion != null) {
				connetion.close();
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Automatic_Control_DAO에서 Automatic_Close SQLException에러");
		}
	}
}
