package com.Front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.AutoShift;
import com.controller.Command;
import com.controller.GetActuatorStatusCon;
import com.controller.GetDomesticAnimals;
import com.controller.GetState;
import com.controller.Get_Automatic_Con;
import com.controller.Join;
import com.controller.Login;
import com.controller.Logout;
import com.controller.SetActuatorStatusCon;
import com.controller.UpdateMember;
import com.controller.Update_Automatic_Con;
import com.controller.arduinoGetSetPage;

@WebServlet("*.do")
public class front_Controller extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String request_URI = request.getRequestURI();
		String context_Path = request.getContextPath();
		String result_URI = request_URI.substring(context_Path.length() + 1);

		Command _interface = null;
	
		
		if (result_URI.equals("Login.do")) {
			_interface = new Login();
		} else if (result_URI.equals("domesticAnimals.do")) {
			_interface = new GetDomesticAnimals();
		} else if (result_URI.equals("updateMember.do")) {
			_interface = new UpdateMember();
		} else if (result_URI.equals("farmControl.do")) {
			_interface = new GetActuatorStatusCon();
		} else if (result_URI.equals("getState.do")) {
			_interface = new GetState();
		} else if (result_URI.equals("automaticControl.do")) {
			_interface = new Get_Automatic_Con();
		} else if (result_URI.equals("updateAutomaticControl.do")) {
			_interface = new Update_Automatic_Con();
		} else if (result_URI.equals("Join.do")) {
			_interface = new Join();
		} else if (result_URI.indexOf("farmControlSet.do")>=0) {
			_interface = new SetActuatorStatusCon();
		} else if (result_URI.equals("logout.do")) {
			_interface = new Logout();
		} else if (result_URI.indexOf("qp.do")>=0) {
			_interface = new arduinoGetSetPage();
		} else if (result_URI.equals("setManualControllAutoMode.do")) {
			_interface = new AutoShift();
		}
		
		

		_interface.command(request, response);
	}

}
