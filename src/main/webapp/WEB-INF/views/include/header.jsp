<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    
    <!-- 내가 만든 css -->
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css" />    
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
<body class="skin-black-light layout-top-nav fixed">

	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<a href="/" class="navbar-brand"><b>매치</b>메이커</a>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar-collapse">
							<i class="fa fa-bars"></i>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							
							<li class="active"><a href="/">홈 <span
									class="sr-only">(current)</span></a></li>
							
							<li><a href="/matchmaker">소개</a></li>
							
							<li><a href="/courts">코트 찾기</a></li>
							
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown">게시판 <span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="/boards/0">공지게시판</a></li>
                                    <li class="divider"></li>
									<li><a href="/boards/1">자유게시판</a></li>
									<li><a href="/boards/2">농구게시판</a></li>
									<li><a href="/boards/3">게임게시판</a></li>
									<li class="divider"></li>
									<li><a href="/boards/100">자료게시판</a></li>
								</ul>
							</li>
							
						</ul>
<!-- 						<form class="navbar-form navbar-left" role="search"> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input type="text" class="form-control" id="navbar-search-input" placeholder="게임을 검색하세요."> -->
<!-- 							</div> -->
<!-- 						</form> -->
						
						<div class="navbar-form navbar-right">
							<a href="/users/update">${userid}</a>
							<a href=# onClick="window.open('messages',
								'new','resizable=no,scrollbars=no,width=800,height=600'); return false"> ${count} </a>
							<a href="/users/logout">${logout}</a>
							<button class="btn btn-default btn-flat">로그인</button>
							<a class="btn btn-info btn-flat" href="/users/join">회원가입</a>
						</div>
			
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>
	</div>
</body>
		


		