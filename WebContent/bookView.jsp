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

<script type="text/javascript">
  function modify() {
	  alert("수정")
  }
  function bookDelete() {
	  //alert("delete")
	  if(confirm("정말 삭제 ?")){
		  f.action="bookDelete.do";
		  f.submit();
	  }
  }
  function bookList() {
	  f.action="bookList.do";
	  f.submit();
  }
</script>
</head>
<body>
<%@ include file="common/header.jsp" %>
<section>

<h2> Book 상세 보기</h2>

<form action="" name="f" method="post">
<input type="hidden" name="bookno" value="${book.bookno}">
<table>
<tr>
   <td>도서제목</td>
   <td> ${book.title}</td>
</tr>`	
<tr>
   <td>출판사</td>
   <td>${book.publisher}</td>
</tr>
<tr>
   <td>가격</td>
   <td>${book.price}</td>
</tr>

<tr>
   <td colspan="2"><img alt="...." src="./upload/${book.img }" width="200" height="200"> </td>
</tr>
</table>
<table>
  <tr>
     <td align="center">
         <input type="button" value="수정" onclick="modify()">
         <input type="button" value="삭제" onclick="bookDelete()">
         <input type="button" value="목록" onclick="bookList()">
     </td>
  </tr>
</table>
</form>
</section>
<%@ include file="common/footer.jsp" %>
</body>
</html>










