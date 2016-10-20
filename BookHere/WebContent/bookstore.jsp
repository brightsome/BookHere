<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<head>
</head>
<%@include file="header.jsp"%>
<body>
	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>BOOKSTORE</h2>
						<center>
							<div class="single-shop-info">
								<div class="shop-info-icon">
									<i class="flaticon-school"></i>
								</div>
								<div class="shop-info-content">
									<a href="registerBookstorePage?id=${sessionScope.loginEmail}">서점 등록하기</a>
								</div>
							</div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area Start -->
	<!-- My Account Area Start -->

<%-- 	<!-- 검색 Start -->
	<center>
	<div class="store_search">
		<label for="search_txt"> <input type="text" id="search_txt"
			title="Search" value="시, 구, 동으로 검색하세요"
			onFocus="this.value=''; this.style.color='#000'" name="qry" />
		</label>
		<label for="btnSearch">
			<input type="button" id="btnSearch" title="Search Button" /></label>
	</div>
	</center> --%>
	
	
   
	<!-- 동네서점 출력 -->
	<div class="our-team-area">
		   <h2 class="section-title">동네서점</h2>
		   <div class="container">
		        <div class="row">
		        <div class="team-list indicator-style">
			        <c:forEach items="${bookstore}" var="bookstore">
						<div class="col-md-3">
		                <div class="single-team-member">
		                    <a href="#">
		                        <img src="upload/${bookstore.pic}" alt="">
		                    </a>
		                    <div class="member-info">
		                        <h4><strong>${bookstore.branchname}</strong></h4>
		                        <p>${bookstore.address}</p>
		                        <p><a href="tel:${bookstore.phonenum}">${bookstore.phonenum}</a></p>
		                    </div>
		                </div>
		                </div>
					</c:forEach>
		        </div>
		        </div>
		   </div>
	</div>


	<div class="our-team-area" style="margin-bottom: 0px">
		<h2 class="section-title">대형서점</h2>
	</div>	
	<div class="my-account-area section-padding">
		<div class="container">
			<div class="row">
				<div class="addresses-lists">
					<div>
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">

							<!-- 교보문고 -->
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne"> <span><img
												class="logo" src="img/logo/kyobologo.png" /></span>
										</a>
									</h4>
								</div>
								<div id="collapseOne" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<div class="coupon-info" style="text-align: center">
											<c:set var="i" value="0" />
											<c:forEach items="${gbookstore}" var="gbookstore">
												<c:if test="${i < 10 }">
													<c:choose>
														<c:when test="${gbookstore.storename eq '교보문고'}">
															<a href="${gbookstore.website }">${gbookstore.branchname}
																│ </a>
															<c:set var="i" value="${i+1 }" />
														</c:when>
													</c:choose>
												</c:if>
												<c:if test="${i == 10 }">
													<br />
													<c:set var="i" value="0" />
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>

							<!-- 반디앤루니스 -->
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingTwo">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo"> <span><img
												class="logo" src="img/logo/bandilogo.png" /></span>
										</a>
									</h4>
								</div>
								<div id="collapseTwo" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingTwo">
									<div class="panel-body">
										<div class="coupon-info" style="text-align: center">
											<c:set var="i" value="0" />

											<c:forEach items="${gbookstore}" var="gbookstore">

												<c:if test="${i < 6 }">
													<c:choose>
														<c:when test="${gbookstore.storename eq '반디앤루니스'}">
															<a href="${gbookstore.website }">${gbookstore.branchname}
																│ </a>
															<c:set var="i" value="${i+1 }" />
														</c:when>
													</c:choose>
												</c:if>
												<c:if test="${i == 6 }">
													<br />
													<c:set var="i" value="0" />
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>

							<!-- 영풍문고 -->
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingThree">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"> <span><img
												class="logo" src="img/logo/yplogo.png" /></span>
										</a>
									</h4>
								</div>
								<div id="collapseThree" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingThree">
									<div class="panel-body">
										<div class="coupon-info" style="text-align: center">
											<c:set var="i" value="0" />
											<c:forEach items="${gbookstore}" var="gbookstore">
												<c:if test="${i < 10 }">
													<c:choose>
														<c:when test="${gbookstore.storename eq '영풍문고'}">
															<a href="${gbookstore.website }">${gbookstore.branchname}
																│ </a>
															<c:set var="i" value="${i+1 }" />
														</c:when>
													</c:choose>
												</c:if>
												<c:if test="${i == 10 }">
													<br />
													<c:set var="i" value="0" />
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>

							<!-- 알라딘 -->
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingFour">
									<h4 class="panel-title">
										<a class="collapsed" role="button" data-toggle="collapse"
											data-parent="#accordion" href="#collapseFour"
											aria-expanded="false" aria-controls="collapseFour"> <span><img
												class="logo" src="img/logo/aladinlogo.png" /></span>
										</a>
									</h4>
								</div>
								<div id="collapseFour" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="headingFour">
									<div class="panel-body">
										<div class="coupon-info" style="text-align: center">
											<c:set var="i" value="0" />
											<c:forEach items="${gbookstore}" var="gbookstore">
												<c:if test="${i < 10 }">
													<c:choose>
														<c:when test="${gbookstore.storename eq '알라딘'}">
															<a href="${gbookstore.website }">${gbookstore.branchname}
																│ </a>
															<c:set var="i" value="${i+1 }" />
														</c:when>
													</c:choose>
												</c:if>
												<c:if test="${i == 10 }">
													<br />
													<c:set var="i" value="0" />
												</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 서점 출력 End -->
	
  <button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">데스크탑 알림 권한 요청</button>
<hr />
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
<script>
var requestPermissionButton = $("#requestPermissionButton");
var notificationButton = $("#notificationButton");
var notificationMessage = $("#notificationMessage");
var iconDataURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAKBJREFUeNpiYBjpgBFd4P///wJAaj0QO9DEQiAg5ID9tLIcmwMYsDgABhqoaTHMUHRxpsGYBv5TGqTIZsDkYWLo6gc8BEYdMOqAUQeMOoAqDgAWcgZAfB9EU63SIAGALH8PZb+H8v+jVz64KiOK6wIg+ADEArj4hOoCajiAqMpqtDIadcCoA0YdQIoDDtCqQ4KtBY3NAYG0csQowAYAAgwAgSqbls5coPEAAAAASUVORK5CYII=";

//데스크탑 알림 권한 요청 버튼을 누르면,
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
});


//데스크탑 알림 버튼을 누르면,
notificationButton.on("click", function () {
    var message = notificationMessage.val();
    
    //메시지를 입력한 경우에만,
    if (message !== null && message.length > 0) {
        
        var options = {
            body: message,
            icon: iconDataURI
        }
       
        //데스크탑 알림 요청
        var notification = new Notification("데스크탑 알림 예제 타이틀", options);
        
        //알림 후 5초 뒤,
        setTimeout(function () {
            //얼람 메시지 닫기
            notification.close();
        }, 5000);
    }
});
</script>

	<!-- My Account Area End -->
	<%@ include file="footer.jsp"%>
</body>
</html>