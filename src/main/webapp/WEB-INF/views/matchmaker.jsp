<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"></jsp:include>
<style>
.circle {
	background: rgb(255,255,255);
	border-radius: 100%;
	cursor: pointer;
	position: relative;
	margin: 0 auto;
	width: 15em; 
	height: 15em;
	overflow: hidden;
	transform: translateZ(0);
}

.circle h1 {
	color: rgba(189, 185, 199,0);
	font-family: 'Lato', sans-serif;
	font-weight: 900;
	font-size: 1.6em;
	line-height: 8.2em;
	text-align: center;
	text-transform: uppercase;
	-webkit-font-smoothing: antialiased;
	user-select: none;
	transition: color 0.8s ease-in-out;
}

.circle:before,
.circle:after {
	border-radius: 100%;
	content:"";
	position: absolute;
	top: 0; 
	left: 0;
	width: inherit; 
	height: inherit;			
	box-shadow: inset 10.6em 0 0 rgba(30, 140, 209, 0.2), 
	            inset 0 10.6em 0 rgba(30, 140, 209, 0.2), 
	            inset -10.6em 0 0 rgba(30, 140, 209, 0.2), 
	            inset 0 -10.6em 0 rgba(30, 140, 209, 0.2);
	transition: box-shadow 0.75s;
}

/* We rotate the :after pseudo-element to get the edge from the corner, we could also just do that with box-shadows. */

.circle:after  {
	transform: rotate(45deg);
}

/* There is no problem using "pseudo-class + pseudo-element" :) */

.circle:hover:before,
.circle:hover:after  {
	box-shadow: inset 0.86em 0 0 rgba(255, 0, 0, 0.5), 
	            inset 0 0.86em 0 rgba(252, 150, 0, 0.5), 
	            inset -0.86em 0 0 rgba(0, 255, 0, 0.5),	
	            inset 0 -0.86em 0 rgba(0, 150, 255, 0.5);
}

.circle:hover > h1  {
	color: rgba(185, 185, 185,1);
}

.codrops {
	padding: 10px;
}
</style>

	<div id="jumbo1" class="jumbotron">
		<div class="container">
			<div class="inJumbo">
				<h1>매치메이커</h1><br>
			</div>
		</div>
	</div>

	<div class="container">

		<div class="row">
			<div class="col-md-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="200x200"
					src="/resources/img/ex01.png"
					data-holder-rendered="true">
			</div>
			<div class="col-md-6">
				<div class="page-header">
					<h1>완벽한 코트 검색 기능</h1>
				</div>
				<p>
					사용되지 않는 농구코트를 찾아보세요!
				</p>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 placeholder visible-sm-block visible-xs-block">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="200x200"
					src="/resources/img/land.png"
					data-holder-rendered="true">
			</div>
			<div class="col-md-6">
				<div class="page-header">
					<h1>완벽한 반응형 웹 지원</h1>
				</div>
				<p>
					매치메이커는 반응형 웹을 지원한답니다~
				</p>
			</div>
			<div class="col-md-3 placeholder hidden-sm hidden-xs">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="200x200"
					src="/resources/img/ex02.png"
					data-holder-rendered="true">
			</div>
		</div>

		<div class="row">
			<div class="col-md-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="200x200"
					src="/resources/img/ex03.png"
					data-holder-rendered="true">
			</div>
			<div class="col-md-6">
				<div class="page-header">
					<h1>강력한 커뮤니티 기능</h1>
				</div>
				<p>
					코트에 댓글을 남겨 소통할 수 있습니다! 소! 통!
				</p>
			</div>
		</div>

	</div>

	<div id="jumbo2" class="jumbotron">
		<div class="container">
			<div class="inJumbo" style="background-color: rgba(0, 0, 0, 0.5);">
				<h1>만든 사람들</h1><br>
			</div>
		</div>
	</div>

		<div class="container">
			<div class="codrops col-md-4 col-sm-6">
				<div class="circle">
					<h1>정진규</h1>
				</div>
			</div>
			<div class="codrops col-md-4 col-sm-6">
				<div class="circle">
					<h1>김선중</h1>
				</div>
			</div>
			<div class="codrops col-md-4 col-sm-6">
				<div class="circle">
					<h1>김수현</h1>
				</div>
			</div>

			<div class="codrops col-md-4 col-sm-6">
				<div class="circle">
					<h1>김용석</h1>
				</div>
			</div>
			<div class="codrops col-md-4 col-sm-6">
				<div class="circle">
					<h1>전영태</h1>
				</div>
			</div>
		</div>
		
	<div id="jumbo3" class="jumbotron" style="margin-bottom:0px">
		<div class="container">
			<div class="inJumbo">
				<h1>문의 및 찾아오는 길</h1><br>
			</div>
		</div>
	</div>
	
	<!-- 문의하기 -->
	<div id="map" style="height:400px;margin-bottom:30px"></div>
	<div class="container">
		<form class="form-horizontal">
			<fieldset>
				<legend>문의하기</legend>
				<div class="form-group">
					<label class="col-lg-2 control-label">이메일</label>
					<div class="col-lg-10">
						<input type="text" class="form-control"
							placeholder="이메일 주소를 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">작성자</label>
					<div class="col-lg-10">
						<input type="text" class="form-control" placeholder="작성자를 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">문의 내용</label>
					<div class="col-lg-10">
						<textarea class="form-control" rows="3" id="textArea" style="resize:none"></textarea>
						<span class="help-block">문의할 내용을 입력해주세요.</span>
					</div>
				</div>
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button type="submit" class="btn btn-primary">전송</button>
						<button type="reset" class="btn btn-default">다시</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>



<!-- 다음 지도 API -->
<script	src="//apis.daum.net/maps/maps3.js?apikey=55e0d519a9b6c3ce803115407c5ce276&libraries=services"></script>
<script type="text/javascript">
/* 다음 지도 API */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.47880193503217, 126.88130982449914), // 지도의 중심좌표
        level: 2, // 지도의 확대 레벨
        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
    };

// 지도를 생성한다 
var map = new daum.maps.Map(mapContainer, mapOption);

//지도에 마커를 생성하고 표시한다
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.47880193503217, 126.88130982449914), // 마커의 좌표
    map: map // 마커를 표시할 지도 객체
});
</script>
<jsp:include page="include/footer.jsp"></jsp:include>