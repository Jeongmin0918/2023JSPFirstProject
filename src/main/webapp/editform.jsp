<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.example.jsphelloproject.FriendsDAO, com.example.jsphelloproject.FriendsVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
	<style>
		body {
			background-color: #f0f0f0;
			color: #000000;
			font-family: Arial, sans-serif;
		}

		h1 {
			color: #000000;
		}

		table {
			background-color: #ddd;
			padding: 20px;
			border-radius: 5px;
			width: 50%;
			margin: auto;
		}

		input[type="text"] {
			width: 80%;
			padding: 10px;
			margin-bottom: 10px;
			border: 1px solid #ccc;
			border-radius: 4px;
		}

		input[type="submit"] {
			padding: 10px 20px;
			cursor: pointer;
			border-radius: 4px;
			background-color: #f0f0f0;
			color: #333;
			border: none;
		}

		input[type="submit"]:hover {
			background-color: #ccc;
		}

		a {
			text-decoration: none;
			padding: 5px 10px;
			margin-right: 10px;
			border: 1px solid #000;
			border-radius: 5px;
			color: #000;
		}

		a:hover {
			background-color: #ddd;
			color: #fff;
		}
	</style>
</head>
<body>

<%
	FriendsDAO friendsDAO = new FriendsDAO();
	String id=request.getParameter("id");	
	FriendsVO u=friendsDAO.getFriends(Integer.parseInt(id));
%>

<h1>친구 정보 수정중...</h1>
<form action="editpost.jsp" method="post">
<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
<table>
	<tr><td>이름:</td><td><input type="text" name="name" value="<%= u.getName() %>"/></td></tr>
	<tr><td>학번:</td><td><input type="text" name="student_num" value="<%= u.getStudent_num() %>"/></td></tr>
	<tr><td>전공:</td><td><input type="text" name="major" value="<%= u.getMajor() %>"/></td></tr>
	<tr><td>성별:</td><td><input type="text" name="gender" value="<%= u.getGender() %>"/></td></tr>
	<tr><td>나이:</td><td><input type="text" name="age" value="<%= u.getAge() %>"/></td></tr>
	<tr><td>고향:</td><td><input type="text" name="hometown" value="<%= u.getHometown() %>"/></td></tr>
	<tr><td>기숙사:</td><td><input type="text" name="dormitory" value="<%= u.getDormitory() %>"/></td></tr>
	<tr><td>기독교/비기독교:</td><td><input type="text" name="christian" value="<%= u.getChristian() %>"/></td></tr>
	<tr><td>생일:</td><td><input type="text" name="birthday" value="<%= u.getBirthday() %>"/></td></tr>
	<tr><td>좋아하는계절:</td><td><input type="text" name="season" value="<%= u.getSeason() %>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="수정 완료"/>
<input type="button" value="수정 취소" onclick="history.back()"/></td></tr>
</table>
</form>

</body>
</html>