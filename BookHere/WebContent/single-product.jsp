<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<head>
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />

<title>Book Here</title>

</head>
<%@include file="header.jsp"%>
<%@include file="headerSearch.jsp"%>
<body>
   <!-- 모달 팝업 -->
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
      aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <form action="MyBookInsert" method="post">
            <div class="modal-content" style="background-color: #fff">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">
                     <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                  </button>

                  <h4 class="modal-title" id="myModalLabel">서재에 담기</h4>
               </div>

               <div class="modal-body">

                  <input type="hidden" value="${sessionScope.loginEmail}" name="id">
                  <input type="hidden" value="<%=request.getParameter("isbn")%>"
                     name="isbn">

                  <div class="form-row" style="margin-left: 30px">


                     <div class="form-group" style="margin-top: 30px">
                        <div id="star"></div>

                        <label for="starRating"></label> <input type="hidden"
                           id="starRating" name="star" value="3" />

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
                  <button class="btn btn-primary" type="submit"
                     onclick="window.close()">등록</button>
                  <button type="button" class="btn btn-primary" data-dismiss="modal"
                     style="background-color: white; color: #333; border-color: #ccc">취소</button>
                  <!--       <button type="button" class="btn btn-primary">Save changes</button> -->
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- Breadcrumbs Area Start -->
   <!--    <div class="breadcrumbs-area"> -->
   <!--       <div class="container"> -->
   <!--          <div class="row"> -->
   <!--             <div class="col-md-12"> -->
   <!--                <div class="breadcrumbs"> -->
   <!--                   <h2>PRODUCT DETAILS</h2> -->
   <!--                   <ul class="breadcrumbs-list"> -->
   <!--                      <li><a title="Return to Home" href="index.jsp">Home</a></li> -->
   <!--                      <li>Product Details</li> -->
   <!--                   </ul> -->
   <!--                </div> -->
   <!--             </div> -->
   <!--          </div> -->
   <!--       </div> -->
   <!--    </div> -->
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
            <!--             <div id="star" ></div> -->

            <!--       <div style="padding-top:20px;"> -->
            <!--          <label for="starRating">Value : </label><input type="text" id="starRating" value="3"/> -->
            <!--       </div> -->

            <!--       <div style="padding-top:20px;"> -->
            <!--          <label for="displayStarRating">Value : </label><span id="displayStarRating" style="padding-left:20px;">3</span> -->
            <!--       </div> -->

            <div class="col-md-6 col-sm-5">

               <div class="single-product-details">
                  <!-- 책 설명 -->


                  <c:choose>
                     <c:when test="${sessionScope.loginEmail == null}">

                     </c:when>
                     <c:otherwise>
                        <!--                   <a class="cart-btn btn-default" href="cart.jsp"> -->
                        <!--                                         <i class="flaticon-shop"></i> -->
                        <!--                                         Add to cart -->
                        <!--                                     </a> -->
                        <div class="product-attributes clearfix">
                           <!--                            <a class="img/bookshelf.jpg" data-toggle="modal" data-target="#myModal">담기</a> -->

                           <input type="hidden" value="${sessionScope.loginEmail}" id="id">
                           <input type="hidden" value="<%=request.getParameter("isbn")%>"
                              id="isbn">
                           <table>
                              <tr>
                                 <td><img src="img/icon/bookshelf2.png"
                                    data-toggle="modal" data-target="#myModal"
                                    style="width: 60px; height: 60px;"></td>
                                 <td><input id="addWish" type="image"
                                    src="img/icon/wishlist.png"
                                    style="width: 60px; height: 60px; margin-left: 10px">

                                 </td>
                              </tr>
                           </table>
                        </div>

                     </c:otherwise>
                  </c:choose>

               </div>
            </div>
            <div class="col-md-6 col-sm-5">
               <div class="single-product-categories">
                  <div class="p-details-tab-content">
                     <div class="p-details-tab">
                        <ul class="p-details-nav-tab" role="tablist">
                           <li><a href="#kyobo" role="tab" data-toggle="tab">교보문고</a></li>
                           <li><a href="#bandi" role="tab" data-toggle="tab">반디앤루니스</a></li>
                           <li><a href="#yp" role="tab" data-toggle="tab">영풍문고</a></li>
                           <li><a href="#aladin" role="tab" data-toggle="tab">알라딘</a></li>
                        </ul>
                     </div>
                     <div class="clearfix"></div>
                     <div class="tab-content review">
                        <div role="tabpanel" class="tab-pane active" id="kyobo">
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
                              <c:forEach items="${kyoboStockList}" var="kyobo"
                                 begin="<%=i%>" end="<%=j%>">
                                 <th bgcolor="skyblue" width=100>${kyobo.key}</th>
                              </c:forEach>
                              <tr>

                                 <c:forEach items="${kyoboStockList}" var="kyobo"
                                    begin="<%=i%>" end="<%=j%>">
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

                        </div>
                        <div role="tabpanel" class="tab-pane" id="bandi">
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
                                 <c:forEach items="${bandiStockList}" var="bandi"
                                    begin="<%=x%>" end="<%=y%>">
                                    <th bgcolor="skyblue" width=100>${bandi.key}</th>
                                 </c:forEach>
                              <tr>
                                 <c:forEach items="${bandiStockList}" var="bandi"
                                    begin="<%=x%>" end="<%=y%>">
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
                        </div>
                        <div role="tabpanel" class="tab-pane" id="yp">
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
                        </div>

                        <div role="tabpanel" class="tab-pane" id="aladin">
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
                              <c:forEach items="${aladinStockList}" var="aladin"
                                 begin="<%=q%>" end="<%=r%>">
                                 <th bgcolor="skyblue" width=100>${aladin.key}</th>
                              </c:forEach>
                              <tr>

                                 <c:forEach items="${aladinStockList}" var="aladin"
                                    begin="<%=q%>" end="<%=r%>">

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
                     </div>
                  </div>

               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="row">
         <div style="float: left; width: 30%; height: 650px;">
            <!-- 3. Store Page-->
            <div class="bg_store mainbg">
               <div class="contents store_content">
                  <div class="left-wrapper">
                     <div class="store_title">
                        <img src="img/logo/store_title.png" alt="STORE LOCATION" />
                     </div>
                     <!--
                      <div class="store_filter_v1">
                        <img class="title" src="img/logo/store_filterby.png"
                           alt="filter by" />
                        <div class="filterby">
                           <table>
                              <tr>
                                 <td><a href="#"><img src="img/logo/kyobologo.png"
                                       alt="교보문고" class="" /></a></td>
                                 <td class="second"><a href="#"><img
                                       src="img/logo/bandilogo.png" alt="반디앤루니스" class="" /></a></td>
                              </tr>
                              <tr>
                                 <td><a href="#"><img src="img/logo/yplogo.png"
                                       alt="영풍문고" class="" /></a></td>
                                 <td class="second"><a href="#"><img
                                       src="img/logo/aladinlogo.png" alt="알라딘" class="" /></a></td>
                              </tr>
                              <tr>
                                 <td colspan="2"><a href="#"><img
                                       src="img/logo/dongnaelogo.png" alt="동네서점" class="" /></a></td>
                              </tr>
                           </table>
                        </div>
                     </div> -->


                     <div style="clear: both"></div>
                     <div class="select_search_box">
                        <div class="location_select">
                           <label for="locationSelect"></label> <select
                              id="locationSelect" title="시/도 선택" name="SearchArea1"
                              style="width: 90%; height: 34px; font-family: 'NanumGothic', '나눔고딕', 'NanumGothicWeb', '맑은 고딕', 'Malgun Gothic', Dotum, Arial, Verdana">
                              <option value="">전체</option>
                              <option value="02">서울</option>
                              <option value="051">부산</option>
                              <option value="053">대구</option>
                              <option value="032">인천</option>
                              <option value="062">광주</option>
                              <option value="042">대전</option>
                              <option value="052">울산</option>
                              <option value="031">경기</option>
                              <option value="033">강원</option>
                              <option value="041">충청남도</option>
                              <option value="043">충청북도</option>
                              <option value="044">세종</option>
                              <option value="061">전라남도</option>
                              <option value="063">전라북도</option>
                              <option value="055">경상남도</option>
                              <option value="054">경상북도</option>
                              <option value="064">제주</option>
                           </select>
                        </div>
                        <div class="store_search">
                           <label for="search_txt"> <input type="text"
                              id="search_txt" title="Search"
                              onfocus="this.value=''; this.style.color='#000'" name="qry"
                              tabindex="" placeholder="시, 구, 동으로 검색하세요"> <input
                              type="button" id="btnSearch" title="Search Button" /></label>
                        </div>
                     </div>
                     <div class="store_location">
                        <img class="title" src="img/logo/location_title.png"
                           alt="매장 검색 결과" />
                        <div class="locations">
                           <div class="stores">
                              <!-- 매장 검색 결과 출력하는 div-->
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <!-- // 3. Store Page-->
         </div>
         <div style="float: left; width: 70%; height: 650px">
            <div id="map" style="width: 100%; height: 600px; margin-top: 20px;"></div>
         </div>
      </div>
   </div>

   <%@include file="footer.jsp"%>




   <script type="text/javascript"
      src="//apis.daum.net/maps/maps3.js?apikey=b06a50bbe5f4ffcc16dc850c45a67fd1"></script>
   <script>
      var mapContainer = document.getElementById('map'),
                      mapOption = {
                         center : new daum.maps.LatLng(37.5709792, 126.975565), // 지도의 중심좌표
                         level : 4
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
       
       var isbn = <%=request.getParameter("isbn")%>
       // 서점 마커를 표시할 위치와 내용을 가지고 있는 객체 배열
       var kyoboPositions = [ 
             <c:forEach items="${kyoboStoreList}" var="kyoboBranch">
              <c:set var="branch" value="${kyoboBranch.branchname}"/>
             {
              content : 
                  '<div style="width:330px;text-align:center;font-size:13px;padding:6px 5px;">${kyoboStockList.get(branch)}'+'권'+
                  '<br><b>${kyoboBranch.storename}</b>'+' '+'<b>${kyoboBranch.branchname}</b>'+
                  '<br>${kyoboBranch.phonenum}'+
                  '<br>${kyoboBranch.address}</div>',
              latlng : new daum.maps.LatLng('${kyoboBranch.latitude}','${kyoboBranch.longitude}'),
              baroUrl : 'http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=' + isbn
             },
             </c:forEach> ];
       
       var bandiPositions = [ 
             <c:forEach items="${bandiStoreList}" var="bandiBranch">
              <c:set var="branch" value="${bandiBranch.branchname}"/>
              {
               content : 
                   '<div style="width:330px;text-align:center;font-size:13px;padding:6px 5px;">${bandiStockList.get(branch)}'+'권'+
                   '<br><b>${bandiBranch.storename}</b>'+' '+'<b>${bandiBranch.branchname}</b>'+
                   '<br>${bandiBranch.phonenum}'+
                   '<br><a>${bandiBranch.address}</a></div>',
               latlng : new daum.maps.LatLng('${bandiBranch.latitude}','${bandiBranch.longitude}'),
               baroUrl : 'http://www.bandinlunis.com/front/product/popUpBookSelf.do?prodId='+'${prodidbookcd.prodid}'
              },
              </c:forEach> ];
      
       var ypPositions = [       
             <c:forEach items="${ypStoreList}" var="ypBranch">
              <c:set var="branch" value="${ypBranch.branchname}"/>
             {
              content : 
                  '<div style="width:330px;text-align:center;font-size:13px;padding:6px 5px;">${ypStockList.get(branch)}'+'권'+
                  '<br><b>${ypBranch.storename}</b>'+' '+'<b>${ypBranch.branchname}</b>'+
                  '<br>${ypBranch.phonenum}'+
                  '<br>${ypBranch.address}</div>',
              latlng : new daum.maps.LatLng('${ypBranch.latitude}','${ypBranch.longitude}'),
              baroUrl : 'http://www.ypbooks.co.kr/cart.yp?Goods_div=B&Quantity=1&method=ins&branchDelv_div=Y&Goods_cd='+'${prodidbookcd.bookcd}'
             },
             </c:forEach> ];
       
       var aladinPositions = [       
             <c:forEach items="${aladinStoreList}" var="aladinBranch">
              <c:set var="branch" value="${aladinBranch.branchname}"/>
             {
              content : 
                  '<div style="width:330px;text-align:center;font-size:13px;padding:6px 5px;">${aladinStockList.get(branch)}'+'권'+
                  '<br><b>${aladinBranch.storename}</b>'+' '+'<b>${aladinBranch.branchname}</b>'+
                  '<br>${aladinBranch.phonenum}'+
                  '<br>${aladinBranch.address}</div>',
              latlng : new daum.maps.LatLng('${aladinBranch.latitude}','${aladinBranch.longitude}'),
              baroUrl : '${aladinBranch.website}'
             },
          </c:forEach> ];
    // 서점 마커를 표시할 위치와 내용을 가지고 있는 객체 배열 끝
    
var _markers = [];
var _infoWindows = [];

   function displayMarker(locPosition,message) {
        // 내 위치 마커
         var imageSize = new daum.maps.Size(24, 35); 
         var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
         var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);   
          var marker = new daum.maps.Marker({  
               map: map, 
               position: locPosition,
               image : markerImage // 마커 이미지 
           }); 
       // 내 위치 마커 끝
          

        _markers = [];
        _infoWindows = [];
        
       var logoSize = new daum.maps.Size(40, 54); 
       var logoSrc = "img/logo/kyobo.png"; 
       var logoImage = new daum.maps.MarkerImage(logoSrc, logoSize); 
       for (var i = 0; i < kyoboPositions.length; i++) {
         
            var baroUrl = kyoboPositions[i].baroUrl;
                 (function(m) {
                    var baroUrl = kyoboPositions[i].baroUrl;
                   
                   // 지도 마커
                   var marker = new daum.maps.Marker({
                      map : map, // 마커를 표시할 지도
                      position : kyoboPositions[i].latlng, // 마커의 위치
                      image : logoImage
                   });
                   _markers.push(marker);
                   // 마커에 표시할 인포윈도우를 생성합니다 
                   var infowindow = new daum.maps.InfoWindow({
                      content : kyoboPositions[i].content
                   // 인포윈도우에 표시할 내용
                   });
                   _infoWindows.push(infowindow);
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
                   daum.maps.event.addListener(marker, 'click', function() {        
                        window.open(m);
                        }, false);
                 })(baroUrl);
         }
       
       var logoSize = new daum.maps.Size(40, 54); 
       var logoSrc = "img/logo/bandi.png"; 
       var logoImage = new daum.maps.MarkerImage(logoSrc, logoSize); 
       for (var i = 0; i < bandiPositions.length; i++) {
         
            var baroUrl = bandiPositions[i].baroUrl;
                 (function(m) {
                    var baroUrl = bandiPositions[i].baroUrl;
                   
                   // 지도 마커
                   var marker = new daum.maps.Marker({
                      map : map, // 마커를 표시할 지도
                      position : bandiPositions[i].latlng, // 마커의 위치
                      image : logoImage
                   });
                   _markers.push(marker);
                   // 마커에 표시할 인포윈도우를 생성합니다 
                   var infowindow = new daum.maps.InfoWindow({
                      content : bandiPositions[i].content
                   // 인포윈도우에 표시할 내용
                   });
                   _infoWindows.push(infowindow);
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
                   daum.maps.event.addListener(marker, 'click', function() {        
                        window.open(m);
                        }, false);
                 })(baroUrl);
         }
       
       var logoSize = new daum.maps.Size(40, 54); 
       var logoSrc = "img/logo/yp.png"; 
       var logoImage = new daum.maps.MarkerImage(logoSrc, logoSize); 
       for (var i = 0; i < ypPositions.length; i++) {
         
            var baroUrl = ypPositions[i].baroUrl;
                 (function(m) {
                    var baroUrl = ypPositions[i].baroUrl;
                   
                   // 지도 마커
                   var marker = new daum.maps.Marker({
                      map : map, // 마커를 표시할 지도
                      position : ypPositions[i].latlng, // 마커의 위치
                      image : logoImage
                   });
                   _markers.push(marker);
                   // 마커에 표시할 인포윈도우를 생성합니다 
                   var infowindow = new daum.maps.InfoWindow({
                      content : ypPositions[i].content
                   // 인포윈도우에 표시할 내용
                   });
                   _infoWindows.push(infowindow);
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
                   daum.maps.event.addListener(marker, 'click', function() {        
                        window.open(m);
                        }, false);
                 })(baroUrl);
         }
       
       var logoSize = new daum.maps.Size(40, 54); 
       var logoSrc = "img/logo/aladin.png"; 
       var logoImage = new daum.maps.MarkerImage(logoSrc, logoSize); 
       for (var i = 0; i < aladinPositions.length; i++) {
         
            var baroUrl = aladinPositions[i].baroUrl;
                 (function(m) {
                    var baroUrl = aladinPositions[i].baroUrl;
                   
                   // 지도 마커
                   var marker = new daum.maps.Marker({
                      map : map, // 마커를 표시할 지도
                      position : aladinPositions[i].latlng, // 마커의 위치
                      image : logoImage
                   });
                   _markers.push(marker);
                   // 마커에 표시할 인포윈도우를 생성합니다 
                   var infowindow = new daum.maps.InfoWindow({
                      content : aladinPositions[i].content
                   // 인포윈도우에 표시할 내용
                   });
                   _infoWindows.push(infowindow);
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
                   daum.maps.event.addListener(marker, 'click', function() {        
                        window.open(m);
                        }, false);
                 })(baroUrl);
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
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript">
  <!-- 검색 -->
           //검색 엔터키 이벤트
           $("#search_txt").bind("keydown", function(e) {
              if (e.keyCode == 13) { // enter key
                 $('#btnSearch').trigger('click');
                 return false;
              }
           });
           
           //텍스트 검색 이벤트
           $('#btnSearch').click(function(){
              $('.stores').empty();
              var searchTxt = $('#search_txt').val().replace(/시, 구, 동으로 검색하세요/g, "");
              searchTxt = $.trim(searchTxt);
              $.ajax({
                 url: "bookstoreSearch",
                 data: {"searchTxt":searchTxt},
                 type: 'post',
                 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                 success: function(retVal) {
                       if(retVal.code == "OK") { //controller에서 넘겨준 성공여부 코드
                           values = retVal.bookList ; //java에서 정의한 ArrayList명을 적어준다.
                           $.each(values, function( index, value ) {
                              $('.stores').append('<h4><strong><a class="gotostore" data-storepointx="' + value.latitude + '" data-storepointy="' + value.longitude + '" data-markerindex="'+ value.branchid + '">' + value.storename+' '+value.branchname+'</a></strong></h4><span style="clear:both"></span><p><span class="address">' + value.address +'</br><span class="call">' + value.phonenum + '</span></br></br><hr width=100%>');
                           });
                       }
                       else {
                           alert("실패");
                       }                   
                   },
                 error:function(request,status,error){
                      alert("code:"+request.status+"\n"+"error:"+error);
                  },
              });
           }); 
           
           //매장 맵이동storepointx
           $('.stores').on('click', '.gotostore', function(){
              // 이동할 위도 경도 위치를 생성합니다 
               
              var moveLatLon = new daum.maps.LatLng($(this).data('storepointx'), $(this).data('storepointy'));
               map.panTo(moveLatLon);
              
               
              for ( var i = 0; i < _markers.length ; i++) {
                 _infoWindows[i].close();
              }
               
               _infoWindows[$(this).data('markerindex')].open(map, _markers[$(this).data('markerindex')]);            
           });

</script>
   <!-- 책 정보 -->
   <script type="text/javascript">
   var jsonObj = '';
     function detailBook() {
        var isbn = <%=request.getParameter("isbn")%>
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

                       var title = jsonObj.channel.item[0].title; // 책 제목
                       var isbn = jsonObj.channel.item[0].isbn13; // isbn
                       isbn = isbn.replace("&lt;b&gt;", "");
                       isbn = isbn.replace("&lt;/b&gt;", "");
                       console.log(isbn);
                       var author = jsonObj.channel.item[0].author; // 작가
                       var pub_nm = jsonObj.channel.item[0].pub_nm; // 출판사
                       var pub_date = jsonObj.channel.item[0].pub_date; // 출판일
                       var description = jsonObj.channel.item[0].description;
                       var list_price = jsonObj.channel.item[0].list_price;
                       var sale_price = jsonObj.channel.item[0].sale_price;
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
                                         + "<br>"
                                         + "<p style = 'width: 450px'> <strong>"
                                         + author
                                         + "</strong> 지음 │ "
                                         + "<strong>"
                                         + pub_nm
                                         + "</strong> │ "
                                         + pub_date
                                         + " │ "
                                         + isbn
                                         + "</p>"
                                         + "<div class='single-product-price'>"
                                         + "<b style='font-size:20px;'><strike>" + list_price
                                         + "</b></strike>"  
                                         + "   "+sale_price
                                         + "</div>");
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
   <!-- 책 정보 끝-->

   <!-- 별점 -->
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

   <script type="text/javascript">
        $(function() {
            $('div#star').raty({
                score: 3
                ,path : "img/"
                ,width : 200
                ,click: function(score, evt) {
                    $("#starRating").val(score);
                    $("#displayStarRating").html(score);
                }
            });
        });
   </script>
   <script type="text/javascript" src="/BookHere/js/jquery.raty.js"></script>
   <!-- 별점 끝 -->

   <script type="text/javascript">
   $('#addWish').click(function(){
      var isbn = $('#isbn').val();
      var id = $('#id').val();
      $.ajax({
         url: "MyWishInsert",
         type: 'post',
         data: {"id":id,"isbn":isbn}         
            });
      
      alert("위시리스트에 저장되었습니다")
         }); 
   </script>

</body>
</html>