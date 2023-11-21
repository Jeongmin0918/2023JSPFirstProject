<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<h1>새로운 친구 등록</h1>
<form action="addpost.jsp" method="post">
<table>
    <tr><td>이름:</td><td><input type="text" name="name"/></td></tr>
    <tr><td>학번:</td><td><input type="text" name="student_num"/></td></tr>
    <tr><td>전공:</td><td><input type="text" name="major"/></td></tr>
    <tr><td>성별:</td><td><input type="text" name="gender"/></td></tr>
    <tr><td>나이:</td><td><input type="text" name="age"/></td></tr>
    <tr><td>고향:</td><td><input type="text" name="hometown"/></td></tr>
    <tr><td>기숙사:</td><td><input type="text" name="dormitory"/></td></tr>
    <tr><td>기독교/비기독교:</td><td><input type="text" name="christian"/></td></tr>
    <tr><td>생일:</td><td><input type="text" name="birthday"/></td></tr>
    <tr><td>좋아하는계절:</td><td><input type="text" name="season"/></td></tr>

    <tr><td><a href="posts.jsp">모든 기록 조희</a></td><td align="right"><input type="submit" value="등록하기"/></td></tr>
</table>
</form>

</body>
</html>