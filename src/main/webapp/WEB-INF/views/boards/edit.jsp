<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>

<style>
.container {
	padding-top: 30px;
}
</style>
	
	<div class="container">
		<form class="form-horizontal" action="/boards/edit" method="post">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">글쓰기</legend>
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="writer" value="${article.writer }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="${article.title }" name="title">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control textarea" rows="14" id="textArea" 
								name="content" style="resize:none">${article.content }</textarea>
					</div>
				</div>

				<input type="hidden" name="bno" value="${article.bno }">
				<input type='hidden' name='page' value="${cri.page}">
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-primary btn-flat">수정</button>
						<a class="btn btn-default btn-flat" onclick="history.go(-1)">취소</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>


<jsp:include page="../include/footer.jsp"></jsp:include>
