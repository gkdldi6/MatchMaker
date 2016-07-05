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
						<li class=""><a href="#userdelete" data-toggle="tab"
							aria-expanded="false">유저아이디 삭제</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="userlist">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th width="15%">userid</th>
										<th width="15%">username</th>
										<th width="25%">email</th>
										<th width="15%">regdate</th>
										<th width="15%">usercode</th>
										<th width="15%">userpoint</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${userlist }" var="user">
										<tr>
											<td>${user.userid }</td>
											<td>${user.username }</td>
											<td>${user.email }</td>
											<td><fmt:formatDate pattern="yy-MM-dd HH:mm"
													value="${user.regdate }" /></td>
											<td><span class="badge">${user.usercode }</span></td>
											<td><span class="badge">${user.userpoint }</span></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<!-- 페이징 -->
							<div align="center">
								<ul class="pagination">

									<c:if test="${pageMaker.prev }">
										<li><a
											href="${pageMaker.startPage}"></a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx ? 'class =active' : ''}"/>>
											<a href="${pageMaker.makeQuery(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a href="${pageMaker.endPage}+1"></a></li>
									</c:if>


								</ul>
							</div>

						</div>
						<!--               /.tab-pane -->

						<div class="tab-pane" id="userinfo">선중아 여기 부탁해 이 회원이 쓴 게시글
							출력해줘 그리고 여기에서 이 회원정보 불러올때 세션쓰면 안되</div>

						<div class="tab-pane" id="userdelete">xxxxx</div>
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


<jsp:include page="../include/footer.jsp"></jsp:include>