<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 꾸미기 bootstrap-->
</head>
<body>

	<table class="table">
	  <thead>
	    <tr>
		      <th scope="col">empno</th>
		      <th scope="col">ename</th>
		      <th scope="col">job</th>
		      <th scope="col">mgr</th>
		      <th scope="col">hiredate</th>
		      <th scope="col">sal</th>
		      <th scope="col">comm</th>
		      <th scope="col">deptno</th>
	    </tr>
	  </thead>
	  
	  <tbody>
	  <c:forEach var="emptlist" items="${emptList}" varStatus="status">
	      <tr>
			  <td><a href="detailForm.htm?empno=${emptlist.empno}">${emptlist.empno }</td>
		      <td>${emptlist.ename }</td>
		      <td>${emptlist.job }</td>
		      <td>${emptlist.mgr }</td>
		      <td>${emptlist.hiredate }</td>
		      <td>${emptlist.sal }</td>
		      <td>${emptlist.comm }</td>
		      <td>${emptlist.deptno }</td>
	    </tr>
	
	  </c:forEach>
	  </tbody>
	</table>
	<div class="col">
	<button class="btn btn-primary float-end"
			onclick="location.href='${pageContext.request.contextPath}/customer/addForm.htm'" type="button">사원 등록</button>
	</div>
</body>
</html>