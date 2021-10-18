<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 작성</title>
</head>
	<body>
		<p><img src = "/board/resources/write_view.png"></p>
		<table width="600" cellpadding="1" cellspacing="1" border="1">
			<form action="write" method="post" id="input">
				<tr>
					<td> 이름 </td>
					<td> <input type="text" name="b_name" size = "60"> </td>
				</tr>
				<tr>
					<td> 제목 </td>
					<td> <input type="text" name="b_subject" size = "60"> </td>
				</tr>
				<tr>
					<td> 내용 </td>
					<td> <textarea name="b_content" rows="10" cols="50"></textarea> </td>
				</tr>
				<tr >
					<td colspan="2"> 
					<a href="#" onclick="document.getElementById('input').submit();"><img src="/board/resources/buttons/regist_b.gif"/></a> &nbsp;&nbsp; 
					<a href="list.do"><img src="/board/resources/buttons/list_b.gif"></a></td>
					<!-- <td colspan="5"> <input type="submit" value="입력"> &nbsp;&nbsp; <a href="list.do">목록보기</a></td> -->
				</tr>
			</form>
		</table>
	</body>
</html>