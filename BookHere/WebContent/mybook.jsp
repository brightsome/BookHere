<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<%@include file="header.jsp"%>
<%@include file="headerSearch.jsp"%>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/main.css">
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<!-- 모달 팝업 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<form action="MyBookUpdate" method="post">
				<div class="modal-content" style="background-color: #fff">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>

						<h4 class="modal-title" id="myModalLabel">서재에 담기</h4>
					</div>
					s
					<div class="modal-body">

						<input type="text" value="${sessionScope.loginEmail}" name="id">
						<input type="text" value="<%=request.getParameter("isbn")%>">

						<div class="form-row" style="margin-left: 30px">
							<div class="form-group" style="margin-top: 30px">
								<div id="star"></div>
								<label for="starRating"></label> <input type="text"
									id="starRating" name="star"
									value="<%=request.getParameter("star")%>" />
							</div>
							<div class="form-group" style="margin-top: 30px">
								<label>내용</label><br>
								<textarea id="memo" name="memo" class="form-control" rows="5"
									style="width: 500px;"><%=request.getParameter("memo")%></textarea>
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

	<!-- Shop Area Start -->
	<div class="shopping-area section-padding3">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
						<aside class="widget widget-categories">
							<h2 class="sidebar-title text-center"><%=request.getParameter("id")%></h2>

							<div class="product-wrapper">
							
								<c:if test='${selectMember.pic== null}'>
										<img alt="" src="img/human.png">
									</c:if> <c:if test='${selectMember.pic != null}'>
										<img src="upload/${selectMember.pic} ">
										<div class="product-description">
											<div class="functional-buttons">
												<a href="#" title="Like BookShelf" onclick="location.href='LikeCountUpdate2?id=${bookshelf.id}'">
													<i class="fa fa-heart-o"></i>
												</a>
											</div>
										</div>
									</c:if>
								</div>
							</aside>	

								<c:if test="${sessionScope.loginEmail ne selectMember.id}">		
								<center>
								<img src="img/like.png" style="height: 50px; width: 50px" onclick="location.href='LikeCountUpdate2?id=${selectMember.id}'"></img>
								</center>
								</c:if>
								</div>
						
						<div class="shop-widget-bottom">
						
							<aside class="widget widget-tag">
							<h2 class="sidebar-title">POPULAR TAG</h2>
							<ul class="tag-list">
								<li><a href="#">e-book</a></li>
								<li><a href="#">writer</a></li>
								<li><a href="#">book’s</a></li>
								<li><a href="#">eassy</a></li>
								<li><a href="#">nice</a></li>
								<li><a href="#">author</a></li>
							</ul>
							</aside>
							<aside class="widget widget-seller">
							
							<h2 class="sidebar-title">RECOMMENDED MEMBER</h2>
							<c:forEach items="${recommendMember }" var="recommend">
							<div class="single-seller">
						
								<div class="seller-img">
								<a href="http://localhost:8088/BookHere/MyBookSelect?id=${recommend.id }" class="single-banner-image-wrapper" >
									<c:if test='${recommend.pic==null}'>
										<img src="img/human.png" style="width:104px;height:104px">
									</c:if>
									<c:if test='${recommend.pic != null}'>
									<img src="upload/${recommend.pic}" alt="" style="width:104px;height:104px"/>
									</c:if>
								</a>
								</div>
								<div class="seller-details">
									<a href="shop.jsp"><h5>${recommend.id }</h5></a><br>
									나와 같은 책의 수
									<h5>${recommend.count }권</h5>
								</div>
						
							</div>
								</c:forEach>
							
							</aside>
							
						</div>
					</div>
				</div>
				
				<div class="col-md-9 col-sm-9 col-xs-12" style="margin-bottom: 50px">
					<c:set var="i" value="0" />
					<div class="shelf owned" style="background: white">
						<ul class="books clearfix">
							<c:forEach items="${selectMyBook }" var="mybook">
								<c:if test="${i%5 <= 5 }">
									<li id="html5webdesigners" class="book">
										<form id=”TheForm” method=”post” action="MyBookUpdateForm"
											data-target="#myModal">
											<img class="front" src="${mybook.img }" style="width: 180px;">
											<div class="back" style="width: 180px;">
												<div class="p10">
													<c:choose>
														<c:when test="${mybook.star eq 1}">
															<div class="rating star-1">
														</c:when>
														<c:when test="${mybook.star eq 2}">
															<div class="rating star-2">
														</c:when>
														<c:when test="${mybook.star eq 3}">
															<div class="rating star-3">
														</c:when>
														<c:when test="${mybook.star eq 4}">
															<div class="rating star-4">
														</c:when>
														<c:when test="${mybook.star eq 5}">
															<div class="rating star-5">
														</c:when>
													</c:choose>
													<ol>
														<li>✰</li>
														<li>✰</li>
														<li>✰</li>
														<li>✰</li>
														<li>✰</li>
													</ol>
													<dl>
														<dt></dt>
														<dd>${mybook.bookname } / ${mybook.author }</dd>
													
													</dl>
													<p class="description">${mybook.memo }</p>
													<br />
													<c:choose>
														<c:when test="${sessionScope.loginEmail eq mybook.id}">
															<p style="text-align: right;">
																<button class="btn mybook-btn" id="MyBookDelete"
																	onclick="location.href='MyBookDelete?isbn=${mybook.isbn}&id=${mybook.id }'">삭제</button>
																<button class="btn mybook-btn" id="MyBookUpdateForm"
																	data-toggle="modal" data-target="#myModal">수정</button>
															</p>
														</c:when>
													</c:choose>
													<a
														href="http://localhost:8088/BookHere/stockSearch?isbn=${mybook.isbn }">Visit
														website</a>

												</div>
											</div>
											<c:set var="i" value="${i+1 }" />
										</form>
									</li>

								</c:if>
								<c:if test="${i%5 == 0 }">
						</ul>
					</div>
					<c:choose>
						<c:when test="${i eq fn:length(selectMyBook ) }">
						</c:when>
						<c:otherwise>
							<div class="shelf owned" style="background: white">
								<ul class="books clearfix">
						</c:otherwise>
					</c:choose>
					</c:if>
					</c:forEach>

				</div>



			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<%@include file="footer.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="/BookHere/js/jquery.raty.js"></script>
	<script type="text/javascript">
		$(function() {
			$('div#star').raty({
				score : 3,
				path : "img/",
				width : 200,
				click : function(score, evt) {
					$("#starRating").val(score);
					//                     $("#displayStarRating").html(score);
				}
			});
		});
	</script>
</body>
</html>

