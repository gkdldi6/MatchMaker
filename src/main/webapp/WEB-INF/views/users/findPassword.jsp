<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <!-- 내가 만든 css -->
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />    
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

    <script src="/resources/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    
    <title>매치메이커</title>
  </head>s


<style type="text/css">
.container {
	margin-top: 50px;
}
</style>

<!-- 회원 가입 -->
<div class="container">
	<form name="form" class="form-horizontal">
		<fieldset>

			<legend>비밀번호 수정</legend>

			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" name="username" class="form-control" id="username"
						placeholder="아이디를 입력해주세요."  required></input>
				</div>
			</div>

			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" name="userid" class="form-control" id="userid"
						placeholder="아이디를 입력해주세요."  required></input>
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" name="email" class="form-control" id="email"
						placeholder="이메일을 입력해주세요."  required> 
				</div>
			</div>
								
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<a id ="auth" class="btn btn-primary btn-flat">인증</a>  
					<a class="btn btn-default btn-flat" onclick="history.go(-1);">취소</a>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<script type="text/javascript">
	
	$('#auth').click(function () {
		var username = $('#username').val();
		var userid = $('#userid').val();
		var email = $('#email').val();
		
		$.ajax({
	            type: "POST",
	            url: "/users/findPassword/auth",
	            data: {
	                username : username,
	                userid : userid,
	                email: email
	            },
	            success: function(data) {
	                if(data == "fail") {
						alert("일치하는 회원 정보가 없습니다.");
	                }
	    			else if(data == "success"){
	                	alert("임시비밀번호를 이메일에 전송 하였습니다.");
	    			}
	                alert(data);
	            }
	        });
	});
</script>
