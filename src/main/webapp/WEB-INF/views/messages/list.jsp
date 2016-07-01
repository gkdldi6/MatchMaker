<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<html>
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
				<b>쪽지</b>
			</h1>
		</div>

		<div class="row">
			<div class="box-body table-responsive">
				<table class="table" id="messagetable">
					<thead>
						<tr>
							<th width="70"><input type="checkbox" name="all"
								class="check-all"></th>
							<th width="120">보낸사람</th>
							<th>메시지</th>
							<th width="140">작성날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="MessageVO">
							<tr>
								<td><input type="checkbox" name="checkbox"
									value="${MessageVO.mno}" class="ab"></td>
								<td>${MessageVO.sender}</td>
								<td><a href="/messages/read?mno=${MessageVO.mno}">${MessageVO.message}</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${MessageVO.senddate}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 쪽지 쓰기, 쪽찌 삭제 버튼 -->
		<div class="row">
			<div class="col-xs-3">
				<a href="messages/write" class="btn btn-primary btn-flat">쪽지 쓰기</a>
				<button class="btn btn-primary btn-flat" id="delete">삭제</button>
			</div>
		</div>

		<!-- 페이지 -->
		<div align="center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a href="messages?page=${pageMaker.startPage - 1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="messages?page=${idx}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="messages?page=${pageMaker.endPage + 1}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>

	</div>

</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$(".check-all").click(function() {
			$(".ab").prop("checked", this.checked);
		});
	});

	var result = '${msg}';

	if (result === 'sendsuccess') {
		alert('쪽지 전송에 성공 하였습니다.');
	} else if (result == 'sendfail') {
		alert('쪽지 전송에 실패 하였습니다.');
	} else if (result == 'removesucess') {
		alert('쪽지를 삭제 하였습니다.');
	}

	$('#delete').on("click", function() {
		inputObjArr = document.getElementsByTagName("input"); // input 시작태그 객체들
		alertStr = ""; // 체크박스 id, name, value, 체크상태 경고창 알림용
		cnt = 0;
		for (i = 0; i < inputObjArr.length; i++) {
			if (inputObjArr[i].getAttribute("type") == "checkbox" && inputObjArr[i].value != "on" 
					&& inputObjArr[i].checked ==true) { // 체크박스만
				$.ajax({
					url : '/messages/remove',
					type : 'POST',
					data : {"mno" : inputObjArr[i].value},
					success : function(data) {
						//alert('쪽지가 삭제되었습니다.');						
					},
					error : function(data){
						alert("삭제하나도안됨");
					},
				});
				cnt++;
			}
		}
		if(cnt > 0){
			alert("쪽지가 삭제 되었습니다.");
			document.location.reload();
		}else{
			alert("선택된 체크박스가 없습니다.");
		}
	});
</script>
<jsp:include page="../include/footer.jsp"></jsp:include>