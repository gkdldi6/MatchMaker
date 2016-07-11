<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<style>
.container {
	padding-top: 25px;
}

.tab-pane {
   	min-height: 780px
}

@media (min-width: 768px) {
	.tab-pane {
    	min-height: 590px
	}
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

              <h3 class="profile-username text-center">${user.username}</h3>

              <p class="text-muted text-center">${user.userid}</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>가입일</b> 
                  <a class="pull-right">
                  	<fmt:formatDate pattern="yy-MM-dd" value="${user.regdate}" />
                  </a>
                </li>
                <li class="list-group-item">
                  <b>이메일</b> <a class="pull-right">${user.email}</a>
                </li>
                <li class="list-group-item">
                  <b>회원 소개</b> 
                  <div>${user.userinfo }</div>
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

              <p class="text-muted">${user.info }</p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 마지막으로 뛴 코트</strong>

              <p class="text-muted">여기</p>

              <hr>
              
              <strong><i class="fa fa-pencil margin-r-5"></i> 포지션</strong>

              <p>
              	<c:choose>
              		<c:when test="${user.position == 'C' }">
              			<span class="label label-danger">센터</span>
              		</c:when>
              		<c:when test="${user.position == 'PF' }">
              			<span class="label label-success">파워 포워드</span>
              		</c:when>
              		<c:when test="${user.position == 'SF' }">
              			<span class="label label-primary">스몰 포워드</span>
              		</c:when>
              		<c:when test="${user.position == 'SG' }">
              			<span class="label label-info">슈팅 가드</span>
              		</c:when>
              		<c:otherwise>
              			<span class="label label-warning">포인트 가드</span>
              		</c:otherwise>
              	</c:choose>
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
							<div style="height: 100px;padding-top:10px">
							
								<div class="col-sm-6">
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
								
								<div class="col-sm-6">
								
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
								
								<div class="col-xs-12">
									<div class="box box-danger" style="margin-top:20px">
										<div class="box-header with-border">
											<h3 class="box-title">농구 점수</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body" style="font-size:30px">${user.point }</div>
										<!-- /.box-body -->
									</div>
								</div>
								
								<div class="col-xs-12">
									<div class="box box-warning" style="margin-top:20px">
										<div class="box-header with-border">
											<h3 class="box-title">신뢰 점수</h3>
										</div>
										<!-- /.box-header -->
										<div class="box-body" style="font-size:30px">${user.trust }</div>
										<!-- /.box-body -->
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
	                
				  <table class="table table-hover table-striped">
                     <thead>
                      <tr>
                        <th width="10%">구분</th>
                        <th width="10%">글번호</th>
                        <th width="35%">제목</th>
                        <th width="10%">작성자</th>
                        <th width="15%">날짜</th>
                        <th width="10%">조회수</th>
                      </tr>
                    </thead>
                    
                    <tbody>
						<c:forEach items="${list}" var="article">
							<tr>
								<td>
									<c:if test="${article.bno eq 0}">
										공지
									</c:if>
									<c:if test="${article.bno eq 1}">
										자유
									</c:if>
									<c:if test="${article.bno eq 2}">
										농구
									</c:if>
									<c:if test="${article.bno eq 3}">
										게임
									</c:if>
									<c:if test="${article.bno eq 100}">
										자료
									</c:if>
								</td>
								<td>${article.ano}</td>
								<td class="title"><a
									href='/boards/${article.bno}/${article.ano}'>
										${article.title}</a>
								</td>
								<td>${article.writer}</td>
								<td><fmt:formatDate pattern="yy-MM-dd HH:mm"
										value="${article.regdate }" /></td>
								<td><span class="badge">${article.hit }</span></td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
					<div align="center">
						<ul class="pagination">
			
							<c:if test="${pageMaker.prev}">
								<li><a href="${user.userid}?page=${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>
			
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
								var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${user.userid}?page=${idx}">${idx}</a>
								</li>
							</c:forEach>
			
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="${user.userid}?page=${pageMaker.endPage + 1}">&raquo;</a></li>
							</c:if>
			
						</ul>
					</div>
             
              </div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="settings">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                    <div class="name col-sm-10">
						이름
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">나이</label>
                    <div class="age col-sm-10">
						나이
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">성별</label>
                    <div class="sex col-sm-10">
                      성별
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">키</label>
                    <div class="height col-sm-10">
                      키
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">몸무게</label>
                    <div class="weight col-sm-10">
                      몸무게
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">포지션</label>
                    <div class="position col-sm-10">
                      포지션
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">게임수</label>
                    <div class="gamecnt col-sm-10">
                      게임수
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