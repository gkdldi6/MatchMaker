<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script type="text/javascript">
var id = '${login.userid}';			/* 회원 아이디 */
var name = '${login.username}';		/* 회원 이름 */

</script>

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

.direct-chat-messages, #roomSpace {
	height: 500px;
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
    height: 620px;
    margin-bottom: 0px;
}
</style>


<!-- chatbar 시작 -->
<div class="nav-tabs-custom chatbar" state="closed">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab_1" data-toggle="tab">채팅</a></li>
		<li><a href="#tab_2" data-toggle="tab">방목록</a></li>
		<li><a href="#tab_3" data-toggle="tab">예약목록</a></li>
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> Dropdown <span class="caret"></span>
		</a>
			<ul class="dropdown-menu">
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Action</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Another action</a></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Something else here</a></li>
				<li role="presentation" class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="#">Separated link</a></li>
			</ul></li>
		<li class="pull-right"><a href="#" class="text-muted"><i
				class="fa fa-gear"></i></a></li>
	</ul>
	<div class="tab-content">
	
	
		<!-- 채팅 시작 -->
		<div class="tab-pane active" id="tab_1">
			<div class="box box-danger direct-chat direct-chat-danger">
				<div class="box-header with-border">
					<h3 id="room-name" class="box-title">대기실</h3>
					<div class="box-tools pull-right">
						<!-- 접속한 인원 목록 버튼 -->
						<button type="button" class="btn btn-box-tool"
							data-toggle="tooltip" title="회원" data-widget="chat-pane-toggle">
							<i class="fa fa-comments"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
			
				<div id="msgbox" class="box-body">

					<!-- 대화가 생성되는 곳 -->
					<div class="direct-chat-messages"></div>
					<!-- /대화가 생성되는 곳 -->

					<!-- 접속한 인원들 -->
					<div class="direct-chat-contacts"></div>
					<!-- /접속한 인원들 -->

				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<div class="input-group">

						<!-- 메시지 입력 공간 -->
						<input type="text" id="message" placeholder="메시지를 입력해주세요."
							class="form-control">

						<!-- 전송 버튼 -->
						<span class="input-group-btn"> <a id="send"
							class="btn btn-danger btn-flat">전송</a>
						</span>

					</div>
				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!-- 채팅 끝 -->
		
		
		<!-- 방 목록 시작 -->
		<div class="tab-pane" id="tab_2">
			<div class="box box-warning">
				<div class="box-header">
					<h3 class="box-title">생성된 방 목록</h3>
				</div>
				<!-- /.box-header -->
				
				<!-- 방 생성 공간 -->
				<div id="roomSpace" class="box-body" style="overflow-y:auto">
				</div>
				<!-- 방 생성 공간 끝 -->
				
				<div class="box-footer" style="border-top:0px">
					<div style="float:right">
						<button data-target="#createRoom" data-toggle="modal" type="button" class="btn btn-warning btn-flat">만들기</button>
						<button id="select" type="button" class="btn btn-warning btn-flat">조회</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 방 목록 끝 -->
		
		
		<!-- 예약 목록 시작 -->		
		<div class="tab-pane" id="tab_3">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">예약 목록</h3>
				</div>
				<!-- /.box-header -->
				
				<!-- 예약 공간 시작 -->
				<div class="room-space box-body">
					

				</div>
				<!-- 예약 공간 끝 -->
				
				<div class="box-footer" style="border-top:0px">
					<div style="float:right">
						<button type="button" class="btn btn-success btn-flat">조회</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 예약 목록 끝 -->


	</div>
	<!-- /.tab-content -->
</div>
<!-- chatbar 끝 -->

<!-- chatbar 버튼 -->
<span class="info-box-icon bg-red chatbtn"><i class="fa fa-comments-o"></i></span>

<!-- 사이드바 시작  -->
<div id="sidebar" state="closed">
	<aside class="control-sidebar control-sidebar-light">
		<jsp:include page="court.jsp"></jsp:include>
	</aside>
	<!-- 사이드바 배경 : 없으면 안됨 -->
	<div class="control-sidebar-bg"></div>
</div>
<!-- 사이드바 끝 -->


<!-- 지도가 표시될 공간 -->
<div class="container" align="center">
	<div id="map" style="height: 650px"></div>
</div>


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
                  <input type="text" class="form-control" id="rname" placeholder="생성할 게임방의 이름을 입력해주세요.">
                </div>
                <div class="form-group">
                  <input type="number" class="form-control" id="usercnt" placeholder="최대 인원을 입력해주세요.">
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
				<span>{{rusers.length}}/{{usercnt}}</span>
				<span>현재 접속중인 회원: {{rusers}}</span>
			</div>
			<div class="box-footer" style="border-top:0px">
				<button id="join" type="button" class="btn btn-primary btn-flat">참가</button>
			</div>
		</div>
	{{/each}}
</script>
<!-- socket.io api -->
<!-- 학원 -->
<!-- <script src="http://192.168.0.114:3000/socket.io/socket.io.js"></script> -->
<!-- 집 -->
<script src="http://192.168.219.188:3000/socket.io/socket.io.js"></script>
<!-- socket.io client -->
<script src="/resources/js/socket.io.client.js"></script>
<!-- 다음 지도 API -->
<script	src="//apis.daum.net/maps/maps3.js?apikey=55e0d519a9b6c3ce803115407c5ce276"></script>
<!-- 다음 지도 API 구현 -->
<script src="/resources/js/daumMap.js"></script>
<script src="/resources/js/controll-bar.js"></script>


<jsp:include page="../include/footer.jsp"></jsp:include>