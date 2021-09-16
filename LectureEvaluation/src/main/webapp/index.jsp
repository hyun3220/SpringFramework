<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">
	<title> 강의평가 웹사이트 </title>
	
	<!-- 부트스트랩 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 CSS 추가 -->
	<link rel = "stylesheet" href = "./css/custom.css">

</head>
<body>
<%
	String userID = null;

	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인시 이용이 가능합니다.');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	
	if(emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendConfirm.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">강의평가 웹 사이트</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id = "navbar" class = "collapse navbar-collapse">
			<ul class = "navbar-nav mr-auto">
				<li class = "nav-item active">
					<a class = "nav-link" href = "index.jsp">메인</a>
				</li>
				<li class = "nav-item dropdown">
					<a class = "nav-link dropdown-toggle" id = "dropdown" data-toggle = "dropdown">
						회원 관리
					</a>
					<div class = "dropdown-menu" aria-labelledby = "dropdown">
<%
	if(userID == null) {
%>
						<a class = "dropdown-item" href = "userLogin.jsp">로그인</a>
						<a class = "dropdown-item" href = "userJoin.jsp">회원가입</a>
<%
	} else {
%>
						<a class = "dropdown-item" href = "userLogout.jsp">로그아웃</a>
<%
	}
%>
					</div>
				</li>
			</ul>	
			<form class = "form-inline my-2 my-lg-0">
				<input class = "form-control mr-sm-2" type = "search" placeholder = "내용을 입력하세요." aria-label = "search">
				<button class = "btn btn-outline-success my-2 my-sm-0" type = "submit">검색</button>
			</form>
		</div>
	</nav>
	<section class = "container">
		<form method = "get" action = "./index.jsp" class = "form-inline mt-3">
			<select name = "lectureDivide" class = "form-control mx-1 mt-2">
				<option value = "전체">전체</option>
				<option value = "전공">전공</option>
				<option value = "교양">교양</option>
				<option value = "기타">기타</option>
			</select>
			<input type = "text" name = "search" class = "form-control mx-1 mt-2" placeholder = "내용을 입력하세요.">
			<button type = "submit" class = "btn btn-primary mx-1 mt-2"> 검색 </button>
			<a class = "btn btn-primary mx-1 mt-2" data-toggle = "modal" href = "#registerModal">등록</a>
			<a class = "btn btn-danger mx-1 mt-2" data-toggle = "modal" href = "#reportModal">신고하기</a>
		</form>
		
	<div class = "card bg-light mt-3">
		<div class = "card-header bg-light">
			<div class = "row">
				<div class = "col-8 text-left">웹개발기획프로젝트&nbsp;<small>김해중</small></div>
				<div class = "col-4 text-right">
					종합 <span style = "color: red;">A</span>
				</div>
			</div>
		</div>
	
		<div class = "card-body">
			<h5 class = "card-title">
				정말 듣기 좋은 강의였습니다. <small>[2021년 2학기]</small>
			</h5>
			<p class = "card-text"> 강의가 많이 유연하고, 적절한 자료를 예시로 들어가며 설명해 주셔서 이해하기 수월했습니다. </p>
			<div class = "row">
				<div class = "col-9 text-left">
					성적 <span style = "color: red;">A</span>
					편의 <span style = "color: red;">B</span>
					강의 <span style = "color: red;">B</span>
					<span style = "color: green;">(추천 : 15)</span>
				</div>
				<div class = "col-3 text-right">
					<a onclick = "return confirm('추천 하시겠습니까?')" href = "./likeAction.jsp?evaluationID=">추천</a>
					<a onclick = "return confirm('삭제 하시겠습니까?')" href = "./deleteAction.jsp?evaluationID=">삭제</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "card bg-light mt-3">
		<div class = "card-header bg-light">
			<div class = "row">
				<div class = "col-8 text-left">정보보안&nbsp;<small>박헌우</small></div>
				<div class = "col-4 text-right">
					종합 <span style = "color: red;">B</span>
				</div>
			</div>
		</div>
	
		<div class = "card-body">
			<h5 class = "card-title">
				흥미롭지만 지루했던 강의였습니다. <small>[2021년 2학기]</small>
			</h5>
			<p class = "card-text"> 강의 자체의 내용이 워낙 방대하다 보니 지루하였지만, 교수님께서 세세하게 잘 설명해 주셔서 흥미롭게 잘 들었습니다.</p>
			<div class = "row">
				<div class = "col-9 text-left">
					성적 <span style = "color: red;">A</span>
					편의 <span style = "color: red;">C</span>
					강의 <span style = "color: red;">B</span>
					<span style = "color: green;">(추천 : 7)</span>
				</div>
				<div class = "col-3 text-right">
					<a onclick = "return confirm('추천 하시겠습니까?')" href = "./likeAction.jsp?evaluationID=">추천</a>
					<a onclick = "return confirm('삭제 하시겠습니까?')" href = "./deleteAction.jsp?evaluationID=">삭제</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class = "card bg-light mt-3">
		<div class = "card-header bg-light">
			<div class = "row">
				<div class = "col-8 text-left">모바일프로젝트&nbsp;<small>김원일</small></div>
				<div class = "col-4 text-right">
					종합 <span style = "color: red;">A</span>
				</div>
			</div>
		</div>
	
		<div class = "card-body">
			<h5 class = "card-title">
				학생들이 따라하기 쉽게 잘 알려주셨습니다. <small>[2021년 2학기]</small>
			</h5>
			<p class = "card-text"> 실습을 잘 따라갈 수 있도록 천천히 잘 설명해 주셨고, 모르는 부분을 자세히 알려주셔서 놓치지 않고 진행할 수 있었습니다. </p>
			<div class = "row">
				<div class = "col-9 text-left">
					성적 <span style = "color: red;">A</span>
					편의 <span style = "color: red;">A</span>
					강의 <span style = "color: red;">A</span>
					<span style = "color: green;">(추천 : 32)</span>
				</div>
				<div class = "col-3 text-right">
					<a onclick = "return confirm('추천 하시겠습니까?')" href = "./likeAction.jsp?evaluationID=">추천</a>
					<a onclick = "return confirm('삭제 하시겠습니까?')" href = "./deleteAction.jsp?evaluationID=">삭제</a>
				</div>
			</div>
		</div>
	</div>
	</section>

	<div class = "modal fade" id = "registerModal" tabindex = "-1" role = "dialog" aria-labelledby = "modal" aria-hidden = "true">
		<div class = "modal-dialog">
			<div class = "modal-content">
				<div class = "modal-header">
					<h5 class = "modal-title" id = "modal">평가 등록</h5>
					<button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close">
						<span aria-hidden = true>&times;</span>
					</button>
				</div>
				<div class = "modal-body">
					<form action = "./evaluationRegisterAction.jsp" method = "post">
						<div class = "form-row">
							<div class = "form-group col-sm-6">
								<label>강의명</label>
								<input type = "text" name = "lectureName" class = "form-control" maxlength = "20">
							</div>
							<div class = "form-group col-sm-6">
								<label>교수명</label>
								<input type = "text" name = "professorName" class = "form-control" maxlength = "20">
							</div>
						</div>
						
						<div class = "form-row">
							<div class = "form-group col-sm-4">
								<label>수강 연도</label>
								<select name = "lectureYear" class = "form-control">
									<option value = "2014">2014</option>
									<option value = "2015">2015</option>
									<option value = "2016">2016</option>
									<option value = "2017">2017</option>
									<option value = "2018">2018</option>
									<option value = "2019">2019</option>
									<option value = "2020">2020</option>
									<option value = "2021" selected>2021</option>
									<option value = "2022">2022</option>
									<option value = "2023">2023</option>
									<option value = "2024">2024</option>
									<option value = "2025">2025</option>
									<option value = "2026">2026</option>
									<option value = "2027">2027</option>
								</select>
							</div>
							<div class = "form-group col-sm-4">
								<label>수강 학기</label>
								<select name = "semesterDivide" class = "form-control">
									<option value = "1학기">1학기</option>
									<option value = "여름학기">여름학기</option>
									<option value = "2학기" selected>2학기</option>
									<option value = "겨울학기">겨울학기</option>
								</select>
							</div>
							
							<div class = "form-group col-sm-4">
								<label>강의 구분</label>
								<select name = "lectureDivide" class = "form-control">
									<option value = "전공" selected>전공</option>
									<option value = "교양">교양</option>
									<option value = "기타" >기타</option>
								</select>
							</div>
						</div>
						<div class = "form-group">
							<label>제목</label>
							<input type = "text" name = "evaluationTitle" class = "form-control" maxlength = "30">
						</div>
						
						<div class = "form-group">
							<label>내용</label>
							<textarea name = "evaluationContent" class = "form-control" maxlength = "2048" style = "height: 180px;"></textarea>
						</div>
						<div class = "form-row">
							<div class = "form-group col-sm-3">
								<label>종합</label>
								<select name = "totalScore" class = "form-control">
									<option value = "A" selected>A</option>
									<option value = "B">B</option>
									<option value = "C">C</option>
									<option value = "D">D</option>
									<option value = "F">F</option>
								</select>
							</div>
							
							<div class = "form-group col-sm-3">
								<label>성적</label>
								<select name = "creditScore" class = "form-control">
									<option value = "A" selected>A</option>
									<option value = "B">B</option>
									<option value = "C">C</option>
									<option value = "D">D</option>
									<option value = "F">F</option>
								</select>
							</div>
							
							<div class = "form-group col-sm-3">
								<label>편의</label>
								<select name = "comfortableScore" class = "form-control">
									<option value = "A" selected>A</option>
									<option value = "B">B</option>
									<option value = "C">C</option>
									<option value = "D">D</option>
									<option value = "F">F</option>
								</select>
							</div>
							
							<div class = "form-group col-sm-3">
								<label>강의</label>
								<select name = "lectureScore" class = "form-control">
									<option value = "A" selected>A</option>
									<option value = "B">B</option>
									<option value = "C">C</option>
									<option value = "D">D</option>
									<option value = "F">F</option>
								</select>
							</div>
						</div>
						<div class = "modal-footer">
							<button type = "button" class = "btn btn-secondary" data-dismiss = "modal">취소</button>
							<button type = "submit" class = "btn btn-primary">등록</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
	<div class = "modal fade" id = "reportModal" tabindex = "-1" role = "dialog" aria-labelledby = "modal" aria-hidden = "true">
		<div class = "modal-dialog">
			<div class = "modal-content">
				<div class = "modal-header">
					<h5 class = "modal-title" id = "modal">신고하기</h5>
					<button type = "button" class = "close" data-dismiss = "modal" aria-label = "Close">
						<span aria-hidden = true>&times;</span>
					</button>
				</div>
				<div class = "modal-body">
					<form action = "./reportAction.jsp" method = "post">
						<div class = "form-group">
							<label>제목</label>
							<input type = "text" name = "reportTitle" class = "form-control" maxlength = "30">
						</div>
						
						<div class = "form-group">
							<label>신고 내용</label>
							<textarea name = "reportContent" class = "form-control" maxlength = "2048" style = "height: 180px;"></textarea>
						</div>
						
						<div class = "modal-footer">
							<button type = "button" class = "btn btn-secondary" data-dismiss = "modal">취소</button>
							<button type = "submit" class = "btn btn-danger">신고</button>
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
	<footer class = "bg-dark mt-4 p-5 text-center" style = "color: #FFFFFF;">
		Copyright &copy; 2021 백승현 All Right Reserved.
	</footer>
	
	<!-- JQuery 스크립트 추가 -->
	<script src="./js/jquery.min.js"></script>
	<!-- Pooper 스크립트 추가 -->
	<script src="./js/pooper.js"></script>
	<!-- 부트스트랩 스크립트 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
