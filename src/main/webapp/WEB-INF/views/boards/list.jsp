<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style>
.container {
	padding-top: 25px;
}
</style>
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>

	<div class="container">

		<div class="row">
			<h1 class="text-center" style="color: #dd4814;">
				<b>자유 게시판</b>
			</h1>
		</div>

		<!-- 모바일 -->
		<table class="table table-striped table-hover visible-xs">
			<thead>
				<tr class="danger">
					<th>제목</th>
					<th width="120">작성자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="board">
					<tr onclick="window.location.href='/boards/${board.bno}'">
						<td>${board.title }</td>
						<td>${board.writer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 나머지 -->
		<table class="table table-striped table-hover hidden-xs">
			<thead>
				<tr class="danger">
					<th width="70">글번호</th>
					<th>제목</th>
					<th width="120">작성자</th>
					<th width="140">작성 날짜</th>
					<th width="70">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="board">
					<tr onclick="window.location.href='/boards/${board.bno}'">
						<td>${board.bno }</td>
						<td>${board.title }</td>
						<td>${board.writer }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${board.regdate }" /></td>
						<td><span class="badge">${board.hit }</span></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 페이지 -->
		<div align="center">
			<ul class="pagination">
				<li class="disabled"><a href="#">&laquo;</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li class="hidden-xs"><a href="#">6</a></li>
				<li class="hidden-xs"><a href="#">7</a></li>
				<li class="hidden-xs"><a href="#">8</a></li>
				<li class="hidden-xs"><a href="#">9</a></li>
				<li class="hidden-xs"><a href="#">10</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>

		<!-- 글쓰기, 검색 버튼 -->
		<div class="row">
			<div class="col-xs-3">
				<a href="boards/new" class="btn btn-primary">글쓰기</a>
			</div>
			<div class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-6">
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control"> <span
							class="input-group-btn">
							<button class="btn btn-warning" type="button">검색</button>
						</span>
					</div>
				</div>
			</div>
		</div>

	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script type="text/javascript">
		var result = '${result}';

		if (result === 'success') {
			alert('작업이 성공적으로 진행되었습니다.');
		}
	</script>
</body>
</html>