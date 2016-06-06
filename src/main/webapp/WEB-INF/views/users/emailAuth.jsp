<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function check(){
		var form = document.authenform;
		var authNum = ${authNum};
		
		if(!form.authnumvalue){
			alert("인증번호를 입력하세요");
			return false;
		}
		if(form.authnum.value!=authNum){
			alert("틀린 인증 번호입니다. 인증번호를 다시 입력해 주세요");
			form.authnum.value="";
			return false;
		}
		if(form.authnum.value==authNum){
			alert("인증완료");
// 			opener.document.userinput.mailCheck.value = "인증완료";
			self.close();
		}
	}
</script>

<center>
	<br/><br/>
	<h5>인증 번호 7자리를 입력하세요</h5>
	<div class="container">
		<form method="post" name="authenform" onSubmit="return check();">
			<input type="text" name="authnum"><br/><br/>
			<input type="submit" value="Submit">
		</form>
	</div>
</center>

</body>
</html>