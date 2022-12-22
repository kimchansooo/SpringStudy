<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h4 class="mb-3">사원 상세보기</h4>
		
		<form method="post">
			<div>
				<label for="ename">이름</label>
				<input type="text" id="ename" name="ename" class="form-control" placeholder="${emp.ename}">
			</div>
			<div>
				<label for="job">직업</label>
				<input type="text" id="job" name="job" class="form-control" placeholder="${emp.job}">
			</div>
			<div>
				<label for="sal">연봉</label>
				<input type="text" id="sal" name="sal" class="form-control" placeholder="${emp.sal}">
			</div>
			<div>
				<label for="comm">보너스</label>
				<input type="text" id="comm" name="comm" class="form-control" placeholder="${emp.comm}">
			</div>
			<hr class="my-4">
			
			<div class="row">
				<div class="col">
					<button class="w-100 btn-primary btn-lg" type="submit">사원 수정</button>
				</div>
				<div class="col">
					<button class="w-100 btn-primary btn-lg" type="button" onclick="location.href='${pageContext.request.contextPath}/customer/items.htm'">취소</button>
				</div>
			</div>
		</form>
		<div class="col">
			<button class="w-100 btn-primary btn-lg" type="button" onclick="location.href='${pageContext.request.contextPath}/customer/empDel.htm?empno=${emp.empno}'">삭제</button>
		</div>
	</div>
</body>
</html>