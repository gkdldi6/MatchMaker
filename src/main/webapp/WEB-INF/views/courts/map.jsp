<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script type="text/javascript">
var id = '${login.userid}';			/* 회원 아이디 */
var name = '${login.username}';		/* 회원 이름 */
</script>
<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
<style>
.chatbar, .chatbtn {
	position: fixed;
	z-index: 1000;
	top: 100px;
	-webkit-transition: left 0.3s ease-in-out;
	-o-transition: left 0.3s ease-in-out;
	transition: left 0.3s ease-in-out;
}

.chatbar {
	left: -400px;
	width: 400px;
/* 	height: 600px; */
}

.chatbtn {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
    display: block;
    float: left;
    left: 0px;
    height: 40px;
    width: 40px;
    text-align: center;
    font-size: 30px;
    line-height: 40px;
    background: rgba(0, 0, 0, 0.2);
}

.tab-content {
/* 	height: 500px; */
    margin-bottom: 0px;
}

#roomUserlist > div {
	width: 50%;
	height: 100%;
	float: left;
}

#sidebar > aside {
	padding-bottom: 0px !important;
	overflow-x: hidden !important;
}

.info-box-content:hover {
	-webkit-box-shadow: inset 0 0 100px rgba(0, 0, 0, 0.2);
	box-shadow: inset 0 0 100px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}
</style>


<%-- <jsp:include page="chat.jsp"></jsp:include> --%>


<!-- 사이드바 시작  -->
<div id="sidebar" state="opened">
	<aside class="control-sidebar control-sidebar-light">
		<jsp:include page="court.jsp"></jsp:include>
	</aside>
	<!-- 사이드바 배경 : 없으면 안됨 -->
	<div class="control-sidebar-bg"></div>
</div>
<!-- 사이드바 끝 -->


<!-- 지도가 표시될 공간 -->
<div id="map"></div>


<!-- 방 만들때 뜨는 모달 -->
<div id="createRoom" class="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title">방 만들기</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
                  <input type="number" class="form-control" id="cno" placeholder="사용할 코트를 입력해주세요.">
                </div>
				<div class="form-group">
                  <input type="text" class="form-control" id="rname" placeholder="생성할 게임방의 이름을 입력해주세요.">
                </div>
                <div class="form-group">
                  <input type="number" class="form-control" id="usercnt" placeholder="최대 인원을 입력해주세요.">
                </div>
                <div class="form-group">
                	<input type="text" class='datetimepicker form-control' id="begintime" placeholder="예약 날짜 및 시간을 선택해주세요.">
                </div>
                <div class="form-group">
					<input type="number" class="form-control" id="endtime" placeholder="사용 시간을 입력해주세요.">                	
                </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"
					data-dismiss="modal">닫기</button>
				<button id="create" type="button" class="btn btn-primary">만들기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<!-- 코트 템플릿 -->
<script id="courtTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-flag-o"></i></span>
            <div class="info-box-content" cno="{{cno}}">
              <span class="info-box-text">{{title}}</span>
              <span class="info-box-number">
                <span style="font-weight:normal;font-size:15px">Likes</span>
                <span>{{liked}}</span>
				<span style="font-weight:normal;font-size:15px">Comments</span>
				<span>{{replycnt}}</span>
              </span>
            </div>
            <!-- /.info-box-content -->
        </div>
	{{/each}}
</script>
<!-- 방 템플릿 -->
<script id="roomTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<div class="eachRoom box box-warning box-solid collapsed-box">
			<div class="box-header with-border">
				<span class="roomno badge">{{roomno}}</span>
				<span><b>{{rname}}</b></span>		
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
						<i class="fa fa-plus"></i>
					</button>
				</div>
			</div>
			<div class="box-body" style="display: none;">
				<span class="ruserscnt"></span><span>/{{usercnt}}</span>
				<span>현재 접속중인 회원:</span><span class="rusers"></span>
			</div>
			<div class="box-footer" style="border-top:0px">
				<button id="join" type="button" class="btn btn-primary btn-flat">참가</button>
			</div>
		</div>
	{{/each}}
</script>
<!-- 게임 템플릿 -->
<script id="gameTemplate" type="text/x-handlebars-template">
	{{#each .}}
		<li>
        	<i class="fa bg-blue">{{mno}}</i>
        	<div class="timeline-item">
            	<span class="time"><i class="fa fa-clock-o"></i> 
					{{begintime}} ~ 
					{{endtime}}
				</span>
        	    <h3 class="timeline-header"><a href="#">{{mname}}</a></h3>
    	        <div class="timeline-body">
 	               {{state}}
            	</div>
            	<div class="timeline-footer">
                	<a class="btn btn-primary btn-xs">{{cno}}</a>
            	</div>
        	</div>
    	</li>
	{{/each}}
</script>
<script src="//code.jquery.com/jquery.min.js"></script>
<!-- datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">$( "#datepicker" ).datepicker();</script>
<!-- datetimepicker -->
<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>
<script>$('.datetimepicker').appendDtpicker({'locale':'ko'});</script>
<!-- socket.io api -->
<!-- 학원 -->
<script src="http://192.168.0.114:3000/socket.io/socket.io.js"></script>
<!-- 집 -->
<!-- <script src="http://localhost:3000/socket.io/socket.io.js"></script> -->
<!-- socket.io client -->
<script src="/resources/js/socket.io.client.js"></script>
<!-- 다음 지도 API -->
<script	src="//apis.daum.net/maps/maps3.js?apikey=55e0d519a9b6c3ce803115407c5ce276"></script>
<!-- 다음 지도 API 구현 -->
<script src="/resources/js/daumMap.js"></script>
<!-- 사이드 바 조작 -->
<script src="/resources/js/controll-bar.js"></script>
<!-- 사이드 바 페이지 내용 -->
<script src="/resources/js/court.js"></script>

<!-- footer -->
</div>

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