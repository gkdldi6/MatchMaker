<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"></jsp:include>


	<div id="bg">

		<div class="login-box">
			<div class="login-logo">
			</div>
		
			<div class="login-box-body" style="background-color:transparent; margin-top:550px;">
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