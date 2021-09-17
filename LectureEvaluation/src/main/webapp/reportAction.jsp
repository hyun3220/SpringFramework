<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.mail.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>
<%
	UserDAO userDAO = new UserDAO();
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'userLogin.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
	request.setCharacterEncoding("UTF-8");
	String reportTitle = null;
	String reportContent = null;
	
	if(request.getParameter("reportTitle") != null) {
		reportTitle = request.getParameter("reportTitle");
	}
	
	if(request.getParameter("reportContent") != null) {
		reportContent = request.getParameter("reportContent");
	}
	
	if(reportTitle == null || reportContent == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈칸을 입력해 주세요.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	String host = "http://localhost:8091/LectureEvaluation/";
	String from = "LectureAdm@gmail.com";
	String to = "ahdtlf3220@naver.com";
	String subject = "강의평가 사이트에서 접수된 신고내용입니다.";
	String content = "신고자 : " + userID + "<br> 제목 : " + reportTitle + "<br> 내용 : " + reportContent;
	
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	
	try{
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF8");
		Transport.send(msg);
	}
	catch(Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('신고가 접수되었습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
%>