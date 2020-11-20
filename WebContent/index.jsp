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
<h3> link list</h3>
<ul>
<c:if test="${empty login}">
   <li><a href="${pageContext.request.contextPath}/login.jsp"> Login </a></li> <br>
</c:if>   
<c:if test="${!empty login }">
   <li><a href="${pageContext.request.contextPath}/logout.do"> Logout </a></li> <br>
   <li><a href="${pageContext.request.contextPath}/bookList.do"> Book List </a></li> <br>
   <li><a href="${pageContext.request.contextPath}/book.jsp"> Book 등록</a></li> <br>
</c:if>

   <li><a href="${pageContext.request.contextPath}/uploadForm.html"> upload</a></li> <br>
</ul>
</section>
<%@ include file="common/footer.jsp" %>
</body>
</html>