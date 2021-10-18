<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판</title>
</head>
	<body>
		<p><img src = "/board/resources/list_view.png"></p>
		<table width="600" cellpadding="1" cellspacing="1" border="2">
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>제목</td>
				<td>날짜</td>
			</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.b_no}</td>
				<td>${dto.b_name}</td>
				<td>
				<!--<c:forEach begin="1" end="${dto.b_no}">-</c:forEach>-->
				<a href="content_view?b_no=${dto.b_no}">${dto.b_subject}</a></td>
				<td>${dto.b_date}</td>
			</tr>
		</c:forEach>
		<tr>  
			<td colspan="7"> <a href="write_view"><img src="/board/resources/buttons/write_b.gif"></a></td>
			<!-- <td colspan="7"> <a href="write_view">글작성</a></td> -->
		</tr>
		</table>
	</body>
</html>