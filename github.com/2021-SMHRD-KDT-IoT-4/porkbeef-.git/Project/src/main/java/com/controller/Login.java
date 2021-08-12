package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Model.Domestic_AnimalsDAO;
import com.Model.Domestic_AnimalsDTO;
import com.Model.Entire_Environment_DAO;
import com.Model.Entire_Environment_DTO;
import com.Model.MemberDTO;
import com.Model.UserDAO;

public class Login implements Command {

	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");

		UserDAO dao = new UserDAO();
		MemberDTO dto = new MemberDTO(mb_id, mb_pw);

		MemberDTO user = dao.userLogin(dto);

		if (user != null && user.getMb_grade() < 3) {

			HttpSession session = request.getSession();

			session.setAttribute("user", user);

			Entire_Environment_DAO eedao = new Entire_Environment_DAO();
			ArrayList<Entire_Environment_DTO> environ_DTO_list = eedao.Environment_ARead();

			if (environ_DTO_list.size() != 0) {

				Entire_Environment_DTO entire_environment_DTO = environ_DTO_list.get(environ_DTO_list.size() - 1);
				session = request.getSession();

				if (entire_environment_DTO != null) {
					session.setAttribute("StateAllSelect", entire_environment_DTO);
					System.out.println("조회 성공");
				} else {
					session.setAttribute("StateAllSelect", null);
					System.out.println("조회 실패");
				}
			}

			Domestic_AnimalsDAO dadao = new Domestic_AnimalsDAO();
			Domestic_AnimalsDTO[] dtos = dadao.getinfo();

			if (dtos.length > 1) {

				session = request.getSession();
				session.setAttribute("animalDB", dtos);
				System.out.println("가축 정보 조회 성공");

			} else {
				System.out.println("조회 실패");
			}
			response.sendRedirect("index.jsp");

		} else {
			response.sendRedirect("Login.jsp");
		}
	}
}
