<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.custom.css" rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- JQuery -->
<script src="/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<title>매치메이커</title>
<style>
html, .login-page {
	background-color: #d2d6de;
}
</style>
</head>
<body>
	
	<div class="login-page">
		<div class="login-box">
			<div class="login-logo">
				<a href="/"><b>매치</b>메이커</a>
			</div>
		
			<div class="login-box-body">

				<form action="/users/loginPost" method="post">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" placeholder="아이디" name="userid">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" placeholder="비밀번호" name="userpw">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-2">
							<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<div class="col-sm-4">
							<a class="btn btn-default btn-block btn-flat" href="/users/join">가입하기</a>
						</div>
					</div>
				</form>
				
				<br>
				<a href="#">비밀번호를 잃어버렸어요.</a><br> 
				<a href="register.html" class="text-center">아이디를 잃어버렸어요.</a>

			</div>
		</div>
	</div>
	
<!-- <<<<<<< HEAD -->
<!-- 	<!-- Bootstrap 3.3.2 JS --> -->
<!-- 	<script src="/resources/bootstrap/js/bootstrap.min.js" -->
<!-- 		type="text/javascript"></script> -->
<!-- 	<!-- AdminLTE App --> -->
<!-- 	<script src="/resources/dist/js/app.min.js" type="text/javascript"></script> -->
<!-- 	<!-- AdminLTE for demo purposes --> -->
<!-- 	<script src="/resources/dist/js/demo.js" type="text/javascript"></script> -->
<!-- </body> -->
<!-- </html> -->
<!-- ======= -->
	
<script type="text/javascript">
	var result = '${result}';

	if (result === 'joinSuccess') {
		alert('가입에 성공했습니다.');
	} else if(result =='success') {
		alert('로그인에 성공했습니다.');
	} else if(result == 'fail') {
		alert('로그인에 실패했습니다.');
	} else if (result == 'updatesuccess'){
		alert('수정에 성공 했습니다.');
	}
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>