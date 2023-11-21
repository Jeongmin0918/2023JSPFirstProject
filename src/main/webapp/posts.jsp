<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.jsphelloproject.FriendsDAO, com.example.jsphelloproject.FriendsVO,java.util.*"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>free board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #808080;
  color: white;
}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
<%
	String filename = "";
	int sizeLimit = 15 * 1024 * 1024;

	String realPath = request.getServletContext().getRealPath("upload");
	File dir = new File(realPath);
	if (!dir.exists()) dir.mkdirs();

    DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	MultipartRequest multipartRequest = null;
	multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", policy);

	filename = multipartRequest.getFilesystemName("img1");
%>
<h1>친구게시판</h1>
<%
	FriendsDAO friendsDAO = new FriendsDAO();
	List<FriendsVO> list = friendsDAO.getFriendsList();
	request.setAttribute("list",list);
%>
<table id="list" width="90%">
<tr>
	<th>순번</th>
	<th>이름</th>
	<th>학번</th>
	<th>전공</th>
	<th>성별</th>
	<th>나이</th>
	<th>고향</th>
	<th>기숙사</th>
	<th>기독교/비기독교</th>
	<th>생일(YYYY-MM-DD)</th>
	<th>좋아하는계절</th>
	<th>캐릭터</th>
	<th>등록날짜</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td>${u.getSeq()}</td>
		<td>${u.getName()}</td>
		<td>${u.getStudent_num()}</td>
		<td>${u.getMajor()}</td>
		<td>${u.getGender()}</td>
		<td>${u.getAge()}</td>
		<td>${u.getHometown()}</td>
		<td>${u.getDormitory()}</td>
		<td>${u.getChristian()}</td>
		<td>${u.getBirthday()}</td>
		<td>${u.getSeason()}</td>
		<td><img src = "${pageContext.request.contextPath}/upload/<%=filename%>" width="10" height="10"></td>
		<td>${u.getRegdate()}</td>
		<td><a href="editform.jsp?id=${u.getSeq()}">수정</a></td>
		<td><a href="javascript:delete_ok('${u.getSeq()}')">삭제</a></td>
	</tr>
</c:forEach>
</table>
<br/><a href="addpostform.jsp">새로운 친구 등록하기</a>
</body>
</html>