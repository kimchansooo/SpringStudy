<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- forEach()  목록 출력하기  -->
<table style="border:2;">
<tr>
<td>사번</td><td>이름</td><td>직종</td><td>고용일</td><td>직종번호</td>
</tr>
	<c:forEach var="list" items="${list}">
		<tr onmouseover="this.style.backgroundColor='gray'" onmouseout="this.style.backgroundColor='white'">
			<td align="center">${list.empno}</td>
			<td align="left">
			<a href="${pageContext.request.contextPath}/emp/empDetail.do?empno=${list.empno}">${list.ename}</a>
			</td>
			<td align="center">${list.job}</td>
			<td align="center">${list.hiredate}</td>
			<td align="center">${list.deptno}</td>
		</tr>
	</c:forEach>
</table>
	<a href="${pageContext.request.contextPath}/emp/empWrite.do">추가하기</a>
	<a href="../index.jsp">home</a>
	<a href="${pageContext.request.contextPath}/emp/emplist.do?pg=1">이전</a>
	<a href="${pageContext.request.contextPath}/emp/emplist.do?pg=2">다음</a>
	<form action="emplist.do" method="post">
		<select name="f">
			<option value="ename">이름</option>
			<option value="job">직종</option>
			<option value="empno">사번</option>
		</select>
		<input type="text" name="q">
		<input type="submit" value="검색">
	</form>
</body>
</html>