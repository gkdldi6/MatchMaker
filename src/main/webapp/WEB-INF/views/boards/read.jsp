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
						<input type="text" class="form-control" value="${article.bno }" name="bno">
					</div>
				</div>

				<div class="form-group">
					<label for="writer" class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.writer }" name="writer">
					</div>
				</div>

				<div class="form-group">
					<label for="title" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.title }" name="title">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control" rows="7" id="textArea" name="content">${article.content }</textarea>
					</div>
				</div>

				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">작성
						날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" 
								value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${article.regdate }" />" readonly>
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

	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		$('#delete').click(function () {
			$('form').attr('action', 'delete');
		});
	</script>
</body>
</html>