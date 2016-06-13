<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<title>쪽지</title>
</head>
<body>
	<div class="row">
		<div class="box-body table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th width="70">글번호</th>
						<th>제목</th>
						<th width="120">작성자</th>
						<th width="140">작성날짜</th>
						<th width="70">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="board">
						<tr>
							<td>${board.bno }</td>
							<td class="title" onclick="location.href='/boards/' 
								+ '${board.bno}' + '${pageMaker.makeSearch(pageMaker.cri.page)}'">${board.title } 
								<span class="badge">${board.replycnt}</span>
							</td>						
							<td>${board.writer }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${board.regdate }" /></td>
							<td><span class="badge">${board.hit }</span></td>
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



	
</body>
</html>

<jsp:include page="../include/footer.jsp"></jsp:include>