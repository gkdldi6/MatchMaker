<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<div class="content-wrapper">
	<!-- 회원 가입 -->
	<div class="container">
		<form action=update method="post" name="form" class="form-horizontal" onsubmit="return joinCheck();">
			<fieldset>
	
				<legend>내 정보</legend>
				
				<div class="form-group">
					<label for="inputId" class="col-lg-2 control-label">아이디</label>
					<div class="col-lg-10">
						<input type="text" name="userid" class="form-control" id="userid"
							value= "${login.userid}" readonly></input>
					</div>
				</div>
	
				<div class="form-group">
					<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
					<div class="col-lg-10">
						<input type="password" name="userpw" class="form-control"
							id="userpw" placeholder="변경할 비밀번호를 입력해주세요." required>
					</div>
				</div>
	
				<div class="form-group">
					<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
						확인</label>
					<div class="col-lg-10">
						<input type="password" name="userpwCheck" class="form-control"
							id="userpwCheck" onblur="passwordCheck()"
							placeholder="변경할 비밀번호를 다시 입력해주세요." required>
						<div id="messagepwfail" style="color: #ff0000"></div>
						<div id="messagepwsuccess" style="color: #0000ff"></div>
					</div>
				</div>
	
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="email" name="email" class="form-control" id="email"
							value= "${login.email}"> 
					</div>
				</div>
	
				<div class="form-group">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-10">
						<input type="text" name="username" class="form-control"
							id="username" value="${login.username}">
					</div>
				</div>
	
				<div class="form-group">
					<label for="inputAge" class="col-lg-2 control-label">나이</label>
					<div class="col-lg-10">
						<input type="number" name="userage" class="form-control"
							id="userage" value="${login.userage}">
					</div>
				</div>
	
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">자기 소개</label>
					<div class="col-lg-10">
						<textarea class="form-control" name="userinfo" rows="3"
							id="userinfo" style="resize: none">${login.userinfo}</textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-warning btn-flat">수정</button>  
						<a id="delete" class="btn btn-danger btn-flat">탈퇴</a>
					</div>
				</div>
	
			</fieldset>
		</form>
	</div>
</div>
<script>
	$('#delete').click(function() {
		$('form').attr('action', 'delete');
		$('form').submit();
	});

	function passwordCheck(){
		if($('#userpw').val() != $('#userpwCheck').val()){
	 		alert("비밀번호가 서로 일치 하지 않습니다.");
	 		$('#userpw').focus();
	 		document.getElementById("messagepwsuccess").innerHTML = "";
	 		document.getElementById("messagepwfail").innerHTML = "비밀번호가 일치 하지 않습니다.";
	 		return false;
		}
		else{
			document.getElementById("messagepwfail").innerHTML = "";
			document.getElementById("messagepwsuccess").innerHTML = "비밀번호가 일치 합니다.";
			return true;
		}
	}
	
	function joinCheck(){
		if($('#userpw').val() != $('#userpwCheck').val()){
			alert("비밀번호가 서로 일치 하지 않습니다.");
			$('#userpw').focus();
				document.getElementById("messagepwsuccess").innerHTML = "";
				document.getElementById("messagepwfail").innerHTML = "비밀번호가 일치 하지 않습니다.";
				return false;
		}
	}
</script>
	
	
<jsp:include page="../include/footer.jsp"></jsp:include>