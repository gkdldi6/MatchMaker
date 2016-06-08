<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<script type="text/javascript">
var id = '${login.userid}';			/* 회원 아이디 */
var name = '${login.username}';		/* 회원 이름 */
</script>
<button id="addRoom">방 만들기</button>

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
	height: 600px;
}

.chatbar .box-body, .direct-chat-messages {
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
</style>



<!-- chatbar 버튼 -->
<span class="info-box-icon bg-red chatbtn"><i class="fa fa-comments-o"></i></span>

<!-- chatbar 시작 -->
	<div class="box box-danger direct-chat direct-chat-danger chatbar" state="closed">
		<div class="box-header with-border">
			<h3 class="box-title">매치메이커</h3>

			<div class="box-tools pull-right">
				<span data-toggle="tooltip" title="3 New Messages"
					class="badge bg-red">3</span>
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-toggle="tooltip"
					title="Contacts" data-widget="chat-pane-toggle">
					<i class="fa fa-comments"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove">
					<i class="fa fa-times"></i>
				</button>
			</div>
		</div>
		<!-- /.box-header -->
		<div id="msgbox" class="box-body">
			
			<!-- 대화가 생성되는 곳 -->
			<!-- /대화가 생성되는 곳 -->
			
			<!-- 접속한 인원들 -->
			<div class="direct-chat-contacts">
				<ul class="contacts-list">
					<li><a href="#"> <img class="contacts-list-img"
							src="../dist/img/user1-128x128.jpg" alt="User Image">

							<div class="contacts-list-info">
								<span class="contacts-list-name"> Count Dracula <small
									class="contacts-list-date pull-right">2/28/2015</small>
								</span> <span class="contacts-list-msg">How have you been? I
									was...</span>
							</div> <!-- /.contacts-list-info -->
					</a></li>
					<!-- End Contact Item -->
				</ul>
				<!-- /.contatcts-list -->
			</div>
			<!-- /접속한 인원들 -->
			
		</div>
		<!-- /.box-body -->
		<div class="box-footer">
			<div class="input-group">
				
				<!-- 메시지 입력 공간 -->
				<input type="text" id="message" placeholder="메시지를 입력해주세요." class="form-control"> 
				
				<!-- 전송 버튼 -->
				<span class="input-group-btn">
					<a id="send" class="btn btn-danger btn-flat">전송</a>
				</span>
			
			</div>
		</div>
		<!-- /.box-footer-->
	</div>
<!-- chatbar 끝 -->


	<!-- 사이드바 시작  -->
	<div id="sidebar" state>
		<aside class="control-sidebar control-sidebar-light">
			<div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1" data-toggle="tab"
						aria-expanded="false">Tab 1</a></li>
					<li class=""><a href="#tab_2" data-toggle="tab"
						aria-expanded="false">Tab 2</a></li>
					<li class=""><a href="#tab_3" data-toggle="tab"
						aria-expanded="true">Tab 3</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" aria-expanded="false">Dropdown
							<span class="caret"></span>
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
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab_1">
						<ul class="timeline">

							<!-- timeline time label -->

							<!-- /.timeline-label -->

							<!-- timeline item -->

							<li><i class="fa fa-comments bg-yellow"></i>

								<div class="timeline-item">

									<div class="box flat box-warning box-solid collapsed-box">
										<div class="box-header with-border">
											<span class="time"><i class="fa fa-clock-o"></i> 27분전</span>
											<h3 class="box-title">1:1 빨리와</h3>

											<div class="box-tools pull-right">

												<button type="button" class="btn btn-box-tool"
													data-widget="collapse">
													<i class="fa fa-plus"></i>
												</button>
											</div>
											<!-- /.box-tools -->

										</div>
										<!-- /.box-header -->
										<div class="box-body" style="display: none;">테스트</div>
										<!-- /.box-body -->
										<div class="box-footer">
											<button type="button" class="btn btn-default btn-sm btn-flat">참가하기</button>
										</div>
									</div>
								</div></li>
						</ul>
					</div>
					<!-- 탭1 끝 -->

					<div class="tab-pane" id="tab_2">
						<jsp:include page="court-page.jsp"></jsp:include>
					</div>
					<!-- 탭2 끝 -->

					<div class="tab-pane" id="tab_3">
						<jsp:include page="court-page.jsp"></jsp:include>
					</div>
					<!-- 탭3 끝 -->

				</div>
				<!-- /.tab-content -->
			</div>
		</aside>
		<!-- The sidebar's background -->
		<!-- This div must placed right after the sidebar for it to work-->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- 사이드바 끝 -->

	<!-- 지도가 표시될 공간 -->
	<div class="container" align="center">
		<div id="map" style="width: 83%; height: 680px"></div>
	</div>

<!-- socket.io api -->
<script src="http://192.168.0.114:3000/socket.io/socket.io.js"></script>
<!-- socket.io client -->
<script src="/resources/js/socket.io.client.js"></script>
<!-- 다음 지도 API -->
<script	src="//apis.daum.net/maps/maps3.js?apikey=55e0d519a9b6c3ce803115407c5ce276"></script>
<!-- 다음 지도 API 구현 -->
<script src="/resources/js/daumMap.js"></script>
<!-- chatbar 조작 -->
<script type="text/javascript">
var chatbar = $('.chatbar');
var chatbtn = $('.chatbtn');

function chatbarOpen() {
	chatbar.css('left', '0px');
	chatbtn.css('left', '400px');
	chatbar.attr('state', 'opened');
};

function chatbarClose() {
	chatbar.css('left', '-400px');
	chatbtn.css('left', '0px');
	chatbar.attr('state', 'closed');
};

chatbtn.click(function() {
	if(chatbar.attr('state') === 'closed') {
		chatbarOpen();
	} else {
		chatbarClose();
	}
});
</script>
<!-- 타임라인 템플릿 -->
<script id="template" type="text/x-handlebars-template">
{{#each .}}
	<div class="col-lg-10 col-lg-offset-2 each-reply" data-rno={{rno}}>
		<div class="panel panel-warning">
			<div class="panel-heading">
   				<h3 class="panel-title" id="replyer-list">{{replyer}}</h3>
 			</div>
 			<div class="panel-body">
 				<div id="replytext-list">{{replytext}}</div>
				<div><br><input type="button" class="btn btn-warning btn-xs btn-flat each-button"
								value="수정" data-toggle="modal" data-target="#modifyModal">
				</div>
			</div>
		</div>
	</div>
{{/each}}
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>