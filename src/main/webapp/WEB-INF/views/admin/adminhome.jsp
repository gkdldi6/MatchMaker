<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="../include/header.jsp"></jsp:include>

<div id="bg">
	<!-- 로그인 폼 -->
	<div class="login-box">
		<div class="login-logo">
			<a href="/admin"><b>매치</b>메이커[AdminPage]</a>
		</div>

		<div class="login-box-body">

			<form action="/admin/loginPost" method="post">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="아이디" name="id">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="pw"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<!-- 					<div class="col-sm-4 col-sm-offset-2"> -->
					<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
					<!-- 					</div> -->
				</div>
			</form>
			<br>
		</div>
	</div>
	<!-- 로그인 폼 끝 -->
</div>