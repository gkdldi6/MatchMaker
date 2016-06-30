var list;
var courtNo;
var sidebar = $('#sidebar');
var xsize = 400;


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
	closeSbar();
	console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
});

var imageSrc = '/resources/img/myMarker.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(35, 38), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
     
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);

/* 컨트롤러를 통해 DB에서 농구 코트 좌표를 가져온다. */
$.getJSON('/courts/all', function(data) {
	list = data;
		for (var i = 0; i < list.length; i ++) {
			var cno = list[i].cno;
		    var addr = list[i].address;
		    var cname = list[i].cname;
		    var ccontent = list[i].ccontent;
		    
			
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
		    daum.maps.event.addListener(marker, 'click', openSidebar(cno, addr, cname, ccontent));
		}
});

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
	