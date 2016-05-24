<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/head.jsp"></jsp:include>
<style type="text/css">
	.container {
		margin-top: 50px;
	}
</style>
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>

	<!-- 회원 가입 -->
	<div class="container">
		<form class="form-horizontal">
			<fieldset>

				<legend>회원 가입</legend>

				<div class="form-group">
					<label for="inputId" class="col-lg-2 control-label">아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="inputId"
							placeholder="아이디를 입력해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
					<div class="col-lg-10">
						<input type="password" class="form-control" id="inputPassword"
							placeholder="비밀번호를 입력해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
						확인</label>
					<div class="col-lg-10">
						<input type="password" class="form-control"
							id="inputPasswordCheck" placeholder="비밀번호를 다시 입력해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="inputEmail"
							placeholder="이메일을 입력해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="inputName"
							placeholder="이름을 입력해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label for="inputAge" class="col-lg-2 control-label">나이</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="inputAge"
							placeholder="나이를 입력해주세요.">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">자기 소개</label>
					<div class="col-lg-10">
						<textarea class="form-control" rows="3" id="textArea"
							placeholder="자신을 소개하세요."></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary">가입</button>
						<button class="btn btn-default" onclick="history.go(-1);">취소</button>
					</div>
				</div>

			</fieldset>
		</form>
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>