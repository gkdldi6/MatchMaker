<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
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
							
							<li><a href="/map">코트 찾기</a></li>
							
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
						
						<!-- 로그인 했을때 -->
						<c:if test="${!empty login }">	
							<div class="navbar-custom-menu">
						      <ul class="nav navbar-nav">
						        <!-- Messages: style can be found in dropdown.less-->
						        <li class="dropdown messages-menu">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						            <i class="fa fa-envelope-o"></i>
						            <span class="label label-success">4</span>
						          </a>
						          <ul class="dropdown-menu">
						            <li class="header">You have 4 messages</li>
						            <li>
						              <!-- inner menu: contains the actual data -->
						              <ul class="menu">
						                <li><!-- start message -->
						                  <a href="#">
						                    <div class="pull-left">
						                      <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
						                    </div>
						                    <h4>
						                      Sender Name
						                      <small><i class="fa fa-clock-o"></i> 5 mins</small>
						                    </h4>
						                    <p>Message Excerpt</p>
						                  </a>
						                </li><!-- end message -->
						                	<!-- 메시지들 -->
						              </ul>
						            </li>
						            <li class="footer"><a onClick="window.open('/messages', 'new', 'width=850, height=660'); return false">모든 쪽지 보기</a></li>
						          </ul>
						        </li>
						        <!-- Notifications: style can be found in dropdown.less -->
						        <li class="dropdown notifications-menu">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						            <i class="fa fa-bell-o"></i>
						            <span class="label label-warning">10</span>
						          </a>
						          <ul class="dropdown-menu">
						            <li class="header">You have 10 notifications</li>
						            <li>
						              <!-- inner menu: contains the actual data -->
						              <ul class="menu">
						                <li>
						                  <a href="#">
						                    <i class="ion ion-ios-people info"></i> Notification title
						                  </a>
						                </li>
						                	<!-- 예약된 게임 목록 -->
						              </ul>
						            </li>
						            <li class="footer"><a href="#">모든 게임 보기</a></li>
						          </ul>
						        </li>
						        <!-- User Account: style can be found in dropdown.less -->
						        <li class="dropdown user user-menu">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
						            <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
						            <span class="hidden-xs">${login.userid}</span>
						          </a>
						          <ul class="dropdown-menu">
						            <!-- User image -->
						            <li class="user-header">
						              <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
						              <p>
						                ${login.userid } - ${login.username }
						                <small>${login.regdate }</small>
						              </p>
						            </li>
						            <!-- Menu Body -->
<!-- 						            <li class="user-body"> -->
<!-- 						              <div class="col-xs-4 text-center"> -->
<!-- 						                <a href="#">Followers</a> -->
<!-- 						              </div> -->
<!-- 						              <div class="col-xs-4 text-center"> -->
<!-- 						                <a href="#">Sales</a> -->
<!-- 						              </div> -->
<!-- 						              <div class="col-xs-4 text-center"> -->
<!-- 						                <a href="#">Friends</a> -->
<!-- 						              </div> -->
<!-- 						            </li> -->
						            <!-- Menu Footer-->
						            <li class="user-footer">
						              <div class="pull-left">
						                <a href="/users/lock" class="btn btn-default btn-flat">내정보 변경</a>
						              </div>
						              <div class="pull-right">
						                <a href="/users/logout?result=logout" class="btn btn-default btn-flat">로그아웃</a>
						              </div>
						            </li>
						          </ul>
						        </li>
						      </ul>
						    </div>
					   	</c:if>
						
						<!-- 로그인 안했을때 -->
						<c:if test="${empty login }">
							<div class="navbar-form navbar-right">
								<a class="btn btn-default btn-flat" href="/users/login">로그인</a>
								<a class="btn btn-info btn-flat" href="/users/join">회원가입</a>
							</div>
						</c:if>
						
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</header>