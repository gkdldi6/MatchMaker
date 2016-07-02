<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <style>
	.container {
		padding-top: 30px;
	}
	
	input[readonly] {
		border: 0px;
	}
	
	input:read-only, #textArea:read-only{ 
	    background-color: white !important;
	}
	
	#textArea {
		resize: none;
	}
	</style>
    <!-- 내가 만든 css -->
	<!-- <link href="/resources/css/style.css" rel="stylesheet" type="text/css" /> -->    
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
    
    <title>쪽지 읽기</title>
  </head>
<body>
	<div class="container">
		<div  class="form-horizontal">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">쪽지 읽기</legend>
				
				<form role="form" method="post">
					<input type="hidden" name="mno" value="${MessageVO.mno}">
				</form>

				<div class="form-group">
					<label for="writer" class="col-lg-2 control-label">보낸 사람</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${MessageVO.sender}"
							name="writer" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">작성 날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${MessageVO.senddate}" />"
							readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">처음 열어본 날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${MessageVO.opendate}" />"
							readonly>
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">메시지</label>
					<div class="col-lg-10">
						 <textarea class="form-control" rows="8" id="textArea"
						 		name="content" readonly>${MessageVO.message}</textarea>
					</div>
				</div>

				
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-primary btn-flat" id="delete">삭제</button>
						<button class="btn btn-success btn-flat" id="list">목록</button>
					</div>
				</div>
			</fieldset>
		</div>
	</div>


<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj = $("form[role='form']");
		
		$("#delete").on("click", function(){
			var yesorno=confirm("이 쪽지를 지우시겠습니까?");
			if(yesorno == true){
				formObj.attr("action", "/messages/remove");
				formObj.submit();
			}
		});
		
		$("#list").on("click", function(){
			self.location = "/messages"
		});
	});
</script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script	src="/resources/bootstrap/js/bootstrap.min.js"	type="text/javascript"></script>
<!-- FastClick -->
<script	src='/resources/plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js" type="text/javascript"></script>
</body>
</html>