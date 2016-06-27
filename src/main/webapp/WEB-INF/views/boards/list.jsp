<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<div class="content-wrapper">
	<div class="container">

		<div class="col-xs-12 col-sm-4">

			<div class="box box-solid">

				<div class="box-header with-border">

					<h3 class="box-title">최다 추천수</h3>

					<div class="box-tools">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->

				<div class="box-body no-padding" style="display: block;">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
					</ul>
				</div>

				<!-- /.box-body -->

			</div>

		</div>

		<div class="col-xs-12 col-sm-4">

			<div class="box box-solid">

				<div class="box-header with-border">

					<h3 class="box-title">최다 조회수</h3>

					<div class="box-tools">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->

				<div class="box-body no-padding" style="display: block;">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
					</ul>
				</div>

				<!-- /.box-body -->

			</div>

		</div>

		<div class="col-xs-12 col-sm-4">

			<div class="box box-solid">

				<div class="box-header with-border">

					<h3 class="box-title">최다 댓글수</h3>

					<div class="box-tools">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->

				<div class="box-body no-padding" style="display: block;">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
						<li><a href="#">기부 권유를 받을 때 어떠신...</a></li>
					</ul>
				</div>

				<!-- /.box-body -->

			</div>

		</div>


		<div class="col-xs-12 col-sm-12">

			<div class="box box-primary">

				<div class="box-header with-border">
					<h3 class="box-title">게시판</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body no-padding">
					<div class="mailbox-controls">
						<!-- Check all button -->
						<button class="btn btn-flat btn-primary btn-sm">ex</button>
						<div class="btn-group">
							<button class="btn btn-flat btn-primary btn-sm">ex</button>
							<button class="btn btn-flat btn-primary btn-sm">ex</button>
							<button class="btn btn-flat btn-primary btn-sm">ex</button>
						</div>
						<!-- /.btn-group -->
						<button class="btn btn-flat btn-primary btn-sm">ex</button>
						<div class="pull-right">
							<div class="btn-group">
								<button class="btn btn-flat btn-primary btn-sm">ex</button>
								<button class="btn btn-flat btn-primary btn-sm">ex</button>
							</div>
							<!-- /.btn-group -->
						</div>
						<!-- /.pull-right -->
					</div>
					<div class="table-responsive mailbox-messages">
						<table class="table table-hover table-striped">
							<thead>
								<tr>
									<th width="10%">글번호</th>
									<th width="50%">제목</th>
									<th width="10%">작성자</th>
									<th width="10%">날짜</th>
									<th width="10%">조회수</th>
									<th width="10%">추천수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="article">
									<tr>
										<td>${article.ano }</td>
										<td class="title">
											<a href='/boards/${article.bno}/${article.ano}${pageMaker.makeSearch(pageMaker.cri.page)}'>
												${article.title }</a><span class="badge">${article.replycnt}</span>
										</td>
										<td>${article.writer }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
												value="${article.regdate }" /></td>
										<td><span class="badge">${article.hit }</span></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<!-- /.table -->
					</div>
					<!-- /.mail-box-messages -->
				</div>
				<!-- /.box-body -->
				<!-- 페이지 -->
				<div align="center">
					<ul class="pagination">

						<c:if test="${pageMaker.prev }">
							<li><a
								href="boards${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="boards${pageMaker.makeSearch(idx)}">${idx}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="boards${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
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
		</div>
	</div>
</div>

<script type="text/javascript">
	var result = '${result}';

	if (result === 'success') {
		alert('작업이 성공적으로 진행되었습니다.');
	}else if(result ==='loginSuccess'){
		alert('로그인이 성공적으로 되었습니다.');
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





