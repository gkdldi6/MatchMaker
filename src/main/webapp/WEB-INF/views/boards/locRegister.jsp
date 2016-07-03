<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>


<style>
	.container {
		padding-top: 30px;
	}	

	#map {
	  width: 200px;
	  height: 200px;
	}
	
	#size {
	  display: none;
	  height: 0px;
	}
	
	@media screen and (min-width: 468px) {
	  #map {
	    width: 300px;
	    height: 300px;
	  }
	  
	  #size {
	    height: 1px; 
	  }
	}
	
	@media screen and (min-width: 768px) {
	  #map {
	    width: 400px;
	    height: 400px;
	  }
	  #size {
	    height: 2px; 
	  }
	}
	
	@media screen and (min-width: 992px) {
	  #map {
	    width: 500px;
	    height: 500px;
	  }
	  
	  #size {
	    height: 3px; 
	  }
	}
</style>

	<div id="size"></div>
	<!-- 글쓰기 시작 --> 
    <div class="container">
		<form class="form-horizontal" onsubmit="return false;">
			<fieldset>
				<input type="hidden" name="article_type" value="F">
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
						<input type="text" class="form-control" id="inputEmail" name="title">
					</div>
				</div>
				
				<div class="form-group">
					<label for="location" class="col-lg-2 control-label">위치</label>
					<div class="col-lg-10">
	                  <p id="addr"></p>
	                  <div id="map"></div>
	                  <input id="keyword" type="text">
	                  <button onclick="searchPlaces()">검색</button>
					</div>
				</div>
	
				<div class="form-group">
					<label for="textArea" class="col-lg-2 control-label">내용</label>
					<div class="col-lg-10">
						<textarea class="form-control textarea" rows="14" id="textArea" name="content"></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-lg-10 col-lg-offset-2">
						<button id="write" class="btn btn-primary btn-flat">작성</button>
						<a href="/boards/${bno }" class="btn btn-default btn-flat">취소</a>
					</div>
				</div>
	
			</fieldset>
		</form>
	</div>
	<!-- 끌 쓰기 끝 -->

<script type="text/javascript" src="/resources/plugins/editor/js/HuskyEZCreator.js" charset="UTF-8"></script>
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
		});
	});
	
	$("#write").click(function(){
		oEditors.getById["textArea"].exec("UPDATE_CONTENTS_FIELD", []);
		console.log($('#textArea').val());
		$("#textArea").submit();
	})
</script>

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=55e0d519a9b6c3ce803115407c5ce276&libraries=services"></script>
<script>
var lat = 37.47883026222571;
var lng = 126.88110853329948;
  
/* 초기 좌표: 가산디지털단지 이노플렉스 1차 */
var initLatLng = new daum.maps.LatLng(lat, lng);
    
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: initLatLng, // 지도의 중심좌표
        level: 3, // 지도의 확대 레벨
        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
    }; 


// 지도를 생성하면서 마커도 생성
var map = new daum.maps.Map(mapContainer, mapOption); 

var marker;
displayMarker(lat, lng);

// 좌표-주소 변환 객체를 생성합니다.    
var geocoder = new daum.maps.services.Geocoder();
searchDetailAddrFromCoords(initLatLng);
    
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
    
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;
  
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

       removeMarker();
      
       displayMarker(data.places[0].latitude, data.places[0].longitude);
           
        var center = new daum.maps.LatLng(data.places[0].latitude, data.places[0].longitude);

        // 검색된 장소 위치를 기준으로 지도 중앙 좌표를 설정
        map.setCenter(center);

        searchDetailAddrFromCoords(center);
      
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
    
function displayMarker(lat, lng) {
  marker = new daum.maps.Marker({
        map: map,
        draggable : true, // 마커를 드래그 가능하도록 설정한다
        position: new daum.maps.LatLng(lat, lng) 
    });
  
    daum.maps.event.addListener(marker, 'dragend', function() {
        searchDetailAddrFromCoords(marker.getPosition());
    });
  
};
  
function removeMarker() {
    marker.setMap(null);
};
    
function searchDetailAddrFromCoords(latlng) {
        lat = latlng.getLat();
        lng = latlng.getLng();

  // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2detailaddr(latlng, function(status, result) {
        if (status === daum.maps.services.Status.OK) {
            var detailAddr = result[0].jibunAddress.name;
            $('#addr').text(detailAddr);
        }   
    });
};
    
  </script>
  <script>
  var oldsize = $('#size').css('height');
  
  $(window).resize(function() {
    var newsize = $('#size').css('height');
      if(oldsize !== newsize) {
        if(size === '0px') {
          map.setCenter(marker.getPosition());
        } else if(size === '1px') {
          map.setCenter(marker.getPosition());
        } else if(size === '2px') {
          map.setCenter(marker.getPosition());
        } else {
          map.setCenter(marker.getPosition());
        }
      }
      oldsize = newsize;
  });
</script>
    

<jsp:include page="../include/footer.jsp"></jsp:include>
