package com.Model;

import java.io.IOException;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawling_Wether_DAO {

	public String Temp_Parser() {

		String temp_Data = null;

		try {

			String URL = "https://weather.naver.com/"; // 1. ���� ��� URL

			StringBuilder stringBuilder = null;
 
			// 2. Connection
			Connection conn = Jsoup.connect(URL);

			// 3. HTML �Ľ� conn.post();
			Document html = conn.get();

			// 4. �Ӽ� Ž��
			Elements file_blocks = html.getElementsByClass("weather_area");

			stringBuilder = new StringBuilder();

			for (Element file_block : file_blocks) {

				Elements files = file_block.getElementsByTag("strong");

				for (Element elm : files) {

					String text = elm.text();

					String text_val = text.substring(5, 8);

					temp_Data = "" + stringBuilder.append("���� �µ� : ").append(text_val);

				}
			}

		} catch (IOException e) {
//			e.printStackTrace();
			System.out.println("Croll_DAO���� Temp_Parser �����߻�");
		}

		return temp_Data;
	}

	public String Weather_Parser() {

		String weather_Data = null;

		try {

			String URL = "https://weather.naver.com/today/05155720";

			StringBuilder stringBuilder1 = null;
			StringBuilder stringBuilder2 = null;

			// 2. Connection
			Connection conn = Jsoup.connect(URL);

			// 3. HTML �Ľ� conn.post();
			Document html = conn.get();

			// 4. �Ӽ� Ž��
			Elements file_blocks = html.getElementsByClass("summary");

			stringBuilder1 = new StringBuilder();
			stringBuilder2 = new StringBuilder();

			for (Element file_block : file_blocks) {

				Elements files = file_block.getElementsByTag("p");

				for (Element elm : files) {
					Elements el = elm.getElementsByTag("span");
					String el_cut = el.get(0).text();
					String text = elm.text();

					text = text.split(el_cut)[0];
					
					stringBuilder1.append(text).append(" ");

					stringBuilder2.append("���� ").append(el_cut);

					weather_Data = "" + stringBuilder1 + "" + stringBuilder2;

					System.out.println(weather_Data); // Ȯ�ο� �ʿ������ �����

//					System.out.println(text);

//					text = text.substring(0, 11);
//					text.replace("\n","");
//					text = elm.text();
//					text = text.substring(11, 13);
				}
			}

		} catch (IOException e) {
//			e.printStackTrace();
			System.out.println("Croll_DAO���� Weather_Parser �����߻�");
		}
		return weather_Data;
	}
}