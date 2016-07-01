<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 폼 -->

<div class="login-box">

	<div class="login-box-body">

		<form action="/users/loginPost" method="post">
			<div class="form-group has-feedback">
				<input type="text" class="form-control" name="userid"
					placeholder="아이디"> <span
					class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group has-feedback">
				<input type="password" class="form-control" name="userpw"
					placeholder="비밀번호"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
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
	</div>
</div>