<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<style>
.container {
	padding-top: 30px;
}

input[readonly] {
	border: 0px;
}

input:read-only, #textArea:read-only {
	background-color: white !important;
}

#textArea {
	resize: none;
}

.container {
	background-color: white;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="content-wrapper">

	<!-- 글읽기 폼 -->
	<div class="container">
		<div class="form-horizontal">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">글읽기</legend>
				<div class="form-group">

					<label for="ano" class="col-lg-2 control-label">글번호</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.ano }"
							name="ano" readonly>
					</div>
				</div>

				<div class="form-group">
					<label for="writer" class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.writer }"
							name="writer" readonly>
					</div>
				</div>

				<div class="form-group">
					<label for="title" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" value="${article.title }"
							name="title" readonly>
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<div id="content" style="padding: 20px;"></div>
					</div>
				</div>

				<div class="form-group">
					<label for="regdate" class="col-lg-2 control-label">작성 날짜</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${article.regdate }" />"
							readonly>
					</div>
				</div>

				<!-- 페이징용 파라미터 저장 폼 -->
				<form role="page" action="/boards/${bno }" method="get">
					<input type='hidden' name='page' value="${cri.page}"> <input
						type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-warning btn-flat" id="edit">수정</button>
						<button class="btn btn-primary btn-flat" id="delete">삭제</button>
						<button class="btn btn-success btn-flat" id="list">목록</button>
					</div>
				</div>
			</fieldset>
		</div>
	</div>


	<!-- 댓글 -->
	<div>

		<!-- 댓글 입력폼 -->
		<div class="container">
			<form class="form-horizontal">
				<fieldset>
					<legend class="col-lg-10 col-lg-offset-1">댓글</legend>
					<div class="form-group">
						<label for="writer" class="col-lg-2 control-label">작성자</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="replyer"
								value="${login.username }" readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="textArea" class="col-lg-2 control-label">내용</label>
						<div class="col-lg-10">
							<input type="text" class="form-control" id="replytext"
								placeholder="댓글을 입력해주세요.">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<input type="button" class="btn btn-success btn-flat"
								value="댓글 쓰기" id="new-reply">
						</div>
					</div>
				</fieldset>
			</form>

			<!-- 댓글 목록 -->
			<ul id="reply-list">
			</ul>

			<!-- 댓글 페이징 영역 -->
			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
			</div>

		</div>
	</div>


	<!-- 댓글 편집창 -->
	<div id="modifyModal" class="modal modal-primary fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="replyer-modal"></h4>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext-modal" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info btn-flat"
						id="replyModBtn">수정</button>
					<button type="button" class="btn btn-danger btn-flat"
						id="replyDelBtn">삭제</button>
					<button type="button" class="btn btn-default btn-flat"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

</div>


<!-- 댓글 템플릿 -->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<div class="col-lg-10 col-lg-offset-2 each-reply" data-rno={{rno}}>
			<div class="panel panel-warning">
				<div class="panel-heading">
   					<h3 class="panel-title" id="replyer-list">{{replyer}}</h3>
				</div>
				<div class="panel-body">
					<div id="replytext-list">{{replytext}}
				</div>
				<div><br><input type="button" class="btn btn-warning btn-xs btn-flat each-button"
								value="수정" data-toggle="modal" data-target="#modifyModal"></div>
				</div>
			</div>
		</div>
	{{/each}}
</script>


<!-- 글 처리 스크립트 -->
<script type="text/javascript">

	var ano = ${article.ano};
	var pageForm = $('form[role="page"]');
	var content = '${article.content}';

	$('#content').html(content);

	/* 목록 버튼 클릭 */
	$("#list").on("click", function() {
		pageForm.submit();
	});

	/* 삭제 버튼 클릭 */
	$("#delete").on("click", function() {

		var arr = [];
		$(".uploadedList li").each(function(index) {
			arr.push($(this).attr("data-src"));
		});

		if (arr.length > 0) {
			$.post("/deleteAllFiles", {
				files : arr
			}, function() {

			});
		}

		pageForm.attr('action', ano + '/delete');
		pageForm.attr('method', 'post');
		pageForm.submit();
	});

	/* 편집 버튼 클릭 */
	$('#edit').click(function() {
		pageForm.attr('action', ano + '/edit');
		pageForm.submit();
	});
</script>


<!-- 댓글 처리 스크립트 -->
<script type="text/javascript">
	var ano = ${article.ano};
	var bno = ${article.bno};
	var replyPage = 1;

	/* 템플릿 날짜 */
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	/* ajax로 받아온 댓글 목록들을 템플릿에 컴파일하는 함수 */
	var printData = function(replyArr, target, templateObject) {
		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".each-reply").remove();
		target.html(html);
	}

	/* 댓글 목록 및 페이지 가져오기 */
	function getReply() {
		// 		$.getJSON('/replies/' + ano + "/" + replyPage, function(data) {
		$.getJSON('/replies/' + bno + "/" + ano + "/" + replyPage, function(
				data) {
			printData(data.list, $('#reply-list'), $('#template'));
			$("#modifyModal").modal('hide');
			printPaging(data.pageMaker);
			//printPaging(dat.pageMaker, $(".pagination"));
		});
	};

	/* 댓글 페이징 이벤트 달기 */
	$(".pagination").on("click", "li a", function(event) {
		event.preventDefault();

		replyPage = $(this).attr("href");

		getReply("/replies/" + bno + "/" + ano + "/" + replyPage);
	});

	/* 댓글 페이징 처리 */
	function printPaging(pageMaker) {
		var str = "";
		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}
		//target.html(str);
		$('.pagination').html(str);
	};

	getReply();

	/* 댓글 쓰기 */
	$('#new-reply').click(function() {

		$.ajax({
			url : '/replies',
			type : 'post',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			data : JSON.stringify({
				bno : bno,
				ano : ano,
				replyer : $('#replyer').val(),
				replytext : $('#replytext').val()
			}),
			success : function(data) {
				if (data === 'success') {
					alert('댓글이 등록되었습니다.');
					replyPage = 1;
					getReply("/replies/" + bno + "/" + ano + "/" + replyPage);
					$('#replytext').val('');
				}
			}
		});
	});

	/* 이벤트 연결 */
	$('#reply-list').on('click', '.each-button', function() {
		var reply = $(this).parents('.each-reply');
		var rno = reply.attr('data-rno');

		$('.modal-body').attr('data-rno', rno);
		$('#replyer-modal').text(reply.find('#replyer-list').text());
		$('#replytext-modal').val(reply.find('#replytext-list').text());
	});

	/* 댓글 수정 */
	$('#replyModBtn').click(function() {
		var rno = $('.modal-body').attr('data-rno');

		$.ajax({
			url : '/replies/' + rno,
			type : 'put',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				replytext : $('#replytext-modal').val()
			}),
			success : function(data) {
				if (data === 'success') {
					alert('댓글이 수정되었습니다.');
					getReply();
				}
			}
		});
	});

	/* 댓글 삭제 */
	$('#replyDelBtn').click(function() {
		var rno = $('.modal-body').attr('data-rno');

		$.ajax({
			url : '/replies/' + rno,
			type : 'delete',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			success : function(data) {
				if (data === 'success') {
					alert('댓글이 삭제되었습니다.');
					getReply();
				}
			}
		});
	});
</script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" data="{{getLink}}"alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" download="{{fileName}}" class="mailbox-attachment-name">{{fileName}}</a>
	</span>
  </div>
</li>                
</script>

<script type="text/javascript" src="/resources/js/upload.js"></script>

<script>
	var ano = ${article.ano};

	var template = Handlebars.compile($("#templateAttach").html());

	$.getJSON("/boards/getAttach/" + ano, function(list) {
		$(list).each(function() {
			var fileInfo = getFileInfo(this);
			var html = template(fileInfo);

			$(".uploadedList").append(html);
		});
	});
</script>
<script>
	$(".uploadedList").on("click", ".mailbox-attachment-icon img",
			function(event) {

				var fileLink = $(this).attr("data");

				if (checkImageType(fileLink)) {

					event.preventDefault();

					var imgTag = $("#popup_img");
					imgTag.attr("src", fileLink);

					console.log(imgTag.attr("src"));

					$(".popup").show('slow');
					imgTag.addClass("show");
				}
			});

	$("#popup_img").on("click", function() {

		$(".popup").hide('slow');

	});
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>
