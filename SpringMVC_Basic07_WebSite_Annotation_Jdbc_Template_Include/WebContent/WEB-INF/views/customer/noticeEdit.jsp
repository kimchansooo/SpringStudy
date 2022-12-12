<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="../css/customer.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/Inc/header.jsp" />
	<jsp:include page="Inc/visual.jsp" />
	<div id="main">
		<div class="top-wrapper clear">
			<div id="content">
				<h2>공지사항</h2>
				<h3 class="hidden">방문페이지위치</h3>
				<ul id="breadscrumb" class="block_hlist">
					<li>HOME</li>
					<li>고객센터</li>
					<li>공지사항수정</li>
				</ul>
				<form action="noticeEdit.htm" method="post"
					enctype="multipart/form-data">
					<div id="notice-article-detail" class="article-detail margin-large">
						<dl class="article-detail-row">
							<dt class="article-detail-title">제목</dt>
							<dd class="article-detail-data">
								&nbsp;<input name="title" value="${notice.title}" /><input
									type="hidden" name="seq" value="${notice.seq}" />
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">작성자</dt>
							<dd class="article-detail-data half-data">${notice.writer}
							</dd>
						</dl>
						<dl class="article-detail-row half-row">
							<dt class="article-detail-title">조회수</dt>
							<dd class="article-detail-data half-data">${notice.hit}</dd>
						</dl>
						<dl class="article-detail-row">
							<dt class="article-detail-title">첨부파일_1</dt>
							<dd class="article-detail-data">
								&nbsp;<input type="file" id="txtFile" name="files[0]" />
								${notice.fileSrc}
							</dd>
						</dl>
						<dl class="article-detail-row">
							<dt class="article-detail-title">첨부파일_2</dt>
							<dd class="article-detail-data">
								&nbsp;<input type="file" id="txtFile" name="files[1]" />
								${notice.fileSrc2}
							</dd>
						</dl>
						<div class="article-content">
							<textarea id="txtContent" class="txtContent" name="content"><img
									src="http://sstatic.naver.net/keypage/outside/info/2011031017145546407.jpg" /><br />동해물과 백두산이 마르고 닳도록
							</textarea>
						</div>
					</div>
					<p class="article-comment margin-small">
						<!-- <a class="btn-edit button" href="noticeEdit.jsp">수정</a> -->
						<input type="submit" value="수정" class="btn-save button" /> <a
							class="btn-del button" href="noticeDetail.htm?seq=${notice.seq}">취소</a>
					</p>
				</form>
			</div>
			<jsp:include page="Inc/aside.jsp" />

		</div>
	</div>
	<jsp:include page="../Inc/footer.jsp" />

</body>
</html>