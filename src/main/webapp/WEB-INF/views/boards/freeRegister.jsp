<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>

<style>
.container {
	padding-top: 30px;
}
</style>


<!-- 글쓰기 -->
<div class="container">
	<form class="form-horizontal" action="new" method="post">
		<fieldset>
			<input type="hidden" name="article_type" value="F">
			<legend class="col-lg-10 col-lg-offset-1">글쓰기</legend>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">작성자</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="writer" value="${login.username }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">제목</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="inputEmail" name="title">
				</div>
			</div>

			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">내용</label>
				<div class="col-lg-10">
					<textarea class="form-control textarea" rows="14" id="textArea" name="content"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button id="write" class="btn btn-primary btn-flat">작성</button>
					<a href="/boards/${bno }" class="btn btn-default btn-flat">취소</a>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<!-- 끌 쓰기 끝 -->

<script type="text/javascript" src="/resources/plugins/editor/js/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "textArea",
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/resources/plugins/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
		});
	});
	
	$("#write").click(function(){
		oEditors.getById["textArea"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#textArea").submit();
	})
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>
