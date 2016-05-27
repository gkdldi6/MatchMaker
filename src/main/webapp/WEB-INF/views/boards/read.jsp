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
	<div style="background-color:#fcf8e3">
		<div class="container">
			<form class="form-horizontal">
				<fieldset>
					<legend class="col-lg-10 col-lg-offset-1">댓글</legend>
					<div class="form-group">
						<label for="writer" class="col-lg-2 control-label">작성자</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="writer"
								placeholder="작성자를 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">내용</label>
						<div class="col-lg-10">
							<textarea class="form-control" rows="3" id="content"
								placeholder="댓글을 입력해주세요."></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<button type="submit" class="btn btn-success">댓글 쓰기</button>
						</div>
					</div>
				</fieldset>
			</form>

			<!-- 댓글 목록 -->
			<ul class="reply-list">
			</ul>

		</div>
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

	<!-- 댓글 템플릿 -->
	<script id="template" type="text/x-handlebars-template">
{{#each .}}
<div class="panel panel-warning">
  <div class="panel-heading">
    <h3 class="panel-title">${reply.title}</h3>
  </div>
  <div class="panel-body">
    ${reply.content}
  </div>
</div>
{{/each}}
</script>

	<script type="text/javascript">
		$('#delete').click(function() {
			$('form').attr('action', 'delete');
		});

		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			return year + "/" + month + "/" + date;
		});

		var printData = function(replyArr, target, templateObject) {
			var template = Handlebars.compile(templateObject.html());

			var html = template(replyArr);
			$(".reply-list").remove();
			target.after(html);
		}

		$.getJSON

		function getPage(uri) {

			$.getJSON(uri, function(data) {
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $(".pagination"));

				$("#modifyModal").modal('hide');

			});
		}
	</script>
</body>
</html>