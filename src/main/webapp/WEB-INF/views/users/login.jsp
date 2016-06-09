<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


	<div id="bg">

		<!-- 로그인 폼 -->
		<div class="login-box">
			<div class="login-logo">
				<a href="/"><b>매치</b>메이커</a>
			</div>
		
			<div class="login-box-body">

				<form action="/users/loginPost" method="post">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" name="userid" placeholder="아이디">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="userpw" placeholder="비밀번호">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-2">
							<button type="submit" class ="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<div class="col-sm-4">
							<a class="btn btn-default btn-block btn-flat" href="/users/join">가입하기</a>
						</div>
					</div>
				</form>
				
				<br>
				<a href="">비밀번호를 잃어버렸어요.</a><br> 
				<a href="" class="text-center">아이디를 잃어버렸어요.</a>

			</div>
		</div>
		<!-- 로그인 폼 끝 -->

	</div>
	
	
<script type="text/javascript">
	var result = '${result}';

	if (result === 'joinSuccess') {
		alert('가입에 성공했습니다.');
	} else if(result =='success') {
		alert('로그인에 성공했습니다.');
	} else if(result == 'fail') {
		alert('로그인에 실패했습니다.');
	}
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>