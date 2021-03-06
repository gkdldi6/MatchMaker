<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<div class="content-wrapper">
	<div class="lockscreen-wrapper">
	  <!-- User name -->
	  <div class="lockscreen-name text-center">${login.userid }</div>
	
	  <!-- START LOCK SCREEN ITEM -->
	  <div class="lockscreen-item">
	    <!-- lockscreen image -->
	    <div class="lockscreen-image">
	      <img src="/resources/img/user.jpg" alt="User Image">
	    </div>
	    <!-- /.lockscreen-image -->
	
	    <!-- lockscreen credentials (contains the form) -->
	    <form class="lockscreen-credentials" action="lock" method="post">
	      <div class="input-group">
	      	<input type="hidden" value="${login.userid }" name="userid">
	        <input type="password" class="form-control" placeholder="비밀번호" name="userpw">
	        <div class="input-group-btn">
	          <button class="btn"><i class="fa fa-arrow-right text-muted"></i></button>
	        </div>
	      </div>
	    </form>
	    <!-- /.lockscreen credentials -->
	
	  </div>
	  <!-- /.lockscreen-item -->
	  <div id="msg" class="help-block text-center">
	    회원 정보를 수정하거나 탈퇴하려면 비밀번호를 입력해주세요.
	  </div>
	</div>
</div>

<script>
	var fail = '${fail}';
	if(fail) {
		$('#msg').text('비밀번호가 틀렸습니다.');
	}		
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>