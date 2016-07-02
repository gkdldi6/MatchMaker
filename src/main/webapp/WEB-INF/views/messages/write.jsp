<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <style>
	.container {
		padding-top: 30px;
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
    
    <title>매치메이커</title>
  </head>
<body>
	
	
	<!-- 글쓰기 -->
	<div class="container">
		<form class="form-horizontal" action="send" method="post">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">쪽지 쓰기</legend>
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">보내는 아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="sender" value = "${login.userid}"
							placeholder="작성자를 입력해주세요." name="sender" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">받는 아이디</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" id="targetid"
							placeholder="작성자를 입력해주세요." name="targetid">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control textarea" rows="12" id="message" 
								placeholder="내용을 입력해주세요." name="message" style="resize:none"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-primary btn-flat">보내기</button>
						<a href="/messages" class="btn btn-default btn-flat">취소</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
</body>
</html>