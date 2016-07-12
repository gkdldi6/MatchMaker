var list;
var sidebar = $('#sidebar');
var xsize = 400;
var activeTab = '#tab_1';
var position = $('.main-header').offset();
var myPosition;
var myLocation;
var courtList = {};
var matchList = {};
var selected = 'C';
var cnoArr = [];
var ano;
var mno;
var replyPage = 1;

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
function printCourts(data, content) {
	for (var i = 0; i < data.length; i ++) {
		
		var cno = data[i].cno;
		
		if(content === 'game') {
			if($.inArray(cno, cnoArr) !== -1) {
				console.log('중복');
				continue;
			} 
		}
		
	    var position = new daum.maps.LatLng(data[i].lat, data[i].lng);
	    
	    
		// 마커를 생성합니다
	    displayMarker(position, content, cno);
	    
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
	} else if(content === 'game') {
		imageSrc = '/resources/img/marker-noPlaying.png',
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
	
	// 중복 방지를 위해서 cno등록
	if(content === 'game') {
		cnoArr.push(cno);
	}

	// 내위치 마커는 여기까지 하고 나감
	if(content === 'user') {
		return;
	}
	
	// 마커 객체에 cno속성 추가
	marker.cno = cno;
	
	if(content === 'court') {
		// 마커에 등록할 클릭 이벤트
		daum.maps.event.addListener(marker, 'click', openSidebar(cno));
	} else {
		daum.maps.event.addListener(marker, 'click', openGamebar(cno));
	}
	
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
	$('.back').click(function() {
		$(activeTab).addClass('active');
		$('#tab_0').removeClass('active');
		$('#tab_4').removeClass('active');
	});
	
	// ajax로 RestController에서 코트 정보를 호출
	function getCourt(cno) {
		$.getJSON('/courts/' + cno, function(data) {
			/*if(data.writer === 'admin') {
				$('#cname').text('관리자');
			} else {
				$('#cname').text(data.writer);
			}*/
			
			ano = data.ano;
			replyPage = 1;
			getReply();
			
			$('#cno').text(data.cno);
			$('#cname').text(data.title);
			$('#address').text(data.address);
			$('#ccontent').text(data.content);
			$('#liked').text(data.liked);
			$('#replycnt').text(data.replycnt);
			$('#likeCourt').attr('bno', data.bno);
			$('#likeCourt').attr('ano', data.ano);
			
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
	if(selected === 'C') {
		courtList.pageidx += 10;
		getCourtList();
	} else if(selected === 'G') {
		matchList.pageidx += 10;
		getGameList();
	}
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
		distance = $('#dis-input').val() * 1000;
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
    		
    	if(selected === 'C') {
    		// 코트 목록 및 마커 초기화
            initCourtList();
    	} else if(selected === 'G') {
    		// 게임 목록 및 마커 초기화
    		initGameList();
    	}
    	
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
        
        // 세팅된 값으로 불러오기
        if(selected === 'C') {
            courtList.radius = 'Y';
            courtList.swlat = sw.getLat();
            courtList.swlng = sw.getLng();
            courtList.nelat = ne.getLat();
            courtList.nelng = ne.getLng();
            
            
        	getCourtList();
        } else if(selected === 'G') {
        	matchList.radius = 'Y';
        	matchList.swlat = sw.getLat(); 
        	matchList.swlng = sw.getLng();
        	matchList.nelat = ne.getLat();
        	matchList.nelng = ne.getLng();
        	
        	getGameList();
        }
        
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
		printCourts(data, 'court');
		
		if(data.length < 10) {
			alert('마지막 페이지입니다.');
			$('#moreCourts').hide();
		} else {
			$('#moreCourts').show();
		}
	});
};

// 검색 결과 초기화
function initCourtList() {
	courtList.pageidx = 0;
	courtList.radius = undefined;
	removeMarker();
	$('#search-body').text('');
};

// 전체 코트 검색
$('#getAll').click(function() {
	circle.setMap(null);
	
	if(selected === 'G') {
		initGameList();
		getGameList();
	} else if(selected === 'C') {
		initCourtList();
		getCourtList();
	}
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

// 게임 검색 결과 초기화
function initGameList() {
	if(dateState === 1) {
		matchList.begintime = new Date($('#datepicker1').val());
		matchList.endtime = new Date($('#datepicker2').val());
	} else {
		matchList.begintime = undefined;
		matchList.endtime = undefined;
	}

	matchList.radius = undefined;
	matchList.pageidx = 0;
	matchList.cno = 0;
	removeMarker();
	cnoArr = new Array();
	$('#search-body').html('<ul class="timeline"></ul>');
};

// 예약된 게임 목록 불러오기
function getGames(data) {
	var templateObj = $('#gameTemplate');
	var target = $('#search-body .timeline');
	
	var template = Handlebars.compile(templateObj.html());
	var html = template(data);
	
	target.append(html);
}

// 게임 검색 함수
function getGameList() {
	$.getJSON('/courts/games', matchList, function(data) {
		getGames(data);
		printCourts(data, 'game');
		
		if(data.length < 10) {
			alert('마지막 페이지입니다.');
			$('#moreCourts').hide();
		} else {
			$('#moreCourts').show();
		}
	});
};

// 예약된 게임에서 코트 찾기
$('#search-body').on('click', '.match-court', function() {
	var cno = $(this).attr('cno');
	console.log(cno);
	getCourt(cno);
});

//예약된 게임에서 게임 정보 보기
$('#search-body').on('click', '.timeline-header a', function() {
	var mno1 = $(this).attr('mno');
	mno = mno1;
	getGame(mno);
	console.log(mno);
});

// 게임 예약 정보 보기
function getGame(mno) {
	var team1 = 'home';
	var team2 = 'away';
	var state;
	
	$('#tab_4').addClass('active');
	$(activeTab).removeClass('active');
	
	$.getJSON('/courts/games/' + mno, function(data) {
		$('#mname').text(data.mname);
		$('#begintime').text(data.begintime);
		$('#endtime').text(data.endtime);
		$('#state').text(data.state);
		
		state = data.state;
	});
	
	$.getJSON('/courts/games/' + mno + '/' + team1, function(data) {
		var templateObj = $('#playerTemplate');
		var target = $('#home');
		
		var template = Handlebars.compile(templateObj.html());
		var html = template(data);
		
		target.html(html);
		
		if(state === '시작' || state === '평가') {
			for(i in data) {
				if(id === data[i].id) {
					if(state === '시작' && data[i].state === '대기') {
						$('#getStart').show();
						return;
					} else if(state === '평가' && data[i].state === '참가') {
						$('#away input').show();
						$('#getEnd').show();
						$('#getEnd').attr('team', 'away');
						return;
					}
				}
			}
		}
	});
	
	$.getJSON('/courts/games/' + mno + '/' + team2, function(data) {
		var templateObj = $('#playerTemplate');
		var target = $('#away');
		
		var template = Handlebars.compile(templateObj.html());
		var html = template(data);
		
		target.html(html);
		
		if(state === '시작' || state === '평가') {
			for(i in data) {
				if(id === data[i].id) {
					if(state === '시작' && data[i].state === '대기') {
						$('#getStart').show();
						return;
					} else if(state === '평가' && data[i].state === '참가') {
						$('#home input').show();
						$('#getEnd').show();
						$('#getEnd').attr('team', 'home');
						return;
					}
				}
			}
		}
	});
}

// 참가 버튼 클릭
$('#getStart').click(function() {
	changeState('start');
	$('#getStart').hide();
	
	// 점수 초기화
	$.ajax({
		url: '/courts/players?mno=' + mno + '&id=' + id,
		type: 'post',
		headers : {
			/*"Content-Type" : "application/json",*/
			"X-HTTP-Method-Override" : "POST"
		},
		success: function(data) {
			if(data === 'success') {
				alert('성공적으로 참가 신청이 되었습니다.');
			}
		}
	});
});

// 평가 버튼 클릭
$('#getEnd').click(function() {
	var team = $('#getEnd').attr('team');
	
	if(team === 'home') {
		$('#home tr').each(function(i) {
			var id = $(this).attr('id');
			
			if($(this).find('td:nth-child(3)').text() === '참가' || $(this).find('td:nth-child(3)').text() === '종료') {
				$.ajax({
					url: '/courts/players/point',
					type: 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data: JSON.stringify({
						mno: mno,
						id: id,
						point: $(this).find('.point').val(),
						trust: $(this).find('.trust').val() 
					}),
					success: function(data) {
						if(data === 'success') {
							alert(id + '의 점수가 등록되었습니다.');
						}
					}
				});
			}
		});
	} else {
		$('#away tr').each(function(i) {
			var id = $(this).attr('id');
			
			if($(this).find('td:nth-child(3)').text() === '참가' || $(this).find('td:nth-child(3)').text() === '종료') {
				$.ajax({
					url: '/courts/players/point',
					type: 'put',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data: JSON.stringify({
						mno: mno,
						id: id,
						point: $(this).find('.point').val(),
						trust: $(this).find('.trust').val() 
					}),
					success: function(data) {
						if(data === 'success') {
							alert(id + '의 점수가 등록되었습니다.');
						}
					}
				});
			}
		});
	}
	
	changeState('end');
	$('#getEnd').hide();
});

// 상태 변경
function changeState(state) {
	$.ajax({
		url: '/courts/games/' + mno + '/' + id + '/' + state,
		type: 'put',
		headers : {
			/*"Content-Type" : "application/json",*/
			"X-HTTP-Method-Override" : "PUT"
		},
		success: function(data) {
			if(data === 'success') {
				console.log(state + ' 상태로 변경');
			}
		}
	});
};

// 선수 정보 모달 숨기기
$('#playerChk').click(function() {
	$('#playerInfo').modal('hide');
});

// 게임에 예약한 선수 정보 보기
/*$('#home, #away').on('click', 'tr', function() {
	var id = $(this).attr('id');

	$.getJSON('/courts/players/' + id, function(data) {
		$('#pid').text(data.userid);
		$('#pname').text(data.name);
		$('#page').text(data.age);
		$('#psex').text(data.sex);
		$('#pheight').text(data.height);
		$('#pweight').text(data.weight);
		$('#pposition').text(data.position);
		$('#pgamecnt').text(data.gamecnt);
		$('#pgrade').text(data.grade);
		$('#ppoint').text(data.point);
		$('#ptrust').text(data.trust);
		$('#pinfo').text(data.info);
	});
});*/

// 코트에 예약된 게임 목록 보기
function openGamebar(cno) {
	return function() {
		console.log(cno);
		openSbar();
		courtGameList(cno);
	}
}

// 검색 타입 추적
$('#court-search').change(function() {
	selected = $('#court-search option:selected').val();
});

// 코트에 예약된 게임 목록 가져오기
function courtGameList(cno) {
	matchList.pageidx = 0;
	matchList.cno = cno;
	
	cnoArr = new Array();
	$('#search-body').html('<ul class="timeline"></ul>');
	getGameList();
};

// 날짜 검색 상태
var dateState = 0;

// 날짜 검색 열었다 닫기
$('#date-search').click(function() {
	if(dateState === 0) {
		$('#date-space').show();
		dateState = 1;
	} else if(dateState === 1) {
		$('#date-space').hide();
		dateState = 0;
	}
});

// 방 검색
$('#search-room').click(function() {
	var selected = $('#detail-room option:selected').val();
	console.log(selected);
	var keyword = $('#room-keyword').val();
	console.log(keyword);
	if(selected === 'rname') {
		socket.emit('searchRname', keyword);
	} else if(selected === 'ruser') {
		socket.emit('searchRuser', keyword);
	} else if(selected === 'cno') {
		socket.emit('searchCno', keyword);
	} else if(selected === 'usercnt') {
		socket.emit('searchUsercnt', keyword);
	} else if(selected === 'time') {
		socket.emit('searchTime', { begintime: $('#datepicker3').val(), endtime: $('#datepicker4').val() })
	}
});

// 모든 방 가져오기: 새로고침
$('#getRooms').click(function() {
	socket.emit('getRooms');
});

//댓글 목록 가져오기
function printReplies(replies) {
	var templateObj = $('#replyTemplate');
	var target = $('.box-comments');
	
	var template = Handlebars.compile(templateObj.html());
	var html = template(replies);
	$('.box-comment').remove();
	target.append(html);
};

// 댓글 입력 버튼 클릭
$('#inputReply').click(function() {
	var reply = {
			bno: 101,
			ano: ano,
			replyer: id,
			replytext: $('#replyText').val() 
	}
	
	$.ajax({
		url: '/replies',
		type: 'post',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data: JSON.stringify(reply),
		success: function(data) {
			if(data === 'success') {
				alert('댓글이 작성되었습니다.');
				replyPage = 1;
				getReply();
				$('#replyText').val('');
			}
		}
	});
});

/* 템플릿 날짜 */
Handlebars.registerHelper("prettifyDate", function(timeValue) {
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() + 1;
	var date = dateObj.getDate();
	return year + "/" + month + "/" + date;
});


/* 댓글 목록 및 페이지 가져오기 */
function getReply() {
	$.getJSON('/replies/101/' + ano + '/' + replyPage, function(data) {
		printReplies(data.list);
		printPaging(data.pageMaker);
	});
};

/* 댓글 페이징 이벤트 달기 */
$(".pagination").on("click", "li a", function(event) {
	event.preventDefault();

	replyPage = $(this).attr("href");

	getReply("/replies/101/" + ano + "/" + replyPage);
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
	$('.pagination').html(str);
};