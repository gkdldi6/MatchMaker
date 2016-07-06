var list;
var courtNo;
var sidebar = $('#sidebar');
var xsize = 400;
var activeTab = '#tab_1';
var position = $('.main-header').offset();
var myPosition;
var myLocation;
var courtList = {};

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

//지도 범위 객체 생성
var bounds = new daum.maps.LatLngBounds(); 

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다
if (navigator.geolocation) {
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        var lat = position.coords.latitude, // 위도
            lng = position.coords.longitude; // 경도
        
        var latlng = new daum.maps.LatLng(lat, lng);
        myPosition = latlng;
        
        console.log(myPosition);
    });
} else {
    alert('위치 정보를 얻어오지 못했습니다.');
}

// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
daum.maps.event.addListener(map, 'click', function () {
	closeSbar();
	console.log(markers);
});

/* 농구 코트 마커를 생성 */
function printCourts(data) {
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

	// 배열에 마커 등록
	markers.push(marker);

	// 내위치 마커는 여기까지 하고 나감
	if(content === 'user') {
		return;
	}
	
	// 마커 객체에 cno속성 추가
	marker.cno = cno;
	
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
		console.log(cno);
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
			$('aside').animate({ scrollTop : position.top }, 100);
		});
	};
	
	$('#likeCourt').click(function() {
		// 좋아요
	});
	
	/*생성된 마커를 지운다.*/
	function removeMarker() {
		for(i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = new Array();
	};

	/*function userOver(infowindow, map, marker) {
		return function() {
			infowindow.open(map, marker);
		}
	}
	
	function userOut(infowindow) {
		return function() {
			infowindow.close();
		}
	}*/
	
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

	target.append(html);
}

/*$('aside').scroll(function() {
    
    var scrollHeight = $('aside').scrollTop() + $(window).height();
    var documentHeight = $('.tab-content').height();
   
    if(scrollHeight > documentHeight) {
    	printCourts('/courts?pageidx=' + pageidx);
    }
 });*/

// 코트 목록에 있는 더보기 기능입니다.
$('#moreCourts').click(function() {
	courtList.pageidx += 10;
	getCourtList();
});

//지도에 표시할 원을 생성합니다
var circle = new daum.maps.Circle({
		center : new daum.maps.LatLng(33.450701, 126.570667),  // 원의 중심좌표 입니다 
        radius: 50, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 5, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.7  // 채우기 불투명도 입니다   
});

//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
    
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

	var keyword = $('#keyword').val();
	if(keyword === '내위치') {
		myLocation = 1;
	}
	
	var distance = $('#distance option:selected').val();
	if(distance === 'input') {
		distance = $('#dis-input').val();
	}

	// 반경을 설정
	circle.setOptions({
	    radius: distance
	});
	
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {
    		
    	// 초기화
        initCourtList();
    	
    	var center;
    	
    	if(myLocation === 1) {
    		center = myPosition;
    		
    		circle.setOptions({
	        	center: center
	        });
    		
    		// 내위치
            displayMarker(center, 'user');
    		
    		myLocation = 0;
    	} else {
    		center = new daum.maps.LatLng(data.places[0].latitude, data.places[0].longitude);
            
            // 중심 좌표를 설정
            circle.setOptions({
            	center: center
            });
    	}
    	
        // 지도에 원을 표시합니다 
        circle.setMap(map); 
        
        var cbounds = circle.getBounds();
        var sw = cbounds.getSouthWest();
        var ne = cbounds.getNorthEast();
        
        // 검색값 세팅
        courtList.radius = 'Y';
        courtList.swlat = sw.getLat();
        courtList.swlng = sw.getLng();
        courtList.nelat = ne.getLat();
        courtList.nelng = ne.getLng();
        
        // 세팅된 값으로 불러오기
        getCourtList();
        
        // 검색된 장소 위치를 기준으로 지도 중심 좌표를 설정
        map.setCenter(center);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 코트 검색 함수
function getCourtList() {
	$.getJSON('/courts', courtList, function(data) {
		getCourts(data);
		printCourts(data);
		
		if(data.length < 10) {
			alert('마지막 페이지입니다.');
			$('#moreCourts').hide();
		}
	});
};

// 검색 결과 초기화
function initCourtList() {
	courtList.pageidx = 0;
	courtList.radius = undefined;
	removeMarker();
	$('#search-body').text('');
	$('#moreCourts').show();
};

// 전체 코트 검색
$('#getAll').click(function() {
	circle.setMap(null);
	initCourtList();
	getCourtList();
});

// 상세 검색 상태
var detailState = 0;

// 상세 검색 열고 닫기 구현 및 열고 닫을때 검색 가능 여부 변경
$('#detail').click(function() {
	if(detailState === 0) {
		$('#detail-space').show();
		detailState = 1;
	} else {
		$('#detail-space').hide();
		$('#detail-space input:checked').removeAttr('checked');
		
		courtList.free = undefined;
		courtList.outer = undefined;
		courtList.full = undefined;
		courtList.ground = undefined;
		courtList.shower = undefined;
		courtList.parking = undefined;
		
		detailState = 0;
	}
});

// 거리 직접입력이면 input 생성
$('#distance').change(function() {
	var selectval = $('#distance option:selected').val();

	if(selectval === 'input') {
		$('#dis-input').attr('type', 'text');
	} else {
		$('#dis-input').attr('type', 'hidden');
	}
});

// 상세검색 라디오버튼 값 추적
$('#detail-space input:radio').change(function() {
    var radioname =  $(this).attr('name');
    
	if(radioname === 'free') {
		courtList.free = $(this).val();
	} else if(radioname === 'full') {
		courtList.full = $(this).val();
	} else if(radioname === 'outer') {
		courtList.outer = $(this).val();
	} else if(radioname === 'ground') {
		courtList.ground = $(this).val();
	} else if(radioname === 'shower') {
		courtList.shower = $(this).val();
	} else if(radioname === 'parking') {
		courtList.parking = $(this).val();
	}
  });