<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<style>
.container {
	padding-top: 30px;
}
</style>


<!-- 글쓰기 -->
<div class="container">
	<form class="form-horizontal" action="new" method="post">
		<fieldset>
			<legend class="col-lg-10 col-lg-offset-1">글쓰기</legend>
			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">작성자</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" name="writer" value="${login.username }" readonly>
				</div>
			</div>

			<div class="form-group">
				<label for="inputEmail" class="col-lg-2 control-label">제목</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" id="inputEmail"
						placeholder="제목을 입력해주세요." name="title">
				</div>
			</div>

			<div class="form-group">
				<label for="textArea" class="col-lg-2 control-label">내용</label>
				<div class="col-lg-10">
					<textarea class="form-control textarea" rows="14" id="textArea" name="content"></textarea>
				</div>
			</div>
			
			<div class="col-lg-offset-2">
				<div class="fileDrop" style="height:100px;background-color:gray">
					<label>여기에 파일을 첨부하세요.</label>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-lg-2 control-label">첨부파일</label>
				<div class="col-lg-10">
					<ul class="mailbox-attachments clearfix uploadedList" >
					</ul>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button id="write" class="btn btn-primary btn-flat">작성</button>
					<a href="/boards" class="btn btn-default btn-flat">취소</a>
				</div>
			</div>

		</fieldset>
	</form>
</div>
<!-- 끌 쓰기 끝 -->

<script type="text/javascript" src="/resources/plugins/editor/js/HuskyEZCreator.js" charset="UTF-8"></script>
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

<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "textArea",
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/resources/plugins/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["textArea"].exec("PASTE_HTML",
						[""]);
			},
			fCreator : "createSEditor2"
		});
	});
	
	$("#write").click(function(){
		oEditors.getById["textArea"].exec("UPDATE_CONTENTS_FIELD", []);
		$("#textArea").submit();
	})
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
	
	$("#write").on("click", function(){
		/* event.preventDefault(); */
		
		var that = $(this);
		
		var str ="";
		$(".uploadedList .delbtn").each(function(index){
			 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
		});
		
		that.append(str);

		/* that.get(0).submit(); */
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


<jsp:include page="../include/footer.jsp"></jsp:include>
