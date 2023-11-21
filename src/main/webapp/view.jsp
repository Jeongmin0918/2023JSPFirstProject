<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.jsphelloproject.FriendsDAO, com.example.jsphelloproject.FriendsVO"%>
<!DOCTYPE html>
<html>
<head>
    <title>View</title>
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
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
</head>
<body>
<%
    FriendsDAO friendsDAO = new FriendsDAO();
    FriendsVO u = null;
    String idParam = request.getParameter("id");
    if (idParam != null && !idParam.isEmpty()) {
        int id = Integer.parseInt(idParam);
        u = friendsDAO.getFriends(id);
    } else {
        System.out.println("오류" + idParam);
    }
%>

<h1><%= u.getSeq() %>번째 친구 정보</h1>
<table>
    <tr><td>이름:</td><td><%= u.getName() %></td></tr>
    <tr><td>학번:</td><td><%= u.getStudent_num() %></td></tr>
    <tr><td>전공:</td><td><%= u.getMajor() %></td></tr>
    <tr><td>성별:</td><td><%= u.getGender() %></td></tr>
    <tr><td>나이:</td><td><%= u.getAge() %></td></tr>
    <tr><td>고향:</td><td><%= u.getHometown() %></td></tr>
    <tr><td>기숙사:</td><td><%= u.getDormitory() %></td></tr>
    <tr><td>기독교/비기독교:</td><td><%= u.getChristian() %></td></tr>
    <tr><td>생일:</td><td><%= u.getBirthday() %></td></tr>
    <tr><td>좋아하는 계절:</td><td><%= u.getSeason() %></td></tr>
    <input type="button" value="뒤로가기" onclick="history.back()"/></td></tr>
</table>

</body>
</html>