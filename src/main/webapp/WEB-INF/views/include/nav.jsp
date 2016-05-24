<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">매치메이커</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">홈 <span class="sr-only">(current)</span></a></li>
				<li><a href="/matchmaker">소개</a></li>
				<li><a href="/boards">게시판</a></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input type="text" class="form-control" size="14">
				</div>
				<button type="submit" class="btn btn-success">검색</button>
			</form>
			<div class="navbar-form navbar-right">
				<button class="btn btn-primary">로그인</button>
				<a class="btn btn-warning" href="/users/register">회원가입</a>
			</div>
		</div>
	</div>
</nav>