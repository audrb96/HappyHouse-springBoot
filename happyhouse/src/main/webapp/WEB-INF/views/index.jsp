<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Happy House | 메인 화면</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<script type="text/javascript">
		let map;
		$(() => {
			 $.ajax({
				    url: "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=*00000000",
				    type: "GET",
				    contentType: "application/json;charset=utf-8",
				    dataType: "json",
				    success: (response) => {
				      let citylist = ``;
				      for (let i = 0; i < response.regcodes.length; i++) {
				        citylist += `<li><a class="dropdown-item" name = "\${response.regcodes[i].code}" href="#" >\${response.regcodes[i].name}</a></li>`;
				      }
				      $("#city-list").empty().append(citylist);
				    },
				    error: (e) => {
				      console.log(e);
				    },
				  });
			 
			 let doName = "";
			  $(document).on("click", "#city-list li > a", (e) => {
			    let code = e.target.name / 10 ** 8 + "*000000";
			    doName = e.target.text;
			    $("#dropdownMenuButton1").empty().text(e.target.text);
			    console.log(`도/광역시 = ${e.target.text}`);
			    $.ajax({
			      url: `https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=\${code}&is_ignore_zero=true`,
			      type: "GET",
			      contentType: "json",
			      success: (response) => {
			        let silist = ``;
			        console.log(response);
			        for (let i = 0; i < response.regcodes.length; i++) {
			          let siName = response.regcodes[i].name;
			          silist += `<li><a class="dropdown-item" name = "\${response.regcodes[i].code}" href="#" >\${siName.substring(doName.length,siName.length)}</a></li>`;
			        }
			        $("#si-list").empty().append(silist);
			      },
			      error: (e) => {
			        console.log(e);
			      },
			    });
			  });

			  $(document).on("click", "#si-list li > a", (e) => {
			    let code = e.target.name / 10 ** 6 + "*";
			    let siName = e.target.text;
			    $("#dropdownMenuButton2").empty().text(e.target.text);
			    console.log(`시/군/구 = ${e.target.text}`);
			    $.ajax({
			      url: `https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes?regcode_pattern=\${code}&is_ignore_zero=true`,
			      type: "GET",
			      contentType: "json",
			      success: (response) => {
			        let donglist = ``;
			        console.log(response);
			        for (let i = 0; i < response.regcodes.length; i++) {
			          let dongName = response.regcodes[i].name;
			          donglist += `<li><a class="dropdown-item" name = "\${response.regcodes[i].code}" href="#" >\${dongName.substring(doName.length + siName.length + 1,dongName.length)}</a></li>`;
			        }
			        $("#dong-list").empty().append(donglist);
			      },
			      error: (e) => {
			        console.log(e);
			      },
			    });
			  });
			  
			  $(document).on("click", "#dong-list li > a", (e) => {
				    $("#dropdownMenuButton3").empty().text(e.target.text);
				    // 구현해야할 기능 3 시작
				    console.log(`동 = ${e.target.text}`);				    
				    //끝
				    var code = e.target.name.substring(0, 5);
				    
				    location.href = "${root}/apt/search/" + code;

				  });

			  var donglat = ${donglat}
			  console.log();
			  var donglng = ${donglng}
			    map = new google.maps.Map(document.getElementById("trade-map"), {
	                  center: {
	                  lat: donglat,
	                  lng: donglng
	                  },
	                  zoom: 13
	                  });


				let multimarker = {
						coords: {lat : donglat ,lng : donglng},
							iconImage : "img/my_position.png",
							content : "apt"
							};
						addMarker2(multimarker);
				<c:forEach items="${aptlist }" var="apt">
				multimarker = {
					coords: {lat : ${apt.lat} ,lng : ${apt.lng}},
						iconImage : "${root}/img/my_position.png",
						content : "apt"
						};
					addMarker2(multimarker);
				</c:forEach>

				   <%--
				    map = new google.maps.Map(document.getElementById("trade-map"), {
		                  center: {
		                  lat: lat,
		                  lng: lng
		                  },
		                  zoom: 13
		                  });
		                  apts.도로명.forEach((item)=>{
		                    $.get(
		                      "https://maps.googleapis.com/maps/api/geocode/json",
		                      {
		                        key: "AIzaSyC0-HJ8XQXXWU52TxrGLViCHP8o1plZhmo",
		                        address: `${$("#dropdownMenuButton1").text().trim()}+${$("#dropdownMenuButton2").text().trim()}+${e.target.text.trim()}+${item}`,
		                      },
		                      function(data,status){
		                        let multimarker = {
		                          coords: {lat : data.results[0].geometry.location.lat ,lng : data.results[0].geometry.location.lng},
		                          iconImage : "img/my_position.png",
		                          content : e.target.text
		                      };
		                      addMarker2(multimarker);
		                      }
		                    )
		                  })    --%>

		});

		function addMarker2(props) {
			  const marker = new google.maps.Marker({
			      position: new google.maps.LatLng(parseFloat(props.coords.lat), parseFloat(props.coords.lng)),
			      map: map
			  });


			  if (props.iconImage) {
			      marker.setIcon(props.iconImage);
			  }

			  if (props.content) {
			      infoWindow = new google.maps.InfoWindow({
			          content: props.content
			      });

			  }

			  marker.addListener('click', function () {
			      map.setZoom(17);
			      map.setCenter(marker.getPosition());
			      bounceMarker(marker);
			  });
			  markers.push(marker);
			  setMapOnAll2(map);
			}

			function setMapOnAll2(map) {
			  for (let i = 0; i < markers.length; i++) {
			      markers[i].setMap(map);
			  }
			}

			function deleteMarkers() {
			  clearMarkers();
			  markers = [];
			}

			function clearMarkers() {
			  setMapOnAll(null);
			}
	
	</script>
	<c:if test="${empty aptlist}">
		<div class="banner"
			style="background-image: url('http://happyhouse.jaen.kr/images/mainbg1.jpg'); background-position: 50% 32%; background-size: cover;">
			<div class="banner-text">
				<h2 class="happyhouse">Happy House</h2>
				<hr style="color: white" />
				<!-- <div class="separator hc-element-invisible mt-10 animated hc-element-visible fadeIn" data-animation-effect="fadeIn" data-effect-delay="100"></div> -->
				<div style="color: white">행복한 우리집</div>
			</div>
		</div>
	</c:if>
	
	<div class="dropdown-container">
		<div class="dropdown-group">
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">도/광역시</button>
				<ul class="dropdown-menu" id="city-list"
					aria-labelledby="dropdownMenuButton1"></ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton2" data-bs-toggle="dropdown"
					aria-expanded="false">시/구/군</button>
				<ul class="dropdown-menu" id="si-list"
					aria-labelledby="dropdownMenuButton1">

				</ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button"
					id="dropdownMenuButton3" data-bs-toggle="dropdown"
					aria-expanded="false">동</button>
				<ul class="dropdown-menu" id="dong-list"
					aria-labelledby="dropdownMenuButton1">
				</ul>
			</div>
		</div>
	</div>

	<c:if test="${empty aptlist}">
	<div id="main">
		<div id="map" style="width: 60%; height: 500px; margin: auto;"></div>
		<div class="main_extra">
			<div class="ad">
				<img src="http://happyhouse.jaen.kr/images/sideAD.jpg" alt="ad">
			</div>
			<div style="margin-left: 150px;">
				<h3>지혜롭게 내집 마련하기</h3>
				<hr>
				<h6>가용자금 확인 및 대출 계획</h6>
				<h6>집 종류 및 지역 선택</h6>
				<h6>정보 수집 & 시세파악</h6>
				<h6>부동산 방문 & 집구경</h6>
				<h6>계약 및 잔금 치르기</h6>
				<h6>소유권 이전등기</h6>
				<h6>인테리어 공사</h6>
			</div>
			<div style="margin-left: 150px; width: 20%;">
				<h3>오늘의 뉴스</h3>
				<hr>
				<ul>
					<li><a href="#" style="color: blue;">서울 입주 2년차 아파트 전셋값
							1억400만원 올라</a> 한겨례</li>
					<li><a href="#" style="color: blue;">12.16 거래한파.. 매수자가
							사라졌다</a> 아시아경제</li>
					<li><a href="#" style="color: blue;">재건축 대안 뜨는 수직증축 리모델링..
							추진 슥..</a> 동아일보</li>
					<li><a href="#" style="color: blue;">고가기준 9억. 서울 아파트 중간값
							됐다</a> 한겨례</li>
					<li><a href="#" style="color: blue;">서울 입주 2년차 아파트 전셋값
							1억400만원 올라</a> 한겨례</li>

				</ul>
			</div>
		</div>
	</div>
	</c:if>

	<c:if test="${!empty aptlist }">
	<div id="map-main" style="display: flex;" >
		<div class="map-left" style="margin-left: 30px; margin-top: 10px;">
			<div id="trade-info">
			<c:forEach items="${aptlist }" var="apt">
				<div>
					<div class ="apt-name" style="font-size:20px;">${apt.getAptName()}</div>
					<div style="font-size:10px;">거래금액 : ${apt.getDealAmount()}만원</div> <div style="font-size:10px;">면적 : ${apt.getArea()}</div>
					<div style="font-size:8px;color:lightgray;">${apt.getDate()}</div>
				</div><hr>
			</c:forEach>
			</div>

		</div>
		<div id="trade-map" class="map-light"
			style="width: 60%; height: 500px; margin-left: 30px;"></div>
	</div>
	</c:if>
	<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</body>
</html>