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
<div id="pageContainer">
	<div style="padding-top: 30px; text-align: center">

			<b>게시판 글내용</b>
			<table width="80%" border="1" >
				<tr>
					<td width="20%" align="center"><b> 사원번호 </b></td>
					<td width="30%">${emp.empno}</td>
					<td width="20%" align="center"><b>이름</b></td>
					<td>${emp.ename}</td>
				</tr>
				<tr>
					<td width="20%" align="center"><b>job</b></td>
					<td width="30%">${emp.job}</td>
					<td width="20%" align="center"><b>mgr</b></td>
					<td>${emp.mgr}</td>
				</tr>
				<tr>
					<td width="20%" align="center"><b>hiredate</b></td>
					<td>${emp.hiredate}</td>
					 <td width="20%" align="center"><b>봉급</b></td>
					<td>${emp.sal}</td>
				</tr>
				<tr>
					<td width="20%" align="center"><b>comm</b></td>
					<td width="30%">${emp.comm}</td>
					<td width="20%" align="center"><b>직종번호</b></td>
					<td width="30%">${emp.deptno}</td>
				</tr>
			</table>
			<a href="${pageContext.request.contextPath}/emp/empEdit.do?empno=${emp.empno}">수정</a>
			<a href="${pageContext.request.contextPath}/emp/emplist.do">목록</a>
	</div>
</div>
</body>
</html>