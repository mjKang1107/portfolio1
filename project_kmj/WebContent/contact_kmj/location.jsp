<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>위치 정보</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
</head>
<div id="wrap">
<body>
	<!-- 헤더들어가는 곳 -->
  	<jsp:include page="../inc/top.jsp"/>
	<!-- 헤더들어가는 곳 -->
	
	<!-- 지도를 표시할 오픈 API 입니다 -->
	<div id="map" style="width:100%;height:450px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f7967a7663e3c1f8e99e3d8d9c621a68"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.15856216718373, 129.0620456267508), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	///////////////////////////////////지도 생성 끝 ///////////////////////////////////////////
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(35.15856216718373, 129.0620456267508); 
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);   

	</script>
	<h1 style="color: white; text-align: center;">오시는 길</h1>
	<pre style="color: white; text-align: center; font-size: 1.5em"><b>부산광역시 부산진구 부전동 112-3번지 삼한골든게이트 7층 이스케이프룸
	(도로명주소 : 부산광역시 부산진구 동천로 109 삼한골든게이트 7층)[우편번호 : 47246]
	대표전화 : 051-123-1107</b> </pre>
	
	<!-- 푸터들어가는 곳 -->
 	<jsp:include page="../inc/bottom.jsp"/>
	<!-- 푸터들어가는 곳 -->
	</div>
	
</body>
</html>