package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.Domestic_AnimalsDAO;
import com.Model.Domestic_AnimalsDTO;

public class GetDomesticAnimals implements Command {
	@Override
	public void command(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		Domestic_AnimalsDAO dao = new Domestic_AnimalsDAO();
		Domestic_AnimalsDTO[] dto = dao.getinfo();

		/* Domestic_AnimalsDTO[] domestic_animalsDTO[] = dto.get(dto.length); */

		if (dto.length > 1) {
			HttpSession session = request.getSession();
			session.setAttribute("animalDB", dto);

			System.out.println("가축 정보 조회 성공");
		} else {
			System.out.println("조회 실패");
		}
		response.sendRedirect("domesticAnimals.jsp");

	}
}
