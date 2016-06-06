<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../include/header.jsp"></jsp:include>
<!-- <link href='/resources/css/loginForm.css' rel='stylesheet'
	type='text/css'>
<style type="text/css">
#bg {
	background-image: url('/resources/img/bg.jpg');
	background-repeat: no-repeat;
	background-position: left top;
	height: 755px;
}
</style> -->
</head>
<body>
	<jsp:include page="../include/nav.jsp"></jsp:include>
	<div id="bg">

		<!-- 로그인 폼 -->
		<div class="login-box">
			<div class="login-logo">
				<a href="/"><b>매치</b>메이커</a>
			</div>

			<div class="login-box-body">

				<form action="/users/loginPost" method="post">
					<div class="form-group has-feedback">
						<input type="email" name="userid" class="form-control"
							placeholder="아이디"> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" name="userpw" class="form-control"
							placeholder="비밀번호"> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-2">
							<button type="submit" class="btn btn-primary btn-block btn-flat"
								href="/users/login">로그인</button>
						</div>
						<div class="col-sm-4">
							<a class="btn btn-default btn-block btn-flat" href="/users/join">가입하기</a>
						</div>
					</div>
				</form>

				<br> <a href="#">비밀번호를 잃어버렸어요.</a><br> <a
					href="register.html" class="text-center">아이디를 잃어버렸어요.</a>

			</div>
		</div>
		</form>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>	
</body>
<script type="text/javascript">
	var result = '${result}';

	if (result === 'fail') {
		alert('아이디 또는 비밀번호가 틀렸습니다.');
	}
</script>

</html>