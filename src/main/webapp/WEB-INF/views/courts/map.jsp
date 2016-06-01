<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>


<!-- 사이드바 시작  -->
<div id="sidebar" state>
<aside class="control-sidebar control-sidebar-light">
	<div class="nav-tabs-custom">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="false">Tab 1</a></li>
			<li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Tab 2</a></li>
			<li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="true">Tab 3</a></li>
			<li class="dropdown">
				<a class="dropdown-toggle"	data-toggle="dropdown" href="#" aria-expanded="false">Dropdown 
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Action</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Another action</a></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Something else here</a></li>
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a role="menuitem" tabindex="-1"
						href="#">Separated link</a></li>
				</ul>
			</li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab_1">
				<ul class="timeline">

					<!-- timeline time label -->

					<!-- /.timeline-label -->

					<!-- timeline item -->

					<li><i class="fa fa-comments bg-yellow"></i>

						<div class="timeline-item">

							<div class="box flat box-warning box-solid collapsed-box">
								<div class="box-header with-border">
									<span class="time"><i class="fa fa-clock-o"></i> 27분전</span>
									<h3 class="box-title">1:1 빨리와</h3>

									<div class="box-tools pull-right">

										<button type="button" class="btn btn-box-tool" data-widget="collapse">
											<i class="fa fa-plus"></i>
										</button>
									</div>
									<!-- /.box-tools -->

								</div>
								<!-- /.box-header -->
								<div class="box-body" style="display: none;">테스트</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="button" class="btn btn-default btn-sm btn-flat">참가하기</button>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- 탭1 끝 -->
			
			<div class="tab-pane" id="tab_2">
				<jsp:include page="court-page.jsp"></jsp:include>
			</div>
			<!-- 탭2 끝 -->
			
			<div class="tab-pane" id="tab_3">
				<jsp:include page="court-page.jsp"></jsp:include>
			</div>
			<!-- 탭3 끝 -->
			
		</div>
		<!-- /.tab-content -->
	</div>
</aside>
<!-- The sidebar's background -->
<!-- This div must placed right after the sidebar for it to work-->
<div class="control-sidebar-bg"></div>
</div>
<!-- 사이드바 끝 -->

<!-- 지도가 표시될 공간 -->
<div class="container" align="center">
	<div id="map" style="width:83%;height:680px"></div>
</div>


<script src="//apis.daum.net/maps/maps3.js?apikey=55e0d519a9b6c3ce803115407c5ce276"></script>
<script type="text/javascript">
	var list;
	var courtNo;
	var sidebar = $('#sidebar');
	
	
	/* 컨트롤러를 통해 DB에서 농구 코트 좌표를 가져온다. */
	$.getJSON('/courts/all', function(data) {
		list = data;
	});
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	
	        var lat = position.coords.latitude, // 위도
	            lng = position.coords.longitude; // 경도
	        
	        var locPosition = new daum.maps.LatLng(lat, lng);
	            
        	// 마커를 사용자 위치에 표시
        	displayMarker(locPosition);
	      });
	} else {
	    console.log('위치 정보를 얻어오지 못했습니다.');
	}
	
		/* 다음 지도 API */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.611362040343465, 127.0059800242873), // 지도의 중심좌표
		        level: 9, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도의 상단 좌측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPLEFT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 좌측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.LEFT);

		// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
		daum.maps.event.addListener(map, 'click', function (mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
		});
		
		var imageSrc = '/resources/img/myMarker.png', // 마커이미지의 주소입니다    
	    imageSize = new daum.maps.Size(35, 38), // 마커이미지의 크기입니다
	    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
		
$(function() {
for (var i = 0; i < list.length; i ++) {
	var cno = list[i].cno;
    var addr = list[i].address;
	
	// 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new daum.maps.LatLng(list[i].lat, list[i].lng), // 마커의 위치
        image: markerImage
    });

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new daum.maps.InfoWindow({
        content: cno + ': ' + addr // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    daum.maps.event.addListener(marker, 'click', openSidebar(cno, addr));
}
})

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

function openSidebar(cno, addr) {
	return function() {
		if(sidebar.attr('state') === 'opened' && courtNo === cno) {
			$('.control-sidebar-bg, .control-sidebar').css('right', '-400px');
			sidebar.attr('state', 'closed');
		} else {
			$('.control-sidebar-bg, .control-sidebar').css('right', '0px');
			sidebar.attr('state', 'opened');
			
			$('#cno').text(cno);
			$('#address').text(addr);
			
			courtNo = cno;
		}
	};
}

function displayMarker(locPosition) {
	var imageSrc = '/resources/img/user-on-map.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(60, 54), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition,
        image: markerImage
    }); 
    
    var infowindow = new daum.maps.InfoWindow({
        content: '현재 위치'
    });
    
    daum.maps.event.addListener(marker, 'mouseover', userOver(infowindow, map, marker));
    
    daum.maps.event.addListener(marker, 'mouseout', userOut(infowindow));
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);
}

	function userOver(infowindow, map, marker) {
		return function() {
			infowindow.open(map, marker);
		}
	}
	
	function userOut(infowindow) {
		return function() {
			infowindow.close();
		}
	}
	
</script>

<!-- 타임라인 템플릿 -->
<script id="template" type="text/x-handlebars-template">
	{{#each .}}
		<div class="col-lg-10 col-lg-offset-2 each-reply" data-rno={{rno}}>
			<div class="panel panel-warning">
				<div class="panel-heading">
   					<h3 class="panel-title" id="replyer-list">{{replyer}}</h3>
 				</div>
 				<div class="panel-body">
 					<div id="replytext-list">{{replytext}}</div>
					<div><br><input type="button" class="btn btn-warning btn-xs btn-flat each-button"
									value="수정" data-toggle="modal" data-target="#modifyModal">
					</div>
				</div>
			</div>
		</div>
	{{/each}}
</script>


<jsp:include page="../include/footer.jsp"></jsp:include>
