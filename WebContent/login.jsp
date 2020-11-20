<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book App</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="./css/my.css">
<link rel="stylesheet" href="./css/main.css">

</head>
<body>
<%@ include file="common/header.jsp" %>
<section>
<h2> login form</h2>

<form action="${pageContext.request.contextPath}/login.do" method="post">
<table>

   <tr>
       <td colspan="2"><span style="color: red">${msg}</span></td>
   </tr>
   <tr>
       <td>ID</td>
       <td><input type="text" name="id" required="required" ></td>
   </tr>
   <tr>
       <td>PW</td>
       <td><input type="password" name="password" required="required"> </td>
   </tr>
   <tr>
       <td colspan="2">
           <input type="submit" value="로그인">
           <input type="reset" value="취소">
           <a href="#"> 회원가입</a>
       </td>
   </tr>
</table>
</form>

</section>
<%@ include file="common/footer.jsp" %>
</body>
</html>





