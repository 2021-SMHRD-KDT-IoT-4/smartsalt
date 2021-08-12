package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Entire_Environment_DAO;
import com.Model.Entire_Environment_DTO;

public class SetState implements Command {
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR"); // post방식 인코딩
		PrintWriter out = response.getWriter();

		int seq_num = Integer.parseInt(request.getParameter("seq_num"));
		String check_time = request.getParameter("temp");
		int temp = Integer.parseInt(request.getParameter("temp"));
		int humi = Integer.parseInt(request.getParameter("humi"));
		int gas = Integer.parseInt(request.getParameter("gas"));

		Entire_Environment_DAO dao = new Entire_Environment_DAO();
		Entire_Environment_DTO dto = new Entire_Environment_DTO(seq_num, check_time, temp, humi, gas);

		int state_Check = dao.Environment_AWrite(dto);

		if (state_Check > 0) {
			out.println("업로드성공");
		} else {

		}
	}
}
