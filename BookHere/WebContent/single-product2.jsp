<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>지도 표시하기</title>
</head>
<%@include file="header.jsp"%>
<body>
		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<form action="myBookInsert" method="post">
				<div class="modal-content" style="background-color:#fff">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">서재에 담기</h4>
					</div>
					
					<div class="modal-body" >
					 
						<input type="hidden" value="${sessionScope.loginEmail}" name="id">
							<input type="hidden" value="<%=request.getParameter("isbn")%>" name="isbn">
							<div class="form-row" style="margin-left: 30px">
							<div class="form-group" style="margin-top: 30px">
							
								<div class="radio-inline">
									<label class="top"> <span class="checked"> <input
											type="radio" name="disclose" value="disclose" />
									</span> 공개
									</label>
								</div>
								<div class="radio-inline">
									<label class="top"> <span class="checked"> <input
											type="radio" name="disclose" value="not-disclose" />
									</span> 비공개
									</label>
								</div>
								
						</div>
							<div class="form-group" style="margin-top: 30px">
								<div class="radio-inline">
									<label class="top"> <span class="checked"> 
									<input type="radio" name="type" value="recommend" />
									</span> 추천
									</label>
								</div>
								<div class="radio-inline">
									<label class="top"> <span class="checked"> <input
											type="radio" name="type" value="not-recommend" />
									</span> 비추천
									</label>
								</div>
								<div class="radio-inline">
									<label class="top"> <span class="checked"> <input
											type="radio" name="type" value="interest" />
									</span> 읽고 싶은 책
									</label>
								</div>
						</div>
							<div class="form-group" style="margin-top: 30px">
								<label>내용</label><br>
								<textarea id="memo" name="memo" class="form-control" rows="5"
									style="width: 500px;"></textarea>
							</div>
							<br>

						</div>
						
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="submit" onclick="window.close()">등록</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: white;color:#333;
						border-color:#ccc">취소</button>
						<!-- 		<button type="button" class="btn btn-primary">Save changes</button> -->
					</div>
				</div>
				</form>
			</div>
		</div>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>PRODUCT DETAILS</h2>
						<ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.jsp">Home</a></li>
							<li>Product Details</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area Start -->
	<!-- Single Product Area Start -->
	<div class="single-product-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-7">
					<div class="single-product-image-inner">
						<!-- 이미지 가져오기 -->
					</div>
				</div>
				<div class="col-md-6 col-sm-5">
					<div class="single-product-details">
						<!-- 책 설명 -->
					</div>
					<c:choose>
							<c:when test="${sessionScope.loginEmail == null}">
								
							</c:when>
							<c:otherwise>
									<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">서재에 담기</button>
<!-- 									<button class="btn-default" onclick="popWinName('AddMyBook','pop',680,320)">내 서재에 담기</button> -->
							</c:otherwise>
						</c:choose>
						
						<br>
					<div class="single-product-categories">
						<!-- 재고 리스트 출력 코드  -->

						교보문고 <br>
						<table align=center border=1 class="stocktable">
							<%
								int i = 0;
							%>
							<%
								int j = 8;
							%>
							<%
								for (int index = 0; index < 4; index++) {
							%>
							<c:forEach items="${kyoboStockList}" var="kyobo" begin="<%=i%>"
								end="<%=j%>">
								<th bgcolor="skyblue" width=100>${kyobo.key}</th>
							</c:forEach>
							<tr>

								<c:forEach items="${kyoboStockList}" var="kyobo" begin="<%=i%>"
									end="<%=j%>">
									<td>${kyobo.value}</td>
								</c:forEach>
							<tr>
								<%
									i = i + 9;
								%>
								<%
									j = i + 8;
								%>
								<%
									}
								%>
							
						</table>


						<br> 반디앤루니스 <br>
						<table align=center border=1 class="stocktable">
							<tr>
								<%
									int x = 0;
								%>
								<%
									int y = 8;
								%>
								<%
									for (int index = 0; index < 2; index++) {
								%>
								<c:forEach items="${bandiStockList}" var="bandi" begin="<%=x%>"
									end="<%=y%>">
									<th bgcolor="skyblue" width=100>${bandi.key}</th>
								</c:forEach>
							<tr>
								<c:forEach items="${bandiStockList}" var="bandi" begin="<%=x%>"
									end="<%=y%>">
									<td>${bandi.value}</td>
								</c:forEach>
							<tr>
								<%
									x = x + 9;
								%>
								<%
									y = x + 8;
								%>
								<%
									}
								%>
							
						</table>
						<br> 영풍문고 <br>
						<table align=center border=1 class="stocktable">
							<tr>
								<%
									int a = 0;
								%>
								<%
									int b = 8;
								%>
								<%
									for (int index = 0; index < 3; index++) {
								%>
								<c:forEach items="${ypStockList}" var="yp" begin="<%=a%>"
									end="<%=b%>">
									<th bgcolor="skyblue" width=100>${yp.key}</th>
								</c:forEach>
							<tr>
								<c:forEach items="${ypStockList}" var="yp" begin="<%=a%>"
									end="<%=b%>">
									<td>${yp.value}</td>
								</c:forEach>
							<tr>
								<%
									a = a + 9;
								%>
								<%
									b = a + 8;
								%>
								<%
									}
								%>
						</table>
							알라딘<br>
					
						<table align=center border=1 class="stocktable">
							<%
								int q = 0;
							%>
							<%
								int r = 8;
							%>
							<%
								for (int index = 0; index < 5; index++) {
							%>
							<c:forEach items="${aladinStockList}" var="aladin" begin="<%=q%>"
								end="<%=r%>">
								<th bgcolor="skyblue" width=100>${aladin.key}</th>
							</c:forEach>
							<tr>

								<c:forEach items="${aladinStockList}" var="aladin" begin="<%=q%>"
									end="<%=r%>">
									<td>${aladin.value}</td>
								</c:forEach>
							<tr>
								<%
									q = q + 9;
								%>
								<%
									r = q + 8;
								%>
								<%
									}
								%>
						
						</table>
					</div>
					<div class="social-share">
						<label>Share: </label>
						<ul class="social-share-icon">
							<li><a href="#"><i class="flaticon-social"></i></a></li>
							<li><a href="#"><i class="flaticon-social-1"></i></a></li>
							<li><a href="#"><i class="flaticon-social-2"></i></a></li>
						</ul>
					</div>
					<div id="product-comments-block-extra">
						<ul class="comments-advices">
							<li><a href="#" class="open-comment-form">Write a review</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div id="map"
		style="width: 60%; height: 500px; margin: 180px; margin-top: 20px; margin-left: 380px"></div>

	<!-- Single Product Area End -->
	<!-- Related Product Area Start -->
	<!-- Related Product Area End -->

	
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=ce7db13b3afc9147830439d5c3d39632"></script>
	<div id="map" style="width: 900px; height: 500px;"></div>
	<script>
   
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
      mapOption = {
         center : new daum.maps.LatLng(37.5709792, 126.975565), // 지도의 중심좌표
         level : 5
      // 지도의 확대 레벨
      };
      var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
      var locPosition;
      // HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
      if (navigator.geolocation) {
          
          // GeoLocation을 이용해서 접속 위치를 얻어옵니다
          navigator.geolocation.getCurrentPosition(function(position) {
              
              var lat = position.coords.latitude, // 위도
                  lon = position.coords.longitude; // 경도
              
            locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
              
            // 마커와 인포윈도우를 표시합니다
              displayMarker(locPosition,message);
                  
            });
          
      } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
          locPosition = new daum.maps.LatLng(37.5709792, 126.975565)
          message = 'geolocation을 사용할수 없어요..'
          
              displayMarker(locPosition, message);
      }
      
      var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

      // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
      var positions = 
      [ 
       
		<c:forEach items="${kyoboStoreList}" var="kyoboBranch">
		 <c:set var="branch" value="${kyoboBranch.branchname}"/>
      {
       content : 
      	 
           '<div style="width:330px;text-align:center;padding:6px 5px;">${kyoboStockList.get(branch)}'+'권'+
           '<br><b>${kyoboBranch.storename}</b>'+' '+'<b>${kyoboBranch.branchname}</b>'+
           '<br>${kyoboBranch.address}'+
           '<br>${kyoboBranch.phonenum}</div>',
       latlng : new daum.maps.LatLng('${kyoboBranch.latitude}','${kyoboBranch.longitude}')
      },
      </c:forEach>
       	
		<c:forEach items="${bandiStoreList}" var="bandiBranch">
		 <c:set var="branch" value="${bandiBranch.branchname}"/>
       {
        content : 
        	
            '<div style="width:330px;text-align:center;padding:6px 5px;">${bandiStockList.get(branch)}'+'권'+
            '<br><b>${bandiBranch.storename}</b>'+' '+'<b>${bandiBranch.branchname}</b>'+
            '<br>${bandiBranch.address}'+
            '<br><a>${bandiBranch.phonenum}</a></div>',
        latlng : new daum.maps.LatLng('${bandiBranch.latitude}','${bandiBranch.longitude}')
       },
       </c:forEach>

       
		<c:forEach items="${ypStoreList}" var="ypBranch">
		 <c:set var="branch" value="${ypBranch.branchname}"/>
      {
       content : 
           '<div style="width:330px;text-align:center;padding:6px 5px;">${ypStockList.get(branch)}'+'권'+
           '<br><b>${ypBranch.storename}</b>'+' '+'<b>${ypBranch.branchname}</b>'+
           '<br>${ypBranch.address}'+
           '<br>${ypBranch.phonenum}</div>',
       latlng : new daum.maps.LatLng('${ypBranch.latitude}','${ypBranch.longitude}')
      },
      </c:forEach>
      
      <c:forEach items="${aladinStoreList}" var="aladinBranch">
		 <c:set var="branch" value="${aladinBranch.branchname}"/>
   {
    content : 
        '<div style="width:330px;text-align:center;padding:6px 5px;">${aladinStockList.get(branch)}'+'권'+
        '<br><b>${aladinBranch.storename}</b>'+' '+'<b>${aladinBranch.branchname}</b>'+
        '<br>${aladinBranch.address}'+
        '<br>${aladinBranch.phonenum}</div>',
    latlng : new daum.maps.LatLng('${aladinBranch.latitude}','${aladinBranch.longitude}')
   },
   </c:forEach>
       ];
      
      
      function displayMarker(locPosition,message) {
    	// 마커 이미지의 이미지 크기 입니다
    	 var imageSize = new daum.maps.Size(24, 35); 
    	    
    	 // 마커 이미지를 생성합니다    
    	 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);   
    	  
         var marker = new daum.maps.Marker({  
              map: map, 
              position: locPosition,
              image : markerImage // 마커 이미지 
          }); 
      for (var i = 0; i < positions.length; i++) {
         // 마커를 생성합니다
         var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng,
         // 마커의 위치
         });
   
         // 마커에 표시할 인포윈도우를 생성합니다 
         var infowindow = new daum.maps.InfoWindow({
            content : positions[i].content
         // 인포윈도우에 표시할 내용
         });
         
         // 인포윈도우를 마커위에 표시합니다 
          infowindow.open(map, marker);
          infowindow.close();
         
         map.setCenter(locPosition);  

         // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
         // 이벤트 리스너로는 클로저를 만들어 등록합니다 
         // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
         daum.maps.event.addListener(marker, 'mouseover', makeOverListener(
               map, marker, infowindow));
         daum.maps.event.addListener(marker, 'mouseout',
               makeOutListener(infowindow));
         
      }
      }

      // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
      function makeOverListener(map, marker, infowindow) {
         return function() {
            infowindow.open(map, marker);
            
         };
      }

      // 인포윈도우를 닫는 클로저를 만드는 함수입니당. 
      function makeOutListener(infowindow) {
         return function() {
            infowindow.close();
         };
      }
   </script>



	<script type="text/javascript">
      var jsonObj = '';
      function detailBook() {
         var isbn =
   <%=request.getParameter("isbn")%>
      ;
         var img = "http://t1.daumcdn.net/book/KOR" + isbn;
         $
               .post(
                     'detailTempServer.jsp',
                     {
                        'isbn' : isbn
                     },
                     function(obj) {
                        jsonObj = JSON.parse(obj);
                        //var tempUrl = jsonObj.channel.item[0].cover_l_url;
                        if (img == '')
                           img = 'http://i1.daumcdn.net/img-contents/book/2010/110x160_v2.gif';

                        var title = jsonObj.channel.item[0].title;
                        //                      title = title.replaceAll("&gt;", ">");
                        //                      title = title.replaceAll("&lt;", "<");

                        var isbn = jsonObj.channel.item[0].isbn13;
                        isbn = isbn.replace("/[^0-9]/g", "");
                        var author = jsonObj.channel.item[0].author;
                        var pub_nm = jsonObj.channel.item[0].pub_nm; //출판사
                        var pub_date = jsonObj.channel.item[0].pub_date; //출판일
                        var description = jsonObj.channel.item[0].description;
                        var list_price = jsonObj.channel.item[0].list_price;
                        $(".single-product-image-inner")
                              .append(
                                    "<a class='venobox' href='"+img+"'"+
                                   "data-gall='gallery'>"
                                          + "<img class='imgsize' src='"+img+"'></a>");

                        $(".single-product-details")
                              .append(
                                    "<h2>"
                                          + title
                                          + "</h2>"
                                          + "<div class='availability'>"
                                          + "</div>"
                                          + "<br>"
                                          + "<p>저자 : "
                                          + author
                                          + "</p>"
                                          + "<p>"
                                          + pub_nm
                                          + " | "
                                          + pub_date
                                          + "</p>"
                                          + "<p>isbn :"
                                          + isbn
                                          + "</p>"
                                          + "<div class='single-product-price'>"
                                          + "<h3>" + list_price
                                          + "</h3>" + "</div>");
                     });
      }

      String.prototype.trim = function() {
         return this.replace(/(^\s*)|(\s*$)/gi, "");
      };

      String.prototype.replaceAll = function(str1, str2) {
         var temp_str = this.trim();
         temp_str = temp_str.replace(eval("/" + str1 + "/gi"), str2);
         return temp_str;
      };
   </script>
	<script>
      detailBook();
   </script>
   
   <script>
function popWinName(url,name, w,h ) {
	 var winl = (screen.width - w) / 2;
	 var wint = (screen.height - h) / 2;
	 NamePopG = window.open("popup.jsp", name,'width='+w+',height='+h+', top='+wint+',left='+winl+', toolbars=no,menubars=no,scrollbars=no ');
	 NamePopG.focus();

	}

</script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>
</body>
<%@include file="footer.jsp"%>
</html>