<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../include/header.jsp"></jsp:include>

<style>
.container {
	padding-top: 25px;
}
</style>

<div class="container">

	<div class="row">
		<h1 class="text-center" style="color: #3c8dbc;">
			<b>자유 게시판</b>
		</h1>
	</div>

	<div class="row">
		<div class="box-body table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th width="70">글번호</th>
						<th>제목</th>
						<th width="120">작성자</th>
						<th width="140">작성날짜</th>
						<th width="70">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="board">
						<tr onclick="window.location.href='/boards/${board.bno}'">
							<td>${board.bno }</td>
							<%-- <td>${board.title }</td> --%>
							<td>${board.title } <strong>[ ${board.replycnt} ]</strong></td>
							<td>${board.writer }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${board.regdate }" /></td>
							<td><span class="badge">${board.hit }</span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

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
			<a href="boards/new" class="btn btn-primary btn-flat">글쓰기</a>
		</div>
		<div class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-6">
			<div class="form-group">
				<div class="input-group">
					<input type="text" class="form-control"> <span
						class="input-group-btn">
						<button class="btn btn-info btn-flat" type="button">검색</button>
					</span>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	var result = '${result}';

	if (result === 'success') {
		alert('작업이 성공적으로 진행되었습니다.');
	}
</script>

<jsp:include page="../include/footer.jsp"></jsp:include>
