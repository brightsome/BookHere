<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
   <%@include file="header.jsp" %>
    <%@include file="headerSearch.jsp" %>
    <body>
       

        <!-- Shop Area Start -->
        <div class="shopping-area section-padding4" style="margin-bottom: 40px">
            <div class="container">
           
           <!-- 도서검색 추가 부분 -->
<!--             <center> -->
<!--               <div class="searchDiv"> -->
<!-- 			    <input type="text" id="searchStr" name="searchStr" onkeydown="if(event.keyCode == 13)searchBook(0);"  -->
<!-- 			    placeholder="Enter your book title here"/> -->
<!-- 			    <button type="submit" id="strbtn" onclick="searchBook(0);" ><i class="fa fa-search"></i></button> -->
<!-- 			  </div> -->

<!-- 			  <div id="reDiv"></div> -->
			  
<!-- 			  <div id="pageDiv"> -->
<!-- 			   <a href="javascript:searchBook(-1);">이전</a> -->
<!-- 			   <a href="javascript:searchBook(1);">이후</a> -->
<!-- 			  </div> -->
			  
			  
<!-- 			</center>	 -->
			<!-- 도서검색 추가 부분 -->  
			  
                <div class="row">
                   <center> <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="shop-widget">
<!--                             <div class="shop-widget-top"> -->
                                                        
<!--                             </div> -->
                           
                                
                                <aside class="widget widget-seller">
                                
                                    <h2 class="sidebar-title">TOP MEMBER</h2>
                                    <c:forEach items="${topMemberList }" var="topmember" begin="0" end="2">
                                    <div class="single-seller" style="text-align: center;">
                                    
                                    <h5>${topmember.id }</h5>
                                       <div class="seller-img" style="width: 150px;height: 150px; margin-left: 60px">
                                          	<a href="http://localhost:8088/BookHere/MyBookSelect?id=${topmember.id }" class="single-banner-image-wrapper" >
									<c:if test='${topmember.pic==null}'>
										<img src="img/human.png">
									</c:if>
									<c:if test='${topmember.pic != null}'>
									<img src="upload/${topmember.pic}" alt=""/>
									</c:if>
								</a>
                                        </div>
<!--                                         <div class="seller-details"> -->
<!--                                             <a href="shop.jsp"><h5>jde4248</h5></a> -->
                                          
                                      
<!--                                         </div> -->
                                    </div>
                                    </c:forEach>
                                  
                                </aside>
                            </div>
                        </div></center>
                    
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="shop-tab-area">
                            <div class="shop-tab-list">
                                
                                <div class="shop-tab-pill pull-right">
                                    <ul>
                                        <li class="product-size-deatils">
                                          	<form method="post" action="searchBookShelf">
                                            <div class="show-label">
                                             <select name="searchType" id="searchType">
                                                    <option value="1" selected="selected">전체</option>
                                                    <option value="2">책 이름</option>
                                                    <option value="3">아이디</option>
                                                </select>
                                                <input type="text" name="search">
					 							<input type="submit" value="검색" >
                                            </div>
                                 		</form>
                                        </li>	
                                        <li class="shop-pagination">
                                    <c:choose>
									<c:when test="${pageInfo.currentBlock eq 1}">
                    ◀◀
                           </c:when>
									<c:otherwise>
										<a
											href="bookshelfList?page=
         ${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
											◀</a>
									</c:otherwise>
								</c:choose>

								<%--Page  페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
										<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
											varStatus="num">
                        [<a
												href="bookshelfList?page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
                        [<a
												href="bookshelfList?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
									</c:otherwise>
								</c:choose>


								<%--Page 다음 페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ▶▶
                </c:when>
									<c:otherwise>
										<a
											href="bookshelfList?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
											▶</a>
									</c:otherwise>
								</c:choose>
								</li>
<!--                                         <li class="shop-pagination"><a href="#">1</a></li> -->
<!--                                         <li class="shop-pagination"><a href="#">2</a></li> -->
<!--                                         <li class="shop-pagination"><a href="#"><i class="fa fa-caret-right"></i></a></li> -->
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content">
                            ${BookShelfList }
                                <div class="row tab-pane fade in active" id="home">
                                    <div class="shop-single-product-area">
                                     <c:forEach items="${memberList }" var="bookshelf">
                                        <div class="col-md-4 col-sm-6" >
											<div class="single-banner">
												<div class="product-wrapper" style="height:270px; width:270px; vertical-align:middle;  display: table-cell;  ">
													<a href="http://localhost:8088/BookHere/MyBookSelect?id=${bookshelf.id }" class="single-banner-image-wrapper" >
													<c:if test='${bookshelf.pic == null}'>
													<img alt="" src="img/human.png" >
													</c:if>
													<c:if test='${bookshelf.pic != null}'>
													<img alt="" src="upload/${bookshelf.pic }"  > 
<!-- 													style="height:270px;width:270px;" -->
													</c:if>
													</a>
													<div class="product-description">
														<div class="functional-buttons">
															<a href="#" title="Like BookShelf" onclick="location.href='LikeCountUpdate?id=${bookshelf.id}'">
																<i class="fa fa-heart-o"></i>
															</a>
														</div>
													</div>
												</div>
												
												<div class="banner-bottom text-center">
													<div class="banner-bottom-title">
														<a href="#">${bookshelf.id }</a>
													</div>
													<div class="rating-icon">
														좋아요 ${bookshelf.likecount }
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
                </div>
            </div>
        </div>
        <!-- Shop Area End -->
		<%@include file="footer.jsp" %>
        
    </body>
</html>