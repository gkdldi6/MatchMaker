<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<style type="text/css">
.container {
	margin-top: 50px;
}
</style>

<!-- 회원 가입 -->
<div class="container">
	<form action="join" method="post" name="form" class="form-horizontal">
		<fieldset>

			<legend>회원 가입</legend>

			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" name="userid" class="form-control" id="userid" 
						placeholder="아이디를 입력해주세요."> <input type="button"
						id="idcheck" value="아이디 체크" />
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" name="userpw" class="form-control"
						id="userpw" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>

			<div class="form-group">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
					확인</label>
				<div class="col-lg-10">
					<input type="password" name="userpwCheck" class="form-control"
						id="userpwCheck" onblur="passwordCheck()"placeholder="비밀번호를 다시 입력해주세요.">
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" name="email" class="form-control" id="email"
						placeholder="이메일을 입력해주세요.">
					<a >이메일 인증</a>
				</div>
			</div>

			<div class="form-group">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" name="username" class="form-control"
						id="username" placeholder="이름을 입력해주세요.">
				</div>
			</div>

			<div class="form-group">
				<label for="inputAge" class="col-lg-2 control-label">나이</label>
				<div class="col-lg-10">
					<input type="number" name="userage" class="form-control"
						id="userage" placeholder="나이를 입력해주세요.">
				</div>
			</div>

			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">자기 소개</label>
				<div class="col-lg-10">
					<textarea class="form-control" name="userinfo" rows="3"
						id="userinfo" placeholder="자신을 소개하세요."></textarea>
				</div>
			</div>

			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" onblur="checkID()" class="btn btn-primary btn-flat">가입</button>
					<a class="btn btn-default btn-flat" onclick="history.go(-1);">취소</a>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<script type="text/javascript">

	$('#idcheck').click(function() {
		alert($('#userid').val());
 		$.ajax({
			url:'/users/join/idCheck',		
			type: 'POST',
			data:{"userid" :$('#userid').val()},
			success: function(data){
				alert(data);
				if(data ==="idCheckSuccess"){
					alert("아이디 사용O");
				} else {
					alert("아이디 사용X");
				}
 				alert(data);
			},
			error: function(){
				alert("망함");
			}
		});
	});
	
	function checkID(){
		 if($('#userid').val() == ""){
		 	alert("아이디를 입력해 주세요.");
		 	$('#userid').focus();
		}
	}
	
	function passwordCheck(){
		if($('#userpw').val() == ""){
		 	alert("비밀번호를 입력해 주세요.");
		 	
		 	$('#userpw').focus();
		}
		if($('#userpw').val() != $('#userpwCheck').val()){
	 		alert("비밀번호가 서로 일치 하지 않습니다.");
	 		$('#userpw').focus();
	 	}
		 	
	}
</script>



<jsp:include page="../include/footer.jsp"></jsp:include>
