<%@page import="com.Model.Crawling_Wether_DAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Model.Domestic_AnimalsDTO"%>
<%@page import="com.Model.Entire_Environment_DTO"%>
<%@page import="com.Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE HTML>
<html>
<head>
<title>메인</title>
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
	width: 13em;
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

input[type="submit"].fit, input[type="reset"].fit, input[type="button"].fit,
	.button.fit {
	border: 2px solid #FFF;
}
</style>

</head>
<body>
	<%
	    MemberDTO user = (MemberDTO)session.getAttribute("user");	
		Entire_Environment_DTO entire_environment_DTO = null;
		Domestic_AnimalsDTO[] animalsDTOs = null;
		LocalDateTime nearVacDate = LocalDateTime.now().plusYears(1);
		LocalDateTime nearForwadDate = LocalDateTime.now().plusYears(1);
		LocalDateTime today = LocalDateTime.now();
		if(user == null){
			response.sendRedirect("Login.jsp");
		}else{
				entire_environment_DTO =  
						(Entire_Environment_DTO)session.getAttribute("StateAllSelect");	
				
				animalsDTOs = 
						(Domestic_AnimalsDTO[])session.getAttribute("animalDB");
				String [][]vacTmpDate = new String[2][3];
				
				vacTmpDate[0][0] = animalsDTOs[0].getFir_vaccine();
				vacTmpDate[0][1] = animalsDTOs[0].getSec_vaccine();
				vacTmpDate[0][2] = animalsDTOs[0].getThr_vaccine();
				
				vacTmpDate[1][0] = animalsDTOs[1].getFir_vaccine();
				vacTmpDate[1][1] = animalsDTOs[1].getSec_vaccine();
				vacTmpDate[1][2] = animalsDTOs[1].getThr_vaccine();
        		
				for(int i = 0; i <2 ; i++){
					for(int j = 0; j <3 ; j++){
						String tmpDate = vacTmpDate[i][j];
						LocalDateTime s = LocalDateTime.parse(tmpDate,DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
						System.out.println(tmpDate);
						if(nearVacDate.isAfter(s) && s.isAfter(today) ){
							nearVacDate= s; 
						}
					}	
					String tmpDate = animalsDTOs[i].getForwarding_date();
					LocalDateTime s = LocalDateTime.parse(tmpDate,DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
					
					if(nearForwadDate.isAfter(s) && s.isAfter(today)){
						nearForwadDate= s; 
						System.out.println("출하"+nearForwadDate);
					}
				}
		}
	
	%>
	<% if(user!=null ){%>

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
		
			Crawling_Wether_DAO wether_dao = new Crawling_Wether_DAO();

			String temp_Pas = wether_dao.Temp_Parser();
			String weater_Pas = wether_dao.Weather_Parser();
		
		%>

		<table
			style="margin-left: 200px; margin-bottom: 0px; padding-left: 0px; margin-right: 200px; height: 100px; margin-top: 60px;">

			<tr>
				<td>
					<section class="4u" style="height: 185px; width: 195px;">
						<a href="automaticControl.do" class="image featured"
							style="margin-right: 0px; padding-right: 30px;"> <img
							src="images/pic01.png" class="img"></a>
						<div class="box"
							style="margin-left: 15px; margin-top: 0px; padding-bottom: 10px; padding-top: 10px; padding-left: 0px; padding-right: 0px; margin-right: 15px;">
							온도:<%=entire_environment_DTO.getTemp()%>º <br> <span>
								습도:<%=entire_environment_DTO.getHumi()%>%
							</span>
						</div>
					</section>
				<td>
					<section class="4u" style="height: 185px; width: 195px;">
						<a onclick="window.open(this.href, '_blank', 'width=800, height=600'); return false;" href="https://weather.naver.com/" class="image featured"
							style="margin-right: 0px; padding-right: 30px;"><img
							src="images/pic02.png" class="img" id="weatherImg"
							style="margin-bottom: 0px;" ></a>
						<div class="box"
							style="margin-left: 0px; padding-bottom: 10px; padding-top: 10px; width: 220px;"><%=temp_Pas%><br>
							<%if(user!=null) {%>
								<span><%=weater_Pas%></span>
							<%} %>
							
						</div>

					</section>
				</td>
			</tr>
			<tr>
				<td style="padding-top: 80px;">
					<section class="4u" style="height: 185px; width: 195px;">
						<a href="domesticAnimals.do" class="image featured"
							style="margin-right: 0px; padding-right: 30px;"><img
							src="images/pic03.png" class="img"></a>
						<div class="box"
							style="margin-left: 17px; padding-bottom: 10px; padding-top: 10px;">
							가까운 백신접종일 <span><%=nearVacDate.format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"))%></span>
						</div>
					</section>
				</td>

				<td>
					<section class="4u" style="height: 185px; width: 195px;">
						<a href="domesticAnimals.do" class="image featured"
							style="margin-right: 0px; padding-right: 30px;"><img
							src="images/pic04.png" class="img"></a>
						<div class="box"
							style="margin-left: 17px; padding-bottom: 10px; padding-top: 10px;">
							가까운 출하예정일 <span><%=nearForwadDate.format(DateTimeFormatter.ofPattern("yyyy년MM월dd일"))%></span>
						</div>
					</section>
				</td>
			</tr>
		</table>
	</div>
	<%} %>
</body>
</html>