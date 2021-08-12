package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Entire_Environment_DAO;
import com.Model.Entire_Environment_DTO;

public class GetState implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR"); // post방식 인코딩

		Entire_Environment_DAO dao = new Entire_Environment_DAO();
		ArrayList<Entire_Environment_DTO> environ_DTO_list = dao.Environment_ARead();

		if (environ_DTO_list.size() != 0) {

			Entire_Environment_DTO entire_environment_DTO = environ_DTO_list.get(environ_DTO_list.size() - 1);

			HttpSession session = request.getSession();

			if (entire_environment_DTO != null) {
				System.out.println("조회 성공");
				session.setAttribute("StateAllSelect", entire_environment_DTO);
			} else {
				session.setAttribute("StateAllSelect", null);
				System.out.println("조회 실패");
			}
		}

		response.sendRedirect("index.jsp");
	}
}