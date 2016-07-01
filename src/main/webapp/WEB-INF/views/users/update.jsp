<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<style type="text/css">
.container {
	margin-top: 50px;
}
</style>

<!-- 회원 가입 -->
<div class="container">
	<form action=update method="post" name="form" class="form-horizontal" onsubmit="return joinCheck();">
		<fieldset>

			<legend>회원 수정</legend>

			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-10">
					<input type="text" name="userid" class="form-control" id="userid"
						value= "${login.userid}" readonly></input>
				</div>
			</div>

			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">현재 비밀번호</label>
				<div class="col-lg-10">
					<input type="password" name="currentuserpw" class="form-control"
						id="currentuserpw" placeholder="현재 비밀번호를 입력해주세요." 
						onblur="authCheck()" required>
					<div id="authcheckfail" style="color: #ff0000"></div>
					<div id="authchecksuccess" style="color: #0000ff"></div>
				</div>
			</div>


			<div class="form-group">
				<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
				<div class="col-lg-10">
					<input type="password" name="userpw" class="form-control"
						id="userpw" placeholder="비밀번호를 입력해주세요." required>
				</div>
			</div>

			<div class="form-group">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
					확인</label>
				<div class="col-lg-10">
					<input type="password" name="userpwCheck" class="form-control"
						id="userpwCheck" onblur="passwordCheck()"
						placeholder="비밀번호를 다시 입력해주세요." required>
					<div id="messagepwfail" style="color: #ff0000"></div>
					<div id="messagepwsuccess" style="color: #0000ff"></div>
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" name="email" class="form-control" id="email"
						value= "${login.email}" required> 
				</div>
			</div>

			<div class="form-group">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" name="username" class="form-control"
						id="username" value="${login.username}" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="inputAge" class="col-lg-2 control-label">나이</label>
				<div class="col-lg-10">
					<input type="number" name="userage" class="form-control"
						id="userage" placeholder="${login.userage}" value="${login.userage}" required>
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
				<label for="textArea" class="col-lg-2 control-label">자동 가입 방지</label>
				<div class="col-lg-10">
					<div id="recaptcha"></div>
					<input id="recaptchaCheck" type="button" value="Check" >
					<div id="capchafail" style="color:#ff0000"></div>			
					<div id="capchasuccess" style="color:#0000ff"></div>
				</div>
			</div>
					
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-primary btn-flat">수정</button>  
					<a class="btn btn-default btn-flat" onclick="history.go(-1);">취소</a>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="http://www.google.com/recaptcha/api/js/recaptcha_ajax.js"></script>
<script>

/* 캡챠 */
$(function(){
     
    var siteKey = "6Lf0DSITAAAAAPczYXzTJk0h4sgglsen_hixdmSW";//Site key
    var div = "recaptcha";
    Recaptcha.create(siteKey, div, {theme: "red"});
         
    $("#recaptchaCheck").click(function(){
         
        var challenge = Recaptcha.get_challenge();
        var response = Recaptcha.get_response();
        var host = $(location).attr('host');
         
        $.ajax({
            type: "POST",
            url: "/users/validateRecaptcha",
            async: false,
            data: {
                host: host,
                challenge: challenge,
                response: response
            },
            success: function(data) {
                if(data == "Y") {
                	document.getElementById("capchasuccess").innerHTML = "인증 성공";
    		 		document.getElementById("capchafail").innerHTML = "";
    		 	}
    			else{
    				document.getElementById("capchasuccess").innerHTML = "";
    		 		document.getElementById("capchafail").innerHTML = "자동 가입 방지 코드가 일치 하지 않습니다.";
                    Recaptcha.reload();
                }
            }
        });
    });
});
</script>
<script type="text/javascript">
 	function authCheck(){
 		$.ajax({
			url : '/users/update/authCheck',
			type : 'POST',
			data : {"userid" : $('#userid').val(),
				  "userpw" : $('#currentuserpw').val()},
			success : function(data){
				if(data == "authchecksuccess" && $('#currentuserpw').val() != ""){
					document.getElementById("authchecksuccess").innerHTML = "인증 성공";
    		 		document.getElementById("authcheckfail").innerHTML = "";
				}else{
					document.getElementById("authchecksuccess").innerHTML = "";
    		 		document.getElementById("authcheckfail").innerHTML = "인증 실패";
				}
			},
		});
 	};
 
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
		var capChasuccessField = $('#capchasuccess').text();
	 	if($('#recaptcha_response_field').val()=="" || capChasuccessField != "인증 성공"){
	 		alert("자동 방지 입력코드를 확인해 주세요");
	 		return false;
		}else{
			var authField = $('#authcheckfail').text();
			//아이디 체크
			if($('#userpw').val() != $('#userpwCheck').val()){
				alert("비밀번호가 서로 일치 하지 않습니다.");
				$('#userpw').focus();
					document.getElementById("messagepwsuccess").innerHTML = "";
					document.getElementById("messagepwfail").innerHTML = "비밀번호가 일치 하지 않습니다.";
					return false;
			}else{
				document.getElementById("messagepwfail").innerHTML = "";
				document.getElementById("messagepwsuccess").innerHTML = "비밀번호가 일치 합니다.";
				
				if(authField == "인증 실패"){
					alert("현재 비밀번호를 확인해주세요");
					return false;
				}else{
					return true;
				}
			}
		}
	}		
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
