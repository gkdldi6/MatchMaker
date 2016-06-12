<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>

<style>
.container {
	padding-top: 30px;
}
</style>
	
	<div class="container">
		<form class="form-horizontal" action="/boards/edit" method="post">
			<fieldset>
				<legend class="col-lg-10 col-lg-offset-1">글쓰기</legend>
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" name="writer" value="${article.writer }" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">제목</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							value="${article.title }" name="title">
					</div>
				</div>

				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control textarea" rows="14" id="textArea" 
								name="content" style="resize:none">${article.content }</textarea>
					</div>
				</div>

				<input type="hidden" name="bno" value="${article.bno }">
				<input type='hidden' name='page' value="${cri.page}">
				<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
				<input type='hidden' name='searchType' value="${cri.searchType}">
				<input type='hidden' name='keyword' value="${cri.keyword}">

				<div class="col-lg-offset-2">
					<div class="fileDrop" style="height: 100px; background-color: gray">
						<label>여기에 파일을 첨부하세요.</label>
					</div>
				</div>
	
				<div class="form-group">
					<label class="col-lg-2 control-label">첨부파일</label>
					<div class="col-lg-10">
						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button class="btn btn-primary btn-flat">수정</button>
						<a class="btn btn-default btn-flat" onclick="history.go(-1)">취소</a>
					</div>
				</div>
			</fieldset>
		</form>
	</div>


<jsp:include page="../include/footer.jsp"></jsp:include>


<script type="text/javascript" src="/resources/js/upload.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" download="{{fileName}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
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

<script>
	var bno = ${article.bno};

	/* printData(data.list, $("#repliesDiv"), $('#template'));	
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr); */
	
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("/boards/getAttach/" + bno, function(list) {	
		$(list).each(function() {			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			$(".uploadedList").append(html);
		});
	});
</script>

<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		//파일 업로드 크기 제한
		if(file.size > 10485760) {
			alert("파일 업로드는 10MB까지 가능합니다.");
			return;
		}
	
		var formData = new FormData();
		
		formData.append("file", file);	
		
		
		$.ajax({
			  url: '/uploadAjax',
			  data: formData,
			  dataType:'text',
			  processData: false,
			  contentType: false,
			  type: 'POST',
			  success: function(data){				  
				  var fileInfo = getFileInfo(data);		
				  var html = template(fileInfo);
				  
				  $(".uploadedList").append(html);
			  }
			});	
	});
	
	$(".btn-primary").on("click", function(){
		/* event.preventDefault(); */
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		that.get(0).submit();
	});
</script>

<script>
	$(".uploadedList").on("click", "a:last", function(event){	
		 event.preventDefault();
	
		 console.log("delete file...............");
		 console.log($(this).attr("href"));
	
		 var that = $(this);
	
		 $.ajax({
			 url:"/deleteFile",
			 type:"post",
			 data: {fileName:$(this).attr("href")},
			 dataType:"text",
			 success:function(result){
			 if(result == "deleted"){
				 console.log("deleted......................");
				 console.log(that.closest("li").html());
				 that.closest("li").remove();
			 }
			 }
		 }); 
		});	
</script>