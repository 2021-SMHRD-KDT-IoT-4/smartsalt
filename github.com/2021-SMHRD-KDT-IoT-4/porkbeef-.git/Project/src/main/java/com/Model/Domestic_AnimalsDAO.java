package com.Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Domestic_AnimalsDAO {

	private Connection conn = null;
	private PreparedStatement psmt = null;
	private int cnt = 0;
	private ResultSet rs = null;
	private Domestic_AnimalsDTO[] info = null;

	public void Domestic_Animals_Connetion() {

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
			System.out.println("Domestic_AnimalsDAO에서 Domestic_Animals_Connetion ClassNotFoundException에러");
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("Domestic_AnimalsDAO에서 Domestic_Animals_Connetion SQLException 에러");
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

	public int update(Domestic_AnimalsDTO dto) {
		try {
			Domestic_Animals_Connetion();
			String sql = "update domestic_animals product_cnt = ?, receving_date = ?, forwarding_date = ?, fir_vaccine = ?, sec_vaccine = ?, thr_vaccine = ?, enableGrade = ? where room = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, dto.getProduct_cnt());
			psmt.setString(2, dto.getReceving_date());
			psmt.setString(3, dto.getForwarding_date());
			psmt.setString(4, dto.getFir_vaccine());
			psmt.setString(5, dto.getSec_vaccine());
			psmt.setString(6, dto.getThr_vaccine());
			psmt.setInt(7, dto.getEnableGrade());
			psmt.setInt(8, dto.getRoom());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	// 정보 받아오기 배열로 사용
	public Domestic_AnimalsDTO[] getinfo() {

		try {
			info = new Domestic_AnimalsDTO[2];
			int i = 0;

			Domestic_Animals_Connetion();

			String sql = "select * from domestic_animals";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {

				int room = rs.getInt("room");
				int product_cnt = rs.getInt("product_cnt");
				String receving_date = rs.getString("receving_date");
				String forwarding_date = rs.getString("forwarding_date");
				String fir_vaccine = rs.getString("fir_vaccine");
				String sec_vaccine = rs.getString("sec_vaccine");
				String thr_vaccine = rs.getString("thr_vaccine");
				int enableGrade = rs.getInt("enableGrade");

				info[i] = new Domestic_AnimalsDTO(room, product_cnt, receving_date, forwarding_date, fir_vaccine,
						sec_vaccine, thr_vaccine, enableGrade);
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return info;
	}
}
