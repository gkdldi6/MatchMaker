<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Box Comment -->
<div class="box-widget">
	<div class="box-header with-border">
		<div class="user-block">
			<img class="img-circle" src="/resources/img/court-icon.jpg"	alt="court Image"> 
			<span id="cname" class="username"></span> 
			<span id="address" class="description"></span>
		</div>
		<!-- /.user-block -->
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		
		<img alt="코트 사진" width="200" height="200"></img><br>
		

		<b>코트 내용</b>
		<p id="ccontent"></p>


		<!-- Social sharing buttons -->
		<button type="button" class="btn btn-default btn-xs">
			<i class="fa fa-thumbs-o-up"></i> Like
		</button>
		<span class="pull-right text-muted">45 likes - 2 comments</span>
	</div>
	<!-- /.box-body -->

	<div class="box-footer box-comments">
		
		<div class="box-comment">
			<!-- User image -->
			<img class="img-circle img-sm" src="/resources/img/user.jpg" alt="User Image">
			
			<div class="comment-text">
				<span class="username"> Maria Gonzales 
					<span class="text-muted pull-right">8:03 PM Today</span>
				</span>
				<!-- /.username -->
				It is a long established fact that a reader will be distracted by
				the readable content of a page when looking at its layout.
			</div>
			<!-- /.comment-text -->
		</div>
		<!-- /.box-comment -->

	</div>
</div>
<!-- /.box -->