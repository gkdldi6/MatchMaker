var list;
var courtNo;
var sidebar = $('#sidebar');
var xsize = 400;
var activeTab = '#tab_1';

/*화면 크기에 맞게 지도 크기 변경*/
$('#map').css('width', $(window).width() - xsize);
$('#map').css('height', $(window).height() - 50);

$(window).resize(function() {
	$('#map').css('width', $(window).width() - xsize);
	$('#map').css('height', $(window).height() - 50);		
});

function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}

/* 다음 지도 API */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.611362040343465, 127.0059800242873), // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
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

/*마커를 저장할 배열*/
var markers = [];

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
/*if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
    	
        var lat = position.coords.latitude, // 위도
            lng = position.coords.longitude; // 경도
        
        var latlng = new daum.maps.LatLng(lat, lng);

    	// 생성된 마커를 지웁니다.
    	removeMarker();	
        
       	// 마커를 사용자 위치에 표시
       	displayMarker(latlng, 'user');
       	
       	map.setCenter(latlng);
      });
} else {
    alert('위치 정보를 얻어오지 못했습니다.');
}*/

// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
daum.maps.event.addListener(map, 'click', function () {
	closeSbar();
	console.log(markers);
});

printCourts('/courts');

/* 컨트롤러를 통해 DB에서 농구 코트 좌표를 가져온다. */
function printCourts(url) {
	$.getJSON(url, function(data) {
		getCourts(data);
		
		// 지도 범위 객체 생성
		var bounds = new daum.maps.LatLngBounds(); 
		
		// 생성된 마커를 지웁니다.
		removeMarker();	
		
		for (var i = 0; i < data.length; i ++) {
			    var position = new daum.maps.LatLng(data[i].lat, data[i].lng);
			    var cno = data[i].cno;
			    
				// 마커를 생성합니다
			    displayMarker(position, 'court', cno);
			    
			    // 좌표를 범위에 추가
			    bounds.extend(position);
			    
			    // 마커에 표시할 인포윈도우를 생성합니다 
			    /*var infowindow = new daum.maps.InfoWindow({
			        content: cno + ': ' + addr // 인포윈도우에 표시할 내용
			    });*/
			
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    /*daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));*/
			    
			    map.setBounds(bounds);
		}
	});
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
/*function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}*/

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
/*function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}*/

function displayMarker(position, content, cno) {
	var imageSrc, imageSize, imageOption;
	
	if(content === 'user') {
		imageSrc = '/resources/img/user-on-map.png',    
	    imageSize = new daum.maps.Size(60, 54),
	    imageOption = {offset: new daum.maps.Point(27, 69)};
	} else if(content === 'court') {
		imageSrc = '/resources/img/myMarker.png',
	    imageSize = new daum.maps.Size(35, 38),
	    imageOption = {offset: new daum.maps.Point(27, 69)};
	}
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);

    // 마커를 생성합니다
	var marker = new daum.maps.Marker({
        map: map,
        position: position, // 마커의 위치
        image: markerImage
    });
	
	marker.cno = cno;
	markers.push(marker);
	
	// 마커에 등록할 클릭 이벤트
	daum.maps.event.addListener(marker, 'click', openSidebar(cno));
    
    /*var infowindow = new daum.maps.InfoWindow({
        content: '현재 위치'
    });*/
    
	/*daum.maps.event.addListener(marker, 'mouseover', userOver(infowindow, map, marker));
    daum.maps.event.addListener(marker, 'mouseout', userOut(infowindow));*/
}
	
	// 현재 활성화된 탭 저장
	$('.nav-tabs').on('click', 'a', function() {
		activeTab = $(this).attr('href');
	});

	// 목록에서 코트 클릭시
	$('#search-body').on('click', '.info-box-content', function() {
		var cno = $(this).attr('cno');
		getCourt(cno);
	});
	
	// 뒤로 버튼
	$('#back').click(function() {
		$(activeTab).addClass('active');
		$('#tab_0').removeClass('active');
	});
	
	// ajax로 RestController에서 코트 정보를 호출
	function getCourt(cno) {
		$.getJSON('/courts/' + cno, function(data) {
			/*if(data.writer === 'admin') {
				$('#cname').text('관리자');
			} else {
				$('#cname').text(data.writer);
			}*/
			$('#cname').text(data.title);
			$('#address').text(data.address);
			$('#ccontent').text(data.content);
			$('#liked').text(data.liked);
			$('#replycnt').text(data.replycnt);
			
			$('#tab_0').addClass('active');
			$(activeTab).removeClass('active');
		});
	};
	
	$('#likeCourt').click(function() {
		// 좋아요 올리기
	});
	
	function test(cno) {
		return function() {
			console.log(cno);
		};
	};

	function removeMarker() {
		for(i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = new Array();
	};

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
	
/*getGames();

function getGames() {
	$.getJSON('/courts/games', function(games) {
		var templateObj = $('#gameTemplate');
		var target = $('.timeline');
		
		var template = Handlebars.compile(templateObj.html());
		var html = template(games);
//			$('.eachRoom').remove();
		target.append(html);
	});
}*/

function getCourts(data) {
	var templateObj = $('#courtTemplate');
	var target = $('#search-body');
	
	var template = Handlebars.compile(templateObj.html());
	var html = template(data);
//			$('.eachRoom').remove();
	target.append(html);
}
