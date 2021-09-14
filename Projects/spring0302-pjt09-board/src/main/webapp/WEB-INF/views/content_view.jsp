<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 내용</title>
</head>
<body>
<table width="500" cellpadding="0" cellspacing="0" border="1">
<form action="modify" method="post">
<input type="hidden" name="b_no" value="${content_view.b_no}">
<tr>
<td> 번호 </td>
<td> ${content_view.b_no} </td>
</tr>
<tr>
<td> 이름 </td>
<td> <input type="text" name="b_name" value="${content_view.b_name}"></td>
</tr>
<tr>
<td> 제목 </td>
<td> <input type="text" name="b_subject" value="${content_view.b_subject}"></td>
</tr>
<tr>
<td> 내용 </td>
<td> <textarea rows="10"
name="b_content" >${content_view.b_content}</textarea></td>
</tr>
<tr >
<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="list">
목록보기</a>
&nbsp;&nbsp; <a href="delete?b_no=${content_view.b_no}">삭제</a> &nbsp;&nbsp; <a
href="reply_view?b_no=${content_view.b_no}"></a></td>
</tr>
</form>
</table>
</body>
</html>