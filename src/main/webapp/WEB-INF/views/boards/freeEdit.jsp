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
						<input type="text" class="form-control" name="writer" value="${article.writer }" readonly="readonly">
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
								name="content"></textarea>
					</div>
				</div>
				
				<input type="hidden" name="ano" value="${ano }">
				<input type="hidden" name="bno" value="${bno }">
				<input type='hidden' name='page' value="${cri.page}">
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button id="edit" class="btn btn-primary btn-flat">수정</button>
						<a class="btn btn-default btn-flat" onclick="history.go(-1)">취소</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>


<jsp:include page="../include/footer.jsp"></jsp:include>


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
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["textArea"].exec("PASTE_HTML",
						["${article.content }"]);
			},
			fCreator : "createSEditor2"
		});
	});
	
	$("#edit").click(function(){
		oEditors.getById["textArea"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#textArea").submit();
	})
</script>