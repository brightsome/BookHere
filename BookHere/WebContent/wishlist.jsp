<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
  <%@include file="header.jsp" %>
  <%@include file="headerSearch.jsp" %>
    <body>
       
        <!-- Breadcrumbs Area Start -->
<!--         <div class="breadcrumbs-area"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 					    <div class="breadcrumbs"> -->
<!-- 					       <h2>Wishlist</h2>  -->
<!-- 					       <ul class="breadcrumbs-list"> -->
<!-- 						        <li> -->
<!-- 						            <a title="Return to Home" href="index">Home</a> -->
<!-- 						        </li> -->
<!-- 						        <li>Wishlist</li> -->
<!-- 						    </ul> -->
<!-- 					    </div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div>  -->
		<!-- Breadcrumbs Area Start --> 
        <!-- Shop Area Start -->
        <div class="shopping-area section-padding4">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="shop-widget">
                          
<!--                             <div class="shop-widget-bottom"> -->
                            
                                
                                    <center><h2 class="sidebar-title">TOP WISHLIST</h2></center>
                                    <c:forEach items="${topwishList }" var="topwish" begin="0" end="2">
                                    <div class="single-seller">
                                        <div class="seller-img">
                                        <img  src="${topwish.img }" style="width: 104px; height: 104px">
                                          
                                        </div>
                                        <div class="seller-details">
                                            <a href="shop.jsp"><h5>${topwish.bookname }</h5></a>
                                            ${topwish.author }<br/><br/>
                                            
                                            <b>${topwish.count }</b>명이 담았습니다
                                            
                                        </div>
                                    </div>
                                    </c:forEach>
                                    
<!--                             </div> -->
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="wishlist-right-area table-responsive">
                            <table class="wish-list-table">
                                <thead>
                                    <tr>
                                     <th class="product-price-cart" colspan="2">         WISH LIST</th>
<!--                                         <th class="product-details-comment">Book</th> -->
<!--                                         <th class="product-details-comment"></th> -->
                                        <th class="w-product-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	
                                    <c:forEach items="${mywishList }" var="mywish">
                                  
                                    <tr>
                                    <td class="product-details" style="width: 150px">
                                			<center>
<%--                                              <h5><strong>${mywish.bookname }</strong></h5> --%>
<%--                                              <p>${mywish.publisher } | ${mywish.author}</p> --%>
                                           <a href="http://localhost:8088/BookHere/stockSearch?isbn=${mywish.isbn }">
                                           <img src="${mywish.img }" alt=""></a>
                                     		 </center>
                                        </td>
                                    <td class="product-details">
                                			<center>
                                              <a href="http://localhost:8088/BookHere/stockSearch?isbn=${mywish.isbn }">
                                              <h5><strong>${mywish.bookname }</strong></h5></a>
                                             <p>${mywish.publisher } | ${mywish.author}</p>
                                             <p>${mywish.bookintro }</p>
                                     		 </center>
                                        </td>
                                        
<!-- 										<td class="product-remove"> -->
<!--                                             <a href="#"> -->
<!--                                                 <i></i> -->
<!--                                             </a> -->
<!--                                         </td> -->
                                        <td class="product-remove">
                                        <c:choose>
										<c:when test="${sessionScope.loginEmail eq mywish.id}">
                                            <a href="#">
                                            <i class="flaticon-delete" id="MyWishDelete"
											onclick="location.href='MyWishDelete?isbn=${mywish.isbn}&id=${mywish.id }'"></i>
                                            </a>
                                            </c:when></c:choose>
                                        </td>
                                    </tr>
                                      </c:forEach>
                                  
                                </tbody>
                            </table>
                        </div>
                        <div class="wishlist-bottom-link">
<!--                             <a class="wishlist-single-link" href="index.jsp"> -->
<!--                                 <i class="fa fa-angle-double-left"></i> -->
<!--                                 Back -->
<!--                             </a> -->
<!--                             <div class="shopingcart-bottom-area wishlist-bottom-area pull-right"> -->
<!--                                 <a href="#" class="right-shoping-cart">SHARE WISHLIST</a> -->
<!--                                 <a href="#" class="right-shoping-cart">ADD ALL TO CART</a> -->
<!--                                 <a href="#" class="right-shoping-cart">UPDATE WISHLIST</a> -->
<!--                             </div> -->
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-12">
			          <button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">데스크탑 알림 권한 요청</button>
					  <div id="notificationBlock" class="form-group">
						  <label class="control-label">알림 메시지</label>
						  <div class="input-group">
						       <span class="input-group-addon">메시지</span>
							       <input id="notificationMessage" type="text" class="form-control" disabled/>
							       <span class="input-group-btn">
							       <button id="notificationButton" class="btn btn-info" type="button" disabled>알림</button>
						       </span>
						</div>
				      </div>
		            </div>
                </div>
            </div>
        </div>
        
        
        
<script>
var requestPermissionButton = $("#requestPermissionButton");
var notificationButton = $("#notificationButton");
var notificationMessage = $("#notificationMessage");
var iconDataURI = "data:image/png;base64,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";

/* //데스크탑 알림 권한 요청 버튼을 누르면,
requestPermissionButton.on("click", function () {
	//데스크탑 알림 권한 요청
    Notification.requestPermission(function (result) {

        //요청을 거절하면,
        if (result === 'denied') {
            return;
        }
        //요청을 허용하면,
        else {
            //데스크탑 알림 권한 요청 버튼을 비활성화
            requestPermissionButton.attr('disabled', 'disabled');
            //데스크탑 메시지 입력폼을 활성화
            notificationMessage.removeAttr('disabled');
            //데스크탑 메시지 요청 버튼을 활성화
            notificationButton.removeAttr('disabled');
            return;
        }
    });
}); */


//데스크탑 알림 버튼을 누르면,
//notificationButton.on("click", function () {
	
window.onload = function () {
    var message = "메롱";
    var iconDataURI = "data:image/png;base64,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";

    //메시지를 입력한 경우에만,
    if (message !== null && message.length > 0) {
        
        var options = {
            body: message,
            icon: iconDataURI
        }
       
        //데스크탑 알림 요청
        var notification = new Notification("BOOK HERE", options);
        
        //알림 후 5초 뒤,
        setTimeout(function () {
            //얼람 메시지 닫기
            notification.close();
        }, 5000);
    }
}
</script>
        
        
        <!-- Shop Area End -->
	<%@include file="footer.jsp" %>
    </body>
</html>