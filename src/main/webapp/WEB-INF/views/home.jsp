<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"></jsp:include>
<style>
body {
	overflow-y: hidden;
}

.login-box-body2 {
	background-color:transparent;
	margin-top:50px;
}

@media screen and (min-height: 350px){
	.login-box-body2 {
		margin-top:100px;
	}
} 

@media screen and (min-height: 400px){
	.login-box-body2 {
		margin-top:150px;
	}
} 

@media screen and (min-height: 450px){
	.login-box-body2 {
		margin-top:200px;
	}
} 

@media screen and (min-height: 500px){
	.login-box-body2 {
		margin-top:250px;
	}
} 

@media screen and (min-height: 550px) {
	.login-box-body2 {
		margin-top:300px;
	}
} 

@media screen and (min-height: 600px) {
	.login-box-body2 {
		margin-top:350px;
	}
} 

@media screen and (min-height: 650px) {
	.login-box-body2 {
		margin-top:400px;
	}
} 

@media screen and (min-height: 700px) {
	.login-box-body2 {
		margin-top:450px;
	}
} 

@media screen and (min-height: 750px) {
	.login-box-body2 {
		margin-top:500px;
	}
} 

@media screen and (min-height: 800px) {
	.login-box-body2 {
		margin-top:550px;
	}
} 

@media screen and (min-height: 850px) {
	.login-box-body2 {
		margin-top:600px;
	}
}

@media screen and (min-height: 900px) {
	.login-box-body2 {
		margin-top:650px;
	}
}  
</style>

	<div id="bg">

		<div class="login-box">
			<div class="login-logo">
			</div>
		
			<div class="login-box-body2" style="/* background-color:transparent;margin-top:550px; */">
				<div class="row">
					<div class="col-xs-12" style="padding-bottom:10px">
						<a class="btn btn-danger btn-block btn-flat" href="/map">바로 시작하기</a>
					</div>
					<div class="col-xs-12">
						<a class="btn btn-default btn-block btn-flat" href="/matchmaker">처음이세요?</a>
					</div>
				</div>
			</div>
		</div>

	</div>
	
<script type="text/javascript">
	var result = '${result}';
	console.log(result);

	if (result === 'joinSuccess') {
		alert('가입이 성공적으로 되었습니다.');
	} else if (result == 'deletesuccess'){
		alert('회원탈퇴가 되었습니다.');
	} else if (result == 'logout'){
		alert('로그아웃되었습니다.');
	}
</script>


<jsp:include page="include/footer.jsp"></jsp:include>