<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>index</title>
		<link href="../joinus/join.css" type="text/css" rel="stylesheet" />
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/inc/header.jsp" />
		<jsp:include page="inc/visual.jsp" />
		<div id="main">
			<div class="top-wrapper clear">
				<div id="content">
					<form action="" method="post">
						<h2>회원가입</h2>
						<h3 class="hidden">방문페이지 로그</h3>
						<p id="breadscrumb" class="block_hlist clear"><img alt="Step1 개인정보 등록" src="images/step2.png" /></p>
						<h3 class="hidden">회원가입 폼</h3>
						<div id="join-form" class="join-form margin-large" >						
							<dl class="join-form-row">
								<dt class="join-form-title">
									아이디
								</dt>
								<dd class="join-form-data">
									<input type="text" value="${member.userid}" name="userid" readonly>
									<input id="btnCheckUid" class="button" type="button" value="중복확인" />
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									비밀번호
								</dt>
								<dd class="join-form-data">
									<input type="password" value="" name="pwd">
								</dd>
							</dl>
							
							<dl class="join-form-row">
								<dt class="join-form-title">
									이름
								</dt>
								<dd class="join-form-data">
									<input type="text" value="${member.name}" name="name">
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									성별
								</dt>
								<dd class="join-form-data">
									<input type="text" value="${member.gender}" name="gender" readonly>
								</dd>
							</dl>
							
							<dl class="join-form-row">
								<dt class="join-form-title">
									핸드폰 번호
								</dt>
								<dd class="join-form-data">
									<input type="text" value="${member.cphone}" name="cphone">[대시(-)를 포함할 것: 예) 010-3456-2934]</span>
								</dd>
							</dl>
							<dl class="join-form-row">
								<dt class="join-form-title">
									이메일
								</dt>
								<dd class="join-form-data">
									<input type="text" value="${member.email}" name="email">
								</dd>
							</dl>
											
						</div>
						<div id="buttonLine">
						<input class="btn-okay button" type="submit" value="수정" />
						</div>
					</form>	
					
				</div>
				<jsp:include page="inc/aside.jsp" />
			</div>
		</div>
		<jsp:include page="../inc/footer.jsp" />
	</body>
</html>
