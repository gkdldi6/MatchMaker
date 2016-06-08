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
	<form action="join" method="post" name="form" class="form-horizontal">
		<fieldset>

			<legend>회원 가입</legend>

			<div class="form-group">
				<label for="inputId" class="col-lg-2 control-label">아이디</label>
				<div class="col-lg-8">
					<input type="text" name="userid" class="form-control" id="userid"
						placeholder="아이디를 입력해주세요." required></input>
					<div id="messageidfail" style="color: #ff0000"></div>
					<div id="messageidsucess" style="color: #0000ff"></div>
				</div>
				<div class="col-lg-2">
					<a id="idcheck" class="btn btn-primary btn-flat">중복확인</a>
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
					<div id="messagepwsucess" style="color: #0000ff"></div>
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
				<div class="col-lg-10">
					<input type="email" name="email" class="form-control" id="email"
						placeholder="이메일을 입력해주세요. ex)test@test.test" required> 
				</div>
			</div>

			<div class="form-group">
				<label for="inputName" class="col-lg-2 control-label">이름</label>
				<div class="col-lg-10">
					<input type="text" name="username" class="form-control"
						id="username" placeholder="이름을 입력해주세요." required>
				</div>
			</div>

			<div class="form-group">
				<label for="inputAge" class="col-lg-2 control-label">나이</label>
				<div class="col-lg-10">
					<input type="number" name="userage" class="form-control"
						id="userage" placeholder="나이를 입력해주세요." required>
				</div>
			</div>

			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">자기 소개</label>
				<div class="col-lg-10">
					<textarea class="form-control" name="userinfo" rows="3"
						id="userinfo" placeholder="자신을 소개하세요." style="resize: none"></textarea>
				</div>
			</div>

			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">자동 가입 방지</label>
				<div class="col-lg-10">
					<div id="recaptcha"></div>
					<input id="recaptchaCheck" type="button" value="Check" >
					<div id="chapchafail" style="color:#ff0000"></div>			
					<div id="chapchasucess" style="color:#0000ff"></div>
				</div>
			</div>
					
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-primary btn-flat" onclick="checkfield()">가입</button>  
					<a class="btn btn-default btn-flat" onclick="history.go(-1);">취소</a>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<script type="text/javascript">
	

	$('#idcheck').click(function() {
		$.ajax({
			url:'/users/join/idCheck',		
			type: 'POST',
			data:{"userid" : $('#userid').val()},
			success: function(data){
				if(data == "idCheckSuccess" && $('#userid').val() != ""){
					alert("사용 가능한 아이디 입니다.");
					document.getElementById("messageidfail").innerHTML = "";
					document.getElementById("messageidsucess").innerHTML = "사용가능한 아이디 입니다.";
				} else if(data =="idCheckFail"){
					alert('이미 사용중인 아이디 입니다.');
					document.getElementById("messageidsucess").innerHTML = "";
					document.getElementById("messageidfail").innerHTML = "이미 존재하는 아이디 입니다.";
					return false ;
				}
			}	
		});
	});
		
		
	function passwordCheck(){
		//var passwordCheck = "fail";
		if($('#userpw').val() != $('#userpwCheck').val()){
	 		alert("비밀번호가 서로 일치 하지 않습니다.");
	 		$('#userpw').focus();
	 		document.getElementById("messagepwsucess").innerHTML = "";
	 		document.getElementById("messagepwfail").innerHTML = "비밀번호가 일치 하지 않습니다.";
	 	
		}
		else{
			document.getElementById("messagepwfail").innerHTML = "";
			document.getElementById("messagepwsucess").innerHTML = "비밀번호가 일치 합니다.";
			
		}
	}

	
	/* function joinCheck(){
		alert("나가뒤져")
		return false
		
	} */
</script>
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
            url: "/users/test/validateRecaptcha",
            async: false,
            data: {
                host: host,
                challenge: challenge,
                response: response
            },
            success: function(data) {
                if(data == "Y") {
                	document.getElementById("chapchasucess").innerHTML = "인증 성공";
    		 		document.getElementById("chapchafail").innerHTML = "";
    		 	}
    			else{
    				document.getElementById("chapchasucess").innerHTML = "";
    		 		document.getElementById("chapchafail").innerHTML = "자동 가입 방지 코드가 일치 하지 않습니다.";
                    Recaptcha.reload();
                }
            }
        });
         
    });
         
}); 
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>
