<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jsphelloproject.FriendsDAO"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="com.example.jsphelloproject.FriendsVO" />
<jsp:setProperty property="*" name="u"/>

<%
	FriendsDAO friendsDAO = new FriendsDAO();
	int i = friendsDAO.insertFriends(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러]";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>