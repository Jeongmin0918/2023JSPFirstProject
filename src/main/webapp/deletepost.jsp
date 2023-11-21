<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jsphelloproject.FriendsDAO, com.example.jsphelloproject.FriendsVO"%>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		FriendsVO u = new FriendsVO();
		u.setSeq(id);
		FriendsDAO friendsDAO = new FriendsDAO();
		friendsDAO.deleteFriends(u);
	}
	response.sendRedirect("posts.jsp");
%>