<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style>
.container {
	padding-top: 30px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>

	<!-- 글읽기 폼 -->
	<div class="container">
		<form class="form-horizontal" action="edit" method="post">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">글읽기</legend>
				<div class="form-group">
					<label for="bno" class="col-lg-2 control-label">글번호</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.bno }"
							name="bno">
					</div>
				</div>

				<div class="form-group">
					<label for="writer" class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.writer }"
							name="writer">
					</div>
				</div>

				<div class="form-group">
					<label for="title" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.title }"
							name="title">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control" rows="7" id="textArea"
							name="content">${article.content }</textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">작성 날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${article.regdate }" />"
							readonly>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-warning">수정</button>
						<button type="submit" class="btn btn-primary" id="delete">삭제</button>
						<a href="/boards" class="btn btn-success">목록</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>

	<!-- 댓글 입력폼 -->
	<div style="background-color: #fcf8e3">
		<div class="container">
			<form class="form-horizontal">
				<fieldset>
					<legend class="col-lg-10 col-lg-offset-1">댓글</legend>
					<div class="form-group">
						<label for="writer" class="col-lg-2 control-label">작성자</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="replyer"
								placeholder="작성자를 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">내용</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="replytext"
								placeholder="댓글을 입력해주세요."></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<input type="button" class="btn btn-success" value="댓글 쓰기"
								id="new-reply">
						</div>
					</div>
				</fieldset>
			</form>

			<!-- 댓글 목록 -->
			<ul id="reply-list">
			</ul>

		</div>
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

	<!-- Modal -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" adata-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글 템플릿 -->
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<div class="col-lg-10 col-lg-offset-2">
		<div class="panel panel-warning each-reply">
  			<div class="panel-heading">
    			<h3 class="panel-title">{{replyer}}</h3>
  			</div>
  			<div class="panel-body">
   				<div>{{replytext}}</div>
				<div><br><input type="button" class="btn btn-warning btn-xs" value="수정"></div>
			</div>
		</div>
		</div>
		{{/each}}
	</script>

	<script type="text/javascript">
		/* 삭제 버튼으로 변경 */
		$('#delete').click(function() {
			$('form').attr('action', 'delete');
		});

		/* 댓글 처리 스크립트 */
		var bno = ${article.bno};

		/* 템플릿 날짜 */
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

		/* ajax로 받아온 댓글 목록들을 템플릿에 컴파일하는 함수 */
		var printData = function(replyArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());

			var html = template(replyArr);
			$(".each-reply").remove();
			target.after(html);
		}

		/* 댓글 목록 읽기 */
		$.getJSON('/replies/' + bno, function(data) {
			printData(data, $('#reply-list'), $('#template'));
			/* $("#modifyModal").modal('hide'); */
		});

		/* 댓글 쓰기 */
		$('#new-reply').click(function() {
			$.ajax({
				url : '/replies',
				type : 'post',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				data : JSON.stringify({
					bno : bno,
					replyer : $('#replyer').val(),
					replytext : $('#replytext').val()
				}),
				success : function(data) {
					if (data === 'success') {
						$('#replyer').val('');
						$('#replytext').val('');
						alert('댓글 등록에 성공했습니다.');
						$.getJSON('/replies/' + bno, function(data) {
							console.log(data);
							printData(data, $("#reply-list"), $('#template'));
						});
					} else {
						alert('댓글 등록에 실패했습니다.');
					}
				}
			});
		});

		/* 댓글 수정 */

		/* 댓글 삭제 */
	</script>
</body>
</html>