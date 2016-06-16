<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<jsp:include page="../include/header.jsp"></jsp:include>
<head>
<title>쪽지</title>
</head>
<style>
.container {
	padding-top: 25px;
}
tbody tr:hover {
	background-color: #00c0ef;
	color: white;
}
.title:hover {
	text-decoration: underline;
}
</style>
<body>
<div class="container">

	<div class="row">
		<h1 class="text-center" style="color: #3c8dbc;">
			<b>자유 게시판</b>
		</h1>
	</div>
	
	<div class="row">
		<div class="box-body table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th width="70">쪽지번호</th>
						<th>메시지</th>
						<th width="120">보내는사람</th>
						<th width="120">받는사람</th>
						<th width="140">작성날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="MessageVO">
						
						<tr>
							<td>${MessageVO.mid}</td>
							<td>${MessageVO.message}</td>
							<td>${MessageVO.sender}</td>
							<td>${MessageVO.targetid}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${MessageVO.senddate}" /></td>
							<%-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${MessageVO.opendate}" /></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 쪽지 보내기, 검색 버튼 -->
	<div class="row">
		<div class="col-xs-3">
			<a href="messages/write" class="btn btn-primary btn-flat">쪽지 쓰기</a>
		</div>
	</div>

</div>

	
</body>
</html>



<jsp:include page="../include/footer.jsp"></jsp:include>