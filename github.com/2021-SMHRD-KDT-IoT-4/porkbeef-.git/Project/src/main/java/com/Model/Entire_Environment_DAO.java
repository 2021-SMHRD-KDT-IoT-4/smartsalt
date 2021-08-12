package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Entire_Environment_DAO {

	private Connection connetion = null;
	private PreparedStatement prepar_statement = null;
	private ResultSet result_set = null;
	private int state_Check = 0; // 성공여부 체크
	private Entire_Environment_DTO environ_DTO = null;
	private ArrayList<Entire_Environment_DTO> environ_DTO_list = null;

	public void Environment_Connetion() {

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
			System.out.println("Entire_Environment_DAO에서 Environment_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Entire_Environment_DAO에서 Environment_Connetion SQLException 에러");
		}
	}

	public ArrayList<Entire_Environment_DTO> Environment_ARead() {
	
		environ_DTO_list = new ArrayList<Entire_Environment_DTO>();

		try {

			Environment_Connetion();

			String sql = "select * from ENTIRE_ENVIRONMENT"; // where 조건 필요시 추가하기

			prepar_statement = connetion.prepareStatement(sql);

			result_set = prepar_statement.executeQuery();
			
			while (result_set.next()) {

				int seq_num = result_set.getInt(1);
				String check_time = result_set.getString(2);
				int temp = result_set.getInt(3);
				int humi = result_set.getInt(4);
				int gas = result_set.getInt(5);

				environ_DTO = new Entire_Environment_DTO(seq_num, check_time, temp, humi, gas);

				environ_DTO_list.add(environ_DTO);
			}

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Entire_Environment_DAO에서 Environment_Select SQLException에러");
		} finally {
			Environment_Close();
		}

		return environ_DTO_list;
	}

	public int Environment_AWrite(Entire_Environment_DTO environ_dto) {

		state_Check = 0;

		try {
			Environment_Connetion();

			String sql = "insert into ENTIRE_ENVIRONMENT VALUES (entire_seq_num.nextval,sysdate,?,?,?)";

			prepar_statement = connetion.prepareStatement(sql);

			prepar_statement.setInt(1, environ_dto.getTemp());
			prepar_statement.setInt(2, environ_dto.getHumi());
			prepar_statement.setInt(3, environ_dto.getGas());

			state_Check = prepar_statement.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("Entire_Environment_DAO에서 Environment_Insert 문제발생");
		} finally {
			Environment_Close();
		}

		return state_Check;
	}

	public void Environment_Close() {
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
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println("Entire_Environment_DAO에서 Environment_Close SQLException에러");
		}
	}
}
