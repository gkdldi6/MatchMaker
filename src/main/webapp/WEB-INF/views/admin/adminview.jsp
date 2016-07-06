<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<style>
.container {
	padding-top: 25px;
}
</style>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<div class="content-wrapper">
	<div class="container">
		<div class="row">
			<div class="col-md-3">

				<!-- Profile Image -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle"
							src="../../dist/img/user4-128x128.jpg" alt="사진">

						<p class="text-muted text-center">아이디</p>
						<button class="btn btn-primary btn-sm">쪽지 보내기</button>
						<!-- 						<button class="btn btn-success btn-sm">친구 추가</button> -->
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!--         /.col -->
			<div class="col-md-9">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#userlist" data-toggle="tab"
							aria-expanded="true">유저목록[${usercount}]</a></li>
						<li class=""><a href="#userinfo" data-toggle="tab"
							aria-expanded="false">유저상세정보</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="userlist">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="25%">userid</th>
										<th width="25%">username</th>
										<th width="25%">userpoint</th>
										<th width="25%">상세정보</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${userlist }" var="user">
										<tr>
											<td>${user.userid }</td>
											<td>${user.username }</td>
											<td><span class="badge">${user.userpoint }</span></td>
											<td><input type="button" id="button_1"
												class="btn btn-warning btn-xs btn-flat each-button"
												value="수정" data-toggle="modal" data-target="#userInfoModal"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 페이징 -->
							<div align="center">
								<ul class="pagination">

									<c:if test="${pageMaker.prev }">
										<li><a
											href="${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a href="${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="${pageMaker.makeSearch(pageMaker.endPage + 1)}">&raquo;</a></li>
									</c:if>

								</ul>
								console.log(${pageMaker.startPage});
								console.log(${pageMaker.endPage});
								console.log(${pageMaker.cri.page});



							</div>

						</div>
						<!--               /.tab-pane -->

						<!-- 회원정보 창 -->
						<div id="userInfoModal" class="modal modal-primary fade"
							role="dialog" >
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content" >


									<!-- 유저상세정보 -->
									<form action="" ></form>
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">ID</h4>
									</div>
									<div class="modal-body" data-selectuser>
										<label id="selectedid" class="form-control">${user.userid}
											id긁기</label>
									</div>

									<div class="modal-header">
										<h4 class="modal-title">이름</h4>
									</div>
									<div class="modal-body" data-rno>
										<label id="selectedname" class="form-control">${user.username}
											이름긁기</label>
									</div>

									<div class="modal-header">
										<h4 class="modal-title" id="usersid-modal">가입일</h4>
									</div>
									<div class="modal-body" data-rno>
										<label id="selectedemail" class="form-control">${user.email}
											이메일긁기</label>
									</div>

									<div class="modal-header">
										<h4 class="modal-title" id="usersid-modal">가입일</h4>
									</div>
									<div class="modal-body" data-rno>
										<label id="selectedregdate" class="form-control">${user.regdate}
											가입일긁기</label>
									</div>

									<div class="modal-header">
										<h4 class="modal-title" id="usersid-modal">나이</h4>
									</div>
									<div class="modal-body" data-rno>
										<label id="selectedage" class="form-control">${user.userage}
											나이긁기</label>
									</div>

									<!-- 									<div class="modal-header"> -->
									<!-- 										<h4 class="modal-title" id="usersid-modal">소개</h4> -->
									<!-- 									</div> -->
									<!-- 									<div class="modal-body" data-rno> -->
									<%-- 										<label id="selectedage" class="form-control">${user.age} --%>
									<!-- 											소개긁기</label> -->
									<!-- 									</div> -->

									<!-- 템플릿 -->
									<div class="modal-footer eacch-" data-selectuser={{userid}}>
										<button type="button" class="btn btn-danger btn-flat"
											id="userRemoveBtn">삭제</button>
										<button type="button" class="btn btn-default btn-flat"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 						/.tab-pane -->
					</div>
					<!-- 					/.tab-content -->
				</div>
				<!-- 				/.nav-tabs-custom -->
			</div>
			<!-- /.col -->
		</div>
	</div>
</div>

<script type="text/javascript">
	var userid = ${user.userid};

	$('#userInfoModal').on('click', function() {
		
		console.log(userid);
		
// 		var user = $(this).parents();
// 		var selectuser = user.attr('data-selectuser');
		
// 		$('.modal-body').attr('data-selectuser', selectuser);

// 		$('#replyer-modal').val(user.find('#selectedid').text());
// 		$('#replyer-modal').text(user.find('#selectedname').text());
// 		$('#replyer-modal').text(user.find('#selectedemail').text());
// 		$('#replyer-modal').text(user.find('#selectedregdate').text());
// 		$('#replyer-modal').text(user.find('#selectedage').text());
	});
</script>
<script type="text/javascript">
	$('#button_1').on('click', function(){
		var id = ${user.userid};
		alert("클릭 ㅅㅅ");
		$.ajax({
			type : "POST",
			url : "/adminview",
			data : {userid : id},
			success : function(data){
				alert(id);
				alert("id전송성공");
			},
			error :function(data){
				alert("사망 ㅅㅅㅅ");
			}
			
		});
	});

</script>



<jsp:include page="../include/footer.jsp"></jsp:include>