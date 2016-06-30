<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab_1" data-toggle="tab">코트</a></li>
		<li><a href="#tab_2" data-toggle="tab">대기방</a></li>
		<li><a href="#tab_3" data-toggle="tab">게임</a></li>
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
		<div class="tab-pane active" id="tab_1">


			<!-- Box Comment -->
			<div class="box-widget">
				<div class="box-header with-border">
					<div class="user-block">
						<img class="img-circle" src="/resources/img/court-icon.jpg"
							alt="court Image"> <span id="cname" class="username"></span>
						<span id="address" class="description"></span>
					</div>
					<!-- /.user-block -->
				</div>
				<!-- /.box-header -->
				<div class="box-body">

					<img alt="코트 사진" width="200" height="200"></img><br> <b>코트
						상세</b>
					<p id="ccontent"></p>
					<!-- Social sharing buttons -->
					<button type="button" class="btn btn-default btn-xs">
						<i class="fa fa-thumbs-o-up"></i> Like
					</button>
					<span class="pull-right text-muted">45 likes - 2 comments</span>
					
				</div>
				<!-- /.box-body -->

				<div class="box-footer box-comments">

					<div class="box-comment">
						<!-- User image -->
						<img class="img-circle img-sm" src="/resources/img/user.jpg" alt="User Image">
						<div class="comment-text">
							<span class="username"> Maria Gonzales <span
								class="text-muted pull-right">8:03 PM Today</span>
							</span>
							<!-- /.username -->
							It is a long established fact that a reader will be distracted by
							the readable content of a page when looking at its layout.
						</div>
						<!-- /.comment-text -->
					</div>
					<!-- /.box-comment -->
					
					<div class="box-comment">
						<!-- User image -->
						<img class="img-circle img-sm" src="/resources/img/user.jpg" alt="User Image">
						<div class="comment-text">
							<span class="username"> Maria Gonzales <span
								class="text-muted pull-right">8:03 PM Today</span>
							</span>
							<!-- /.username -->
							It is a long established fact that a reader will be distracted by
							the readable content of a page when looking at its layout.
						</div>
						<!-- /.comment-text -->
					</div>
					<!-- /.box-comment -->
					
					<div class="box-comment">
						<!-- User image -->
						<img class="img-circle img-sm" src="/resources/img/user.jpg" alt="User Image">
						<div class="comment-text">
							<span class="username"> Maria Gonzales <span
								class="text-muted pull-right">8:03 PM Today</span>
							</span>
							<!-- /.username -->
							It is a long established fact that a reader will be distracted by
							the readable content of a page when looking at its layout.
						</div>
						<!-- /.comment-text -->
					</div>
					<!-- /.box-comment -->
					
					<div class="box-comment">
						<!-- User image -->
						<img class="img-circle img-sm" src="/resources/img/user.jpg" alt="User Image">
						<div class="comment-text">
							<span class="username"> Maria Gonzales <span
								class="text-muted pull-right">8:03 PM Today</span>
							</span>
							<!-- /.username -->
							It is a long established fact that a reader will be distracted by
							the readable content of a page when looking at its layout.
						</div>
						<!-- /.comment-text -->
					</div>
					<!-- /.box-comment -->
					
					<div class="box-comment">
						<!-- User image -->
						<img class="img-circle img-sm" src="/resources/img/user.jpg" alt="User Image">
						<div class="comment-text">
							<span class="username"> Maria Gonzales <span
								class="text-muted pull-right">8:03 PM Today</span>
							</span>
							<!-- /.username -->
							It is a long established fact that a reader will be distracted by
							the readable content of a page when looking at its layout.
						</div>
						<!-- /.comment-text -->
					</div>
					<!-- /.box-comment -->

				</div>
			</div>
			<!-- /.box -->
			
			
		</div>
		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_2">
			<ul class="timeline">
			    <li class="time-label">
       				 <span class="bg-red">날짜</span> <input type="text" id="datepicker">
    			</li>
    			
    			<!-- ajax로 불러온 약속된 게임들이 들어가는 공간 -->
    			
			</ul>
		</div>
		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_3">

		</div>
		<!-- /.tab-pane -->
	</div>
	<!-- /.tab-content -->
</div>