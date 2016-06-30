<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- chatbar 시작 -->
<div class="nav-tabs-custom chatbar" state="closed">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab_1" data-toggle="tab">채팅</a></li>
		<li><a href="#tab_2" data-toggle="tab">방목록</a></li>
		<li><a href="#tab_3" data-toggle="tab">예약목록</a></li>
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
						<span id="reser-btn-group" style="display:none">
							<button id="reserve" class="btn btn-primary btn-flat btn-xs">예약</button>
						</span>						
						<span id="exit-btn-group" style="display:none">
							<button id=teamChange class="btn btn-success btn-flat btn-xs">팀 변경</button>
							<button id="exit" class="btn btn-warning btn-flat btn-xs">나가기</button>
						</span>
					</div>
				</div>
				<!-- /.box-header -->
			
				<div id="msgbox" class="box-body">

					<!-- 대화가 생성되는 곳 -->
					<div class="direct-chat-messages"></div>
					<!-- /대화가 생성되는 곳 -->

					<!-- 접속한 인원들 -->
					<div class="direct-chat-contacts">
					  	<div id="waitUserlist"></div>
						<div id="roomUserlist">
							<div>
								<span><b>Home</b></span>
								<div class="home">
								</div>
							</div>							
							<div>
								<span><b>Away</b></span>
								<div class="away">
								</div>
							</div>
						</div>
					</div>
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
					<button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
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
					<button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
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