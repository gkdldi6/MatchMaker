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
		<form class="form-horizontal" action="send" method="post" onsubmit="MessageSend()">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">쪽지 쓰기</legend>
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">보내는 아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="sender" value = "${login.userid}"
							placeholder="작성자를 입력해주세요." name="sender" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">받는 아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="targetid"
							placeholder="작성자를 입력해주세요." name="targetid">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control textarea" rows="14" id="message" 
								placeholder="내용을 입력해주세요." name="message" style="resize:none"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary btn-flat">보내기</button>
						<a href="/boards" class="btn btn-default btn-flat">취소</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
<body>
</body>
<script type="text/javascript">
	
	function MessageSend() {
		var sender = $("#sender").val();
		var targetid = $("#targetid").val();
		var message = $("#message").val();
		$.ajax({
			type : "POST",
			url : "/messages/send",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json",
				//"X-HTTP-Method-Override" : "POST"
			},
			dataType : "document",
			data: JSON.stringify({
				"sender" : sender,
				"targetid" : targetid,
				"message" : message
			}),
		});
	};
</script>
</html>