<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<html>
<head>
<title>Insert title here</title>
</head>
<style>
.container {
	padding-top: 30px;
}

input[readonly] {
	border: 0px;
}

input:read-only, #textArea:read-only{ 
    background-color: white !important;
}

#textArea {
	resize: none;
}
</style>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<body>
	<div class="container">
		<div  class="form-horizontal">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">쪽지 읽기</legend>
				
				<form role="form" method="post">
					<input type="hidden" name="mno" value="${MessageVO.mno}">
				</form>

				<div class="form-group">
					<label for="writer" class="col-lg-2 control-label">보낸 사람</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${MessageVO.sender}"
							name="writer" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">작성 날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${MessageVO.senddate}" />"
							readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">처음 열어본 날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${MessageVO.opendate}" />"
							readonly>
					</div>
				</div>

				<!--
				<div class="form-group">
					<label for="title" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.title }"
							name="title" readonly>
					</div>
				</div> -->

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">메시지</label>
					<div class="col-lg-10">
						 <textarea class="form-control" rows="7" id="textArea"
						 		name="content" readonly>${MessageVO.message}</textarea>
					</div>
				</div>

				
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-primary btn-flat" id="delete">삭제</button>
						<button class="btn btn-success btn-flat" id="list">목록</button>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		$("#delete").on("click", function(){
			formObj.attr("action", "/messages/remove");
			formObj.submit();
		});
		
		$("#list").on("click", function(){
			self.location = "/messages"
		});
	});
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>