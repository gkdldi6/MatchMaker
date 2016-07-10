<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<style>
.container {
	padding-top: 25px;
}

.tab-pane {
            min-height: 640px
         }
</style>


  <div class="content-wrapper">
	<div class="container">
	  <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="../../dist/img/user4-128x128.jpg" alt="사진">

              <h3 class="profile-username text-center">이름</h3>

              <p class="text-muted text-center">아이디</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>가입일</b> <a class="pull-right">91.05.28</a>
                </li>
                <li class="list-group-item">
                  <b>이메일</b> <a class="pull-right">선중@선중.com</a>
                </li>
                <li class="list-group-item">
                  <b>전적</b> <a class="pull-right">5/10</a>
                </li>
                <li class="list-group-item">
                  <b>승률</b> <a class="pull-right">50%</a>
                </li>
              </ul>
              <button class="btn btn-success btn-sm">쪽지 보내기</button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">선수 정보</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 선수 소개</strong>

              <p class="text-muted">
                안녕? 난 선중이라고 해~ 
                리바운드는 나한테 맡겨줘!
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 활동 지역</strong>

              <p class="text-muted">금천구 서울</p>

              <hr>
              
              <strong><i class="fa fa-pencil margin-r-5"></i> 포지션</strong>

              <p>
                <span class="label label-danger">센터</span>
                <span class="label label-success">파워 포워드</span>
              </p>
          
              <hr>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">활동</a></li>
              <li class=""><a href="#timeline" data-toggle="tab" aria-expanded="false">게임</a></li>
              <li class=""><a href="#board" data-toggle="tab" aria-expanded="false">게시글</a></li>
              <li class=""><a href="#settings" data-toggle="tab" aria-expanded="false">선수 정보</a></li>
            </ul>
            <div class="tab-content">
              		<div class="tab-pane active" id="activity">
							
							<fieldset>
								<legend>농구</legend>
							</fieldset>
							<div style="height: 100px">
								<div class="col-md-6">
									<span class="label bg-blue" style="font-size: 15px"> 농구 등급 </span>
									<div style="margin-top: 10px">
										<img src="http://localhost:8080//resources/img/silver.png"
											width="135" style="padding: 10px">
									</div>
									<div class="progress">
										<div
											class="progress-bar progress-bar-primary progress-bar-striped"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 30%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="box box-danger">
										<div class="box-header with-border">
											<h3 class="box-title">농구 점수</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body">The body of the box</div>
										<!-- /.box-body -->
									</div>
									<div class="box box-warning">
										<div class="box-header with-border">
											<h3 class="box-title">신뢰 점수</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body">The body of the box</div>
										<!-- /.box-body -->
									</div>
								</div>
								<fieldset>
									<legend>회원</legend>								
								</fieldset>
								<div>
									<span class="label bg-green" style="font-size: 15px"> 회원
										등급 </span>

									<div style="margin-top: 10px">
										<img src="http://localhost:8080//resources/img/level3.png"
											width="250" style="padding: 10px">
									</div>
									<div class="info-box bg-green" style="margin-top: 20px">
										<span class="info-box-icon"><i
											class="ion ion-ios-heart-outline"></i></span>

										<div class="info-box-content">
											<span class="info-box-text">회원 점수</span> <span
												class="info-box-number">92,050</span>

											<div class="progress">
												<div class="progress-bar" style="width: 100%"></div>
											</div>
											<span class="progress-description"> 20% Increase in 30
												Days </span>
										</div>
										<!-- /.info-box-content -->
									</div>
								</div>
							</div>

						</div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="timeline">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-red">
                          10 Feb. 2014
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-envelope bg-blue"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                      <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                      <div class="timeline-body">
                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                        quora plaxo ideeli hulu weebly balihoo...
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-primary btn-xs">Read more</a>
                        <a class="btn btn-danger btn-xs">Delete</a>
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-user bg-aqua"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                      <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                      </h3>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-comments bg-yellow"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                      <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                      <div class="timeline-body">
                        Take me to your leader!
                        Switzerland is small and neutral!
                        We are more like Germany, ambitious and misunderstood!
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-green">
                          3 Jan. 2014
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-camera bg-purple"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                      <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                      <div class="timeline-body">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <li>
                    <i class="fa fa-clock-o bg-gray"></i>
                  </li>
                </ul>
              </div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="board">
                선중아 여기 부탁해 이 회원이 쓴 게시글 출력해줘
                그리고 여기에서 이 회원정보 불러올때 세션쓰면 안되

             
              </div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="settings">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputName" placeholder="Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                    <div class="col-sm-10">
                      <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">Name</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" placeholder="Name">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                    <div class="col-sm-10">
                      <textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">Skills</label>

                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSkills" placeholder="Skills">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> I agree to the <a href="#">terms and conditions</a>
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-danger">Submit</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
	</div>
  </div>

<script type="text/javascript">
	var result = '${result}';

	if(result == 'updatesuccess'){
		alert('수정에 성공 했습니다.');
	}
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>