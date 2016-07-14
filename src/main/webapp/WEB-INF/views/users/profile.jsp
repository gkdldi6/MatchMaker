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

input[readonly] {
	border: 0px;
}

input:read-only, textarea:read-only {
	background-color: white !important;
}
</style>


  <div class="content-wrapper">
	<div class="container">
	  <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="/resources/img/user.jpg" alt="사진">

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
	            <c:if test="${!empty login }">
	              <c:if test="${login.userid != user.userid }">
	              	<button id="sendMsg" class="btn btn-success btn-sm">쪽지 보내기</button>
	              </c:if>
	            </c:if>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


		<c:if test="${!empty user.name }">
		
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
          
        </c:if>
          
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true">활동</a></li>
              <li class=""><a href="#board" data-toggle="tab" aria-expanded="false">게시글</a></li>
              <c:if test="${!empty user.name }">
	              <li class=""><a href="#timeline" data-toggle="tab" aria-expanded="false">게임</a></li>
	              <li class=""><a href="#settings" data-toggle="tab" aria-expanded="false">선수 정보</a></li>
	          </c:if>
            </ul>
            <div class="tab-content">
              		<div class="tab-pane active" id="activity">
							<div style="height: 100px;padding-top:10px">
							
							<c:if test="${!empty user.name }">
								<div class="col-sm-6">
									<span class="label bg-blue" style="font-size: 15px"> 농구 등급 </span>
									<div style="margin-top: 10px">
										<c:choose>
											<c:when test="${user.basketgrade ==  '브론즈'}">
												<img src="http://localhost:8080//resources/img/bronze.png" width="135" style="padding: 10px">
											</c:when>
											<c:when test="${user.basketgrade == '실버' }">
												<img src="http://localhost:8080//resources/img/silver.png" width="135" style="padding: 10px">
											</c:when>
											<c:otherwise>
												<img src="http://localhost:8080//resources/img/gold.png" width="135" style="padding: 10px">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="progress">
										<div id="basket-progress"
											class="progress-bar progress-bar-primary progress-bar-striped"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100">
											<span class="sr-only"></span>
										</div>
									</div>
								</div>
							</c:if>
								
								<div class="col-sm-6">
								
									<span class="label bg-green" style="font-size: 15px"> 회원
										등급 </span>

									<div style="margin-top: 10px">
										<c:choose>
											<c:when test="${user.usergrade ==  '3등급'}">
												<img src="http://localhost:8080//resources/img/level1.png" width="250" style="padding: 10px">
											</c:when>
											<c:when test="${user.usergrade == '2등급' }">
												<img src="http://localhost:8080//resources/img/level2.png" width="250" style="padding: 10px">
											</c:when>
											<c:otherwise>
												<img src="http://localhost:8080//resources/img/level3.png" width="250" style="padding: 10px">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="info-box bg-green" style="margin-top: 20px">
										<span class="info-box-icon"><i
											class="ion ion-ios-heart-outline"></i></span>

										<div class="info-box-content">
											<span class="info-box-text">회원 점수</span> <span
												class="info-box-number">${user.userpoint }</span>

											<div class="progress">
												<div id="user-progress" class="progress-bar"></div>
											</div>
											<span class="progress-description"></span>
										</div>
										<!-- /.info-box-content -->
									</div>
								</div>
								
							<c:if test="${!empty user.name }">								
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
							</c:if>
								
							</div>
						</div>
              <!-- /.tab-pane -->
              
              <div class="tab-pane" id="timeline">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">
					<!-- 게임 목록 -->
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
                  
              <c:choose>
                <c:when test="${!empty user.name }">	
                  	<form class="form-horizontal">
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputName" readonly value="${user.name }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail" class="col-sm-2 control-label">나이</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputAge" readonly value="${user.age }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputName" class="col-sm-2 control-label">성별</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputSex" readonly value="${user.sex }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">키</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputHeight" readonly value="${user.height }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">몸무게</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="inputWeight" readonly value="${user.weight }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">포지션</label>
                    <div class="position col-sm-10">
                      <input type="text" class="form-control" id="inputPosition" readonly value="${user.position }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputSkills" class="col-sm-2 control-label">게임수</label>
                    <div class="gamecnt col-sm-10">
                      <input type="text" class="form-control" id="inputGamecnt" readonly value="${user.gamecnt }">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputExperience" class="col-sm-2 control-label">자기 소개</label>
                    <div class="col-sm-10">
                      <div id="content" style="padding:7px">${user.info }</div>
                    </div>
                  </div>
                </form> 
              </c:when>
              <c:otherwise>
              	선수 정보가 없습니다.
              </c:otherwise>
            </c:choose>    
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


<script id="gameTemplate" type="text/x-handlebars-template">
{{#each .}}
<li>
<i class="fa fa-comments bg-yellow"></i>

<div class="timeline-item">
  <span class="time"><i class="fa fa-clock-o"></i> {{begintime}} ~ {{endtime}}</span>

  <h3 class="timeline-header"><a href="#">{{mno}}</a> {{mname}}</h3>

  <div class="timeline-body">
	<span class="label bg-green">{{state}}</span>    
  </div>
</div>
</li>
{{/each}}
</script>
<script type="text/javascript">
getAllMyGames();

function getAllMyGames() {
	$.getJSON('/courts/allMyGames?userid=' + id, function(data) {
		var templateObj = $('#gameTemplate');
		var target = $('.timeline');
		
		var template = Handlebars.compile(templateObj.html());
		var html = template(data);

		target.html(html);
	});
};
</script>
<script type="text/javascript">
	var targetid = '${user.userid}';
	
	var userhigh = ${user.uhigh} - ${user.ulow};
	var userpoint = ${user.userpoint} - ${user.ulow};
	var userprogress = userpoint/userhigh * 100;
	$('#user-progress').css('width', userprogress);

	var baskethigh = ${user.bhigh} - ${user.blow};
	var basketpoint = ${user.point} - ${user.blow};
	var basketprogress = basketpoint/baskethigh * 100;
	$('#basket-progress').css('width', basketprogress);
	
	$('#sendMsg').click(function() {
		window.open('/messages/write?targetid=' + targetid, 'new', 'width=850, height=660');
	});

	var result = '${result}';

	if(result == 'updatesuccess'){
		alert('수정에 성공 했습니다.');
	}
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>