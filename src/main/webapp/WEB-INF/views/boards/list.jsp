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
tbody tr:hover {
	background-color: #00c0ef;
	color: white;
}
.title:hover {
	text-decoration: underline;
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
			<table class="table">
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
						<tr>
							<td>${board.bno }</td>
<%-- 							<td><a href='/boards/${board.bno}${pageMaker.makeSearch(pageMaker.cri.page)}'> --%>
<%-- 							${board.title }</a></td> --%>

							<td class="title" onclick="location.href='/boards/' + '${board.bno}' + '${pageMaker.makeSearch(pageMaker.cri.page)}'">${board.title }</td>						
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

			<c:if test="${pageMaker.prev }">
				<li><a href="boards${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="boards${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="boards${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
			</c:if>

		</ul>
	</div>

	<!-- 글쓰기, 검색 버튼 -->
	<div class="row">
		<div class="col-xs-3">
			<a href="boards/new" class="btn btn-primary btn-flat">글쓰기</a>
		</div>
		<div class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-6">
			
				<select id="searchType" name="searchType">
					<option value="tcw"
						<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
						전체</option>
					<%-- <option value="n"
							<c:out value="${criteria.searchType == null?'selected':''}"/>>
							없음</option> --%>
					<option value="t"
						<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
						제목</option>
					<option value="c"
						<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
						내용</option>
					<option value="w"
						<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
						작성자</option>
					<option value="tc"
						<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
						제목 및 내용</option>
					<option value="cw"
						<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
						내용 및 작성자</option>
				</select>
			
			<div class="form-group">
				<div class="input-group">
					<input type="text" class="form-control" id="keywordInput">
						<span class="input-group-btn">
							<button id="search" class="btn btn-info btn-flat" type="button">검색</button>
						</span>
				</div>
			</div>
		</div>
	</div>

</div>

<script type="text/javascript">
	var result = '${result}';

	if (result == 'success') {
		alert('작업이 처리되었습니다.');
	}
</script>
<script type="text/javascript">
$(document).ready(function() {
	
	/* 검색 버튼 클릭 */
	$('#search').on("click", function(event) {
		
		self.location = "boards"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("#searchType option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
						
	});
});
</script>

<jsp:include page="../include/footer.jsp"></jsp:include>
