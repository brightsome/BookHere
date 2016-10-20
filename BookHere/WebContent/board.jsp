<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
   <%@include file="header.jsp" %>
    <body>
<div id="wrap">
	<div class="container-fluid">
     <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>게시판</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.jsp">Home</a>
						        </li>
						        <li>게시판</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		
		</div> 
 <div class="shopping-area section-padding">
	
	<div class="container">
	 <input type="button" value="write" class="btn btn-default"
				onclick="location='.sku'">	
					<div class="container">
			<table border="1" summary="게시판의 글제목 리스트" class="tbl_type">
				<caption>게시판 리스트</caption>
				<thead>
					<tr>
						<td class="num">번호</td>
						<td class="title">제목</td>
						<td class="writer">작성자</td>
						<td class="day">작성일</td>
						<td class="count">조회수</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${list}">
						<tr>
							<td>${listv.postnum}</td>
							<td><a href="comdetail.sku?num=${listv.postnum}&id=${listv.id}">${listv.title}</a></td>
							<td>${listv.id}</td>
							<td>${listv.cdate}</td>
							<td>${listv.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>
				
			<div class="b_row">
				<table class="tbl_type">
				<tfoot>

		<!-- 페이징 -->
			<!-- shoplist.sku를 일괄적으로 comList.sku로 바꿈 -->
			
			<tr>
					<td colspan="5" class="page"> 
						<%--Page 이전 페이지 구현 --%> <c:choose>
							<c:when test="${searchType == null}">
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq 1}">
                    ◀
                           </c:when>
									<c:otherwise>
										<a
											href="comList.sku?page=
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
												href="comList.sku?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
                        [<a
												href="comList.sku?page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
                    </c:forEach>
									</c:otherwise>
								</c:choose>


								<%--Page 다음 페이지 구현 --%>
								<c:choose>
									<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
               ▶
                </c:when>
									<c:otherwise>
										<a
											href="comList.sku?page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
											▶</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>

								<c:choose>
									<c:when test="${pageInfo.currentBlock eq 1}">
                    ◀◀
                           </c:when>
									<c:otherwise>
										<a
											href="comList.sku?searchType=${searchType}&searchValue=${searchValue}&page=
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
												href="comList.sku?searchType=${searchType}&searchValue=${searchValue}&page=
                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
												${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
                       </c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach
											begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
											end="${pageInfo.totalPages}" varStatus="num">
                        [<a
												href="comList.sku?searchType=${searchType}&searchValue=${searchValue}&page=${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
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
											href="comList.sku?searchType=${searchType}&searchValue=${searchValue}&page=${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
											▶</a>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td colspan="5" class="page"> 
						<form method="post" action="search.sku">
							<select name="searchType" id="searchType">
								<option value="">선택</option>
								<option value="1">번호</option>
								<option value="2">제목</option>
								<option value="3">작성자</option>
							</select>&nbsp; <input type="text" name="searchValue" id="searchValue">
							<input type="submit" value="Search" class="btn btn-default">
							
						</form>	
						
					</tr>
				</tfoot>
			</table>
	
		</div>
	</div>
</div>
</div>
</body>
<%@include file="footer.jsp" %>
</html>
