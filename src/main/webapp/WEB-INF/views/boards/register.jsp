<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<link href="/resources/plugins/editor/editor.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugins/editor/editor.js"></script>

<style>
.container {
	padding-top: 30px;
}
</style>
	
	<!-- 글쓰기 -->
	<div class="container">
		<form class="form-horizontal" action="new" method="post">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">글쓰기</legend>
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="작성자를 입력해주세요." name="writer">
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="제목을 입력해주세요." name="title">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control textarea" rows="14" id="textArea" 
								placeholder="내용을 입력해주세요." name="content" style="resize:none"></textarea>
						<!-- <div id="txtEditor" name="content"></div> -->
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary btn-flat">작성</button>
						<a href="/boards" class="btn btn-default btn-flat">취소</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>


<!-- 에디터로 작성 -->
<!-- <script type="text/javascript">
	$('.textarea').wysihtml5();
	$("#txtEditor").Editor();
</script> -->


<jsp:include page="../include/footer.jsp"></jsp:include>
