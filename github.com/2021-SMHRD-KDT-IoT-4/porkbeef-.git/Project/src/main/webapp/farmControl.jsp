<%@page import="com.Model.MemberDTO"%>
<%@page import="com.Model.Actuator_Status_DTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>

<title>축사제어</title>
<meta charset="EUC-KR">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=1024, height=768" />

<script src="js/jquery.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>

<script src="js/jquery.dropotron.min.js"></script>
<script src="js/skel-layers.min.js"></script>

<style type="text/css">
.wrapper.style1 {
	background: url(./images/back.jpg) no-repeat center top;
	padding-top: 11em;
	padding-bottom: 24em;
	background-size: cover;
	background-attachment: fixed;
	-webkit-backface-visibility: hidden;
	-webkit-transform: translateZ(0);
}

#header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	background: #00000000;
	color: #fff;
	padding: 1.25em;
	z-index: 100;
}

.box {
	padding: 20px;
	background: #FFF;
	text-align: center;
	border-radius: 5px;
	margin-left: 19px;
}

table {
	width: 75%;
	margin-left: 13em;
	margin-top: 12em;
}

body, input, select, textarea {
	font-size: 12pt;
	line-height: 2.5em;
}

#logo {
	font-size: 2em;
	cursor: default;
}

#nav {
	position: absolute;
	right: 0;
	top: 0;
	cursor: default;
}

.\34 u {
	width: 180px;
}

.image.featured img {
	display: block;
	width: 90%;
}

.image.featured {
	position: static;
	display: block;
	width: 15em;
	padding: 10px;
	margin: auto;
}

#nav ul li a {
	-moz-transition: color 0.35s ease-in-out;
	-webkit-transition: color 0.35s ease-in-out;
	-o-transition: color 0.35s ease-in-out;
	-ms-transition: color 0.35s ease-in-out;
	transition: color 0.35s ease-in-out;
	display: inline-block;
	color: #ddd;
	color: black;
	font-weight: 900;
	text-decoration: none;
}

input[type="submit"].fit,
            input[type="reset"].fit,
            input[type="button"].fit,
            .button.fit {
                border: 2px solid #FFF;
            }
</style>

</head>

<body>
	<%
	// 로그인을 했을때 저장한 session 값 불러오기
	MemberDTO user = (MemberDTO) session.getAttribute("user");
	if(user ==null){
		response.sendRedirect("Login.jsp");
	}else{%>
	<div class="wrapper style1"
		style="height: 700px; padding-top: 1px; padding-bottom: 0px;">


		<div id="header" class="skel-panels-fixed"
			style="bottom: 690px; padding-right: 0px; padding-left: 0px; padding-top: 0px; padding-bottom: 0px;">
			<div id="logo"
				style="border-top-width: 0px; padding-top: 0px; padding-bottom: 0px; padding-left: 0px;">
				<h1>
					<a href="index.jsp"><input type="image"
						src="./images/icon_back.png"
						style="width: 115px; padding-left: 0px; margin-left: 18px; margin-top: 17px;"></a>
				</h1>
			</div>
			<nav id="nav" style="bottom: 0px; padding-top: 0px;">
				<ul style="margin-bottom: 0px; height: 46px; padding-top: 10px;">
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="farmControl.do">축사 제어</a></li>
					<%
					if (user != null && user.getMb_grade() < 2) {
					%>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="automaticControl.do">자동 제어</a></li>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="member.jsp">회원 관리</a></li>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="domesticAnimals.do">돼지 현황</a></li>
					<%
					}
					%>
					<li
						style="white-space: nowrap; padding-top: 0px; padding-right: 20px; padding-bottom: 0px; padding-left: 20px;"><a
						href="logout.do">로그아웃</a></li>
				</ul>
			</nav>
		</div>

		<%
		Actuator_Status_DTO actu_Status = (Actuator_Status_DTO) session.getAttribute("Actuator_Status_All");
		String autoMode="자동";
		if(user!=null){
				
			
			Integer index_1 = (Integer)session.getAttribute("AutoMode");
			
			if(index_1 == 1){
				autoMode="수동";
			}
		}
		
		%>

		<!-- 몸체 -->
		<div class="container"
			style="margin-left: 0px; margin-right: 0px; height: 300px; width: 950px; padding-left: 170px; padding-right: 170px; padding-top: 200px; padding-bottom: 200px;">
			<div>
			<button onclick="location.href='setManualControllAutoMode.do'">자동전환</button>
			<span style="color: white;font: bold;">현재상태 : <%=autoMode %></span>
			</div>
			<div class="row no-collapse-1"
				style="margin-left: 0px; width: 1016px;">
				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">
						<h1>사료주기</h1>

						<%
						if (actu_Status != null) {
						%>
						<h1>
							상태는
							<%=actu_Status.getAct_feed()%>
							입니다.
						</h1>
						<input type="button" id="Act_feed" value="동작"
							onclick="action_actuator_State(1,<%=actu_Status.getAct_feed()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">

						<%// action_actuator_State(센서변수번호 - 1~7번 / 센서동작상태 - 0또는 1)%>

						<%}else {%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="Act_feed" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%}%>
					</div>
				</form>


				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">
						<h1>축사문 개폐</h1>

						<%
							if (actu_Status != null) {
							%>
						<h1>
							상태는
							<%=actu_Status.getAct_door()%>
							입니다.
						</h1>
						<input type="button" id="act_door" value="동작"
							onclick="action_actuator_State(2,<%=actu_Status.getAct_door()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">

						<%} else {%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="act_door" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%}%>
					</div>
				</form>


				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">
						<h1>흡배기 동작/정지</h1>
						<%
							if (actu_Status != null) {
							%>
						<h1>
							상태는
							<%=actu_Status.getAct_absor()%>
							입니다.
						</h1>
						<input type="button" id="act_absor" value="동작"
							onclick="action_actuator_State(3,<%=actu_Status.getAct_absor()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%
							} else {
							%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="act_absor" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%
							}
							%>
					</div>
				</form>

				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">

						<h1>에어컨 동작/정지</h1>
						<%
							if (actu_Status != null) {
							%>
						<h1>
							상태는
							<%=actu_Status.getAct_aircon()%>
							입니다.
						</h1>
						<input type="button" id="act_aircon" value="동작"
							onclick="action_actuator_State(4,<%=actu_Status.getAct_aircon()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%
							} else {
							%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="act_aircon" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%
							}
							%>
					</div>
				</form>
			</div>


			<div class="row no-collapse-1"
				style="width: 1016px; height: 150px; margin-left: 85px; margin-right: 85px;">

				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">
						<h1>펌프 동작/정지</h1>
						<%
							if (actu_Status != null) {
							%>
						<h1>
							상태는
							<%=actu_Status.getAct_pump()%>
							입니다.
						</h1>
						<input type="button" id="act_pump" value="동작"
							onclick="action_actuator_State(5,<%=actu_Status.getAct_pump()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%
							} else {
							%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="act_pump" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%
							}
							%>
					</div>
				</form>

				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">
						<h1>보일러 동작/정지</h1>
						<%if (actu_Status != null) {%>
						<h1>
							상태는
							<%=actu_Status.getAct_boil()%>
							입니다.
						</h1>
						<input type="button" id="act_boil" value="동작"
							onclick="action_actuator_State(6,<%=actu_Status.getAct_boil()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%} else {%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="act_boil" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%}%>
					</div>
				</form>

				<form class="4u" action="farmControl.do" method="post"
					style="padding-left: 0px;">
					<div class="box"
						style="margin-left: 0px; padding-bottom: 5px; padding-left: 5px; padding-top: 5px; padding-right: 5px; width: 145px; height: 150px; margin-top: 0px; margin-bottom: 0px;">
						<h1>가습기 동작/정지</h1>
						<%
							if (actu_Status != null) {
							%>
						<h1>
							상태는
							<%=actu_Status.getAct_humid()%>
							입니다.
						</h1>
						<input type="button" id="act_humid" value="동작"
							onclick="action_actuator_State(7,<%=actu_Status.getAct_humid()%>)"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%} else {%>
						<h1>상태 정보가 없습니다.</h1>
						<input type="button" id="act_humid" value="동작"
							onclick="action_Empty()"
							style="padding-left: 0px; padding-right: 0px; border-top-width: 2px; padding-top: 0px; padding-bottom: 0px; width: 100px; height: 60px;">
						<%}%>
					</div>
				</form>
			</div>

		</div>
	</div>

	
	<%} %>
	
	<script type="text/javascript">
                        
                        
		function action_actuator_State(actuator_Num, actuator_State) {
		
	
			location.href="farmControlSet.do?actnum=" +actuator_Num + "&actState="+ actuator_State;
		
		}
      </script>
</body>

</html>