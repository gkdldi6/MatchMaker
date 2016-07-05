<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"></jsp:include>



	<div id="bg">

		<!-- 로그인 폼 -->
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
				<a href="register.html" class="text-center">아이디를 잃어버렸어요.</a><br>
<!-- 				<a href="https://analytics.google.com/analytics/web/template?uid=RJ2O31JfQxau3Kh0lmKaRg"> -->
<!-- 					대시보드 연결테스트 </a> -->
			</div>
		</div>
		<!-- 로그인 폼 끝 -->



	</div>
<script type="text/javascript">
	var result = '${result}';

	if (result === 'joinSuccess') {
		alert('가입이 성공적으로 되었습니다.');
	}
</script>

<!-- 구글 통계 -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-80197055-1', 'auto');
  ga('send', 'pageview');

</script>

<jsp:include page="include/footer.jsp"></jsp:include>