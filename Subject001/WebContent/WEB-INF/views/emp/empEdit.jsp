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
<form method="post" >
<div id="notice-article-detail" class="article-detail margin-large" >						
	<dl class="article-detail-row">
		<dt class="article-detail-title">
			사원번호
		</dt>
		<dd class="article-detail-data">
			${emp.empno}
		</dd>
	</dl>	
	<dl class="article-detail-row">
		<dt class="article-detail-title">
			이름
		</dt>
		<dd class="article-detail-data">
			&nbsp;<input name="ename" value="${emp.ename}" />
		</dd>
	</dl>	
	<dl class="article-detail-row half-row">
		<dt class="article-detail-title">
			직종
		</dt>
		<dd class="article-detail-data half-data" >
			&nbsp;<input name="job" value="${emp.job}" />
		</dd>
	</dl>
	<dl class="article-detail-row half-row">
		<dt class="article-detail-title">
			mgr
		</dt>
		<dd class="article-detail-data half-data">
			&nbsp;<input type="text" name="mgr" value="${emp.mgr}">
		</dd>
	</dl>
	<dl class="article-detail-row half-row">
		<dt class="article-detail-title">
			고용일
		</dt>
		<dd class="article-detail-data half-data">
			${emp.hiredate}
		</dd>
	</dl>
	<dl class="article-detail-row half-row">
		<dt class="article-detail-title">
			sal
		</dt>
		<dd class="article-detail-data half-data">
			&nbsp;<input type="text" name="sal" value="${emp.sal}">
		</dd>
	</dl>
	<dl class="article-detail-row half-row">
		<dt class="article-detail-title">
			comm
		</dt>
		<dd class="article-detail-data half-data">
			&nbsp;<input type="text" name="comm" value="${emp.comm}">
		</dd>
	</dl>	
	<dl class="article-detail-row half-row">
		<dt class="article-detail-title">
			deptno
		</dt>
		<dd class="article-detail-data half-data">
			&nbsp;<input type="text" name="deptno" value="${emp.deptno}">
		</dd>
	</dl>					
</div>
<input type="submit" value="작성확인">
<a class="btn-cancel button" href="${pageContext.request.contextPath}/emp/empDetail.do?empno=${emp.empno}">취소</a>
</form>
</body>
</html>