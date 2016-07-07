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
									<c:forEach items="${userlist}" var="user">
										<tr>
											<td>${user.userid }</td>
											<td>${user.username}</td>
											<td><span class="badge">${user.userpoint}</span></td>
											<td><a href="adminview?${user.userid}" id="button"
												class="btn btn-warning btn-xs btn-flat each-button">수정</a></td>
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
					<div class="tab-pane" id="userUpdate">
						<!-- 회원 가입 -->
						<form action=update method="post" name="form"
							class="form-horizontal" onsubmit="return joinCheck();">
							<legend>내 정보</legend>

							<div class="form-group">
								<label for="inputId" class="col-lg-2 control-label">아이디</label>
								<div class="col-lg-10">
									<input type="text" name="userid" class="form-control"
										id="userid" value="${login.userid}" readonly></input>
								</div>
							</div>

							<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
								<div class="col-lg-10">
									<input type="password" name="userpw" class="form-control"
										id="userpw" placeholder="변경할 비밀번호를 입력해주세요." required>
								</div>
							</div>

							<div class="form-group">
								<label for="inputPasswordCheck" class="col-lg-2 control-label">비밀번호
									확인</label>
								<div class="col-lg-10">
									<input type="password" name="userpwCheck" class="form-control"
										id="userpwCheck" onblur="passwordCheck()"
										placeholder="변경할 비밀번호를 다시 입력해주세요." required>
									<div id="messagepwfail" style="color: #ff0000"></div>
									<div id="messagepwsuccess" style="color: #0000ff"></div>
								</div>
							</div>

							<div class="form-group">
								<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
								<div class="col-lg-10">
									<input type="email" name="email" class="form-control"
										id="email" value="${login.email}">
								</div>
							</div>

							<div class="form-group">
								<label for="inputName" class="col-lg-2 control-label">이름</label>
								<div class="col-lg-10">
									<input type="text" name="username" class="form-control"
										id="username" value="${login.username}">
								</div>
							</div>

							<div class="form-group">
								<label for="inputAge" class="col-lg-2 control-label">나이</label>
								<div class="col-lg-10">
									<input type="number" name="userage" class="form-control"
										id="userage" value="${login.userage}">
								</div>
							</div>

							<div class="form-group">
								<label for="textArea" class="col-lg-2 control-label">자기
									소개</label>
								<div class="col-lg-10">
									<textarea class="form-control" name="userinfo" rows="3"
										id="userinfo" style="resize: none">${login.userinfo}</textarea>
								</div>
							</div>

							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button class="btn btn-warning btn-flat">수정</button>
									<a id="delete" class="btn btn-danger btn-flat">탈퇴</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<script>
					$('#delete').click(function() {
						$('form').attr('action', 'delete');
						$('form').submit();
					});
					function passwordCheck() {
						if ($('#userpw').val() != $('#userpwCheck').val()) {
							alert("비밀번호가 서로 일치 하지 않습니다.");
							$('#userpw').focus();
							document.getElementById("messagepwsuccess").innerHTML = "";
							document.getElementById("messagepwfail").innerHTML = "비밀번호가 일치 하지 않습니다.";
							return false;
						} else {
							document.getElementById("messagepwfail").innerHTML = "";
							document.getElementById("messagepwsuccess").innerHTML = "비밀번호가 일치 합니다.";
							return true;
						}
					}

					function joinCheck() {
						if ($('#userpw').val() != $('#userpwCheck').val()) {
							alert("비밀번호가 서로 일치 하지 않습니다.");
							$('#userpw').focus();
							document.getElementById("messagepwsuccess").innerHTML = "";
							document.getElementById("messagepwfail").innerHTML = "비밀번호가 일치 하지 않습니다.";
							return false;
						}
					}
				</script>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var userid = $
	{
		user.userid
	};

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
	/* $('#button').on('click', function() {
		inputObjArr = document.getElementsByTagName("input");
		inputObjArr.getAttribute("type") == "text"
		var id = ${user.userid};
		alert("클릭 ㅅㅅ");
		$.ajax({
			type : "POST",
			url : "/adminview",
			data : {
				"userid" : id.val()
			},
			success : function(data) {
				alert(id);
				alert("id전송성공");
			},
			error : function(data) {
				alert("사망 ㅅㅅㅅ");
			}

		});
	}); */
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>