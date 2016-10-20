<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<%@include file="header.jsp"%>
<body>
  
   <!-- slider Area Start -->
   <div class="slider-area">
      <div class="bend niceties preview-1">  
         <div id="ensign-nivoslider" class="slides">  
<!--           <img src="img/slider/main1.jpg" alt="" title="#slider-direction-1" />  -->
<!--             <img src="img/slider/main2.jpg" alt="" title="#slider-direction-1" /> -->
<!--             <img src="img/slider/main3.jpg" alt="" title="#slider-direction-1" />  -->
            <img src="img/slider/main1.jpg" alt="" title="#slider-direction-1" /> 
            <img src="img/slider/main3.jpg" alt="" title="#slider-direction-2" />
         </div>
         <!-- direction 1 -->
         <div id="slider-direction-1" class="text-center slider-direction">
            <!-- layer 1 -->
            <div class="layer-1">  
               <h2 class="title-1">LET’S SEARCH BOOK</h2>
            </div>
             
            <!-- layer 4 -->
            <div class="layer-4">
            	  <form action="search.jsp" class="title-4" method='post'>
                  <input type="text" placeholder="Enter your book title here" id="title" name="title">
                  <button type="submit">
                     <i class="fa fa-search"></i>
                  </button>
               </form>
            </div>

         </div>
         <!-- direction 2 -->
        <div id="slider-direction-1" class="text-center slider-direction">
            <!-- layer 1 -->
            <div class="layer-1">
               <h2 class="title-1">LET’S SEARCH BOOK</h2>
            </div>
            
            <div class="layer-4">
                 <form action="search.jsp" class="title-4" method='post'>
                  <input type="text" placeholder="Enter your book title here" id="title" name="title">
                  <button type="submit">
                     <i class="fa fa-search"></i>
                  </button>
               </form>
            </div>
         </div>
      </div>
   </div>


   <!-- slider Area End-->
   <!-- Online Banner Area Start -->
   <div class="online-banner-area">
      <div class="container">

         <!-- 베스트셀러 -->
         <div id="reDiv"></div>


         <div class="banner-title text-center">
            <h2>
               <span>BEST SELLER</span>
            </h2>
            <p>각 서점의 베스트 셀러를 비교하여 한 눈에 볼 수 있습니다.</p>
         </div>
         <div class="row">
				<div class="banner-list">

					<div class="col-md-4 col-sm-6">
						<center>
							<h2 class="heading-title">교보문고</h2>
						</center>
						<div class="single-banner">
							<c:forEach var="kyobo" items="${kyoboBestSeller}" begin="0"
								varStatus="status" end="0">
								<center>
									<a href="stockSearch?isbn=${kyobo.barcode }"> <img
										src="${kyobo.img }" class="topseller"></img>
									</a>
								</center>
								<div class="price">
									<span>${kyobo.rank }</span>
								</div>
								<div class="banner-bottom text-center">
									<a href="stockSearch?isbn=${kyobo.barcode }">${kyobo.title }</a>
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="col-md-4 col-sm-6">
						<center>
							<h2 class="heading-title">반디앤루니스</h2>
						</center>
						<div class="single-banner">
							<c:forEach items="${bandiBestSeller}" var="bandi" begin="0"
								varStatus="status" end="0">
								<center>
									<a href="#"> <img src="${bandi.img }" class="topseller"></img>
									</a>
								</center>
								<div class="price">
									<span>${bandi.rank }</span>
								</div>
								<div class="banner-bottom text-center">
									<a href="#">${bandi.title }</a>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-4 col-sm-6">
						<center>
							<h2 class="heading-title">영풍문고</h2>
						</center>

						<div class="single-banner">
							<c:forEach items="${ypBestSeller}" var="yp" begin="0"
								varStatus="status" end="0">
								<center>
									<a href="stockSearch?isbn=${yp.barcode }"> <img
										src="${yp.img }" class="topseller"></img>
									</a>
								</center>
								<div class="price">
									<span>${yp.rank }</span>
								</div>
								<div class="banner-bottom text-center">
									<a href="stockSearch?isbn=${yp.barcode }">${yp.title }</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Online Banner Area End -->

	<!-- Featured Product Area Start -->
	<div class="featured-product-area section-padding3">
		<h2 class="section-title">교보문고</h2>
		<div class="container">
			<div class="row">
				<div class="product-list tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="arrival">
						<div class="featured-product-list indicator-style">
							<c:forEach var="kyobo" items="${kyoboBestSeller}" begin="1"
								varStatus="status" end="9">
								<div class="single-p-banner">
									<div class="col-md-3">
										<div class="single-banner">
											<div class="product-wrapper">
												<a href="stockSearch?isbn=${kyobo.barcode }"
													class="single-banner-image-wrapper">
													<center>
														<img src="${kyobo.img }" class="topseller"></img>
													</center>
													<div class="price">
														<span>${kyobo.rank }</span>
													</div>

												</a>

											</div>
											<div class="banner-bottom text-center">
												<a href="stockSearch?isbn=${kyobo.barcode }">${kyobo.title }</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="featured-product-area section-padding3">
		<h2 class="section-title">반디앤루니스</h2>
		<div class="container">
			<div class="row">
				<div class="product-list tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="arrival">
						<div class="featured-product-list indicator-style">
							<c:forEach var="bandi" items="${bandiBestSeller}" begin="1"
								varStatus="status" end="9">
								<div class="single-p-banner">
									<div class="col-md-3">
										<div class="single-banner">
											<div class="product-wrapper">
												<a href="#" class="single-banner-image-wrapper">
													<center>
														<img src="${bandi.img }" class="topseller"></img>
													</center>
													<div class="price">
														<span>${bandi.rank }</span>
													</div>

												</a>

											</div>
											<div class="banner-bottom text-center">
												<a href="#">${bandi.title }</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


   <div class="featured-product-area section-padding3">
      <h2 class="section-title">영풍문고</h2>
      <div class="container">
         <div class="row">
            <div class="product-list tab-content">
               <div role="tabpanel" class="tab-pane fade in active" id="arrival">
                  <div class="featured-product-list indicator-style">
                  <c:forEach var="yp" items="${ypBestSeller}" begin="1"
                                 varStatus="status" end="9">
                     <div class="single-p-banner">
                        <div class="col-md-3">
                           <div class="single-banner">
                                 <div class="product-wrapper">
                                    <a href="#" class="single-banner-image-wrapper">
                                       <center>
                                          <img src="${yp.img }" class="bestseller"></img>
                                       </center>
                                       <div class="price">
                                          <span>${yp.rank }</span>
                                       </div>
                                    
                                    </a>
                                    
                                 </div>
                                 <div class="banner-bottom text-center">
                                    <a href="#">${yp.title }</a>
                                 </div>
                           </div>
                        </div>
                        </div>
                        </c:forEach>
                        </div>

                     </div>
            </div>
         </div>
      </div>
   </div>
   
  
</body>
   <!-- Featured Product Area End -->  
   <%@include file="footer.jsp"%>
  
</html>