<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<%@include file="header.jsp"%>
<body>

	<!-- Breadcrumbs Area Start -->
	<!-- Shop Area Start -->
	<div class="shopping-area section-padding4">
		<div class="container">
			<!-- 도서검색 -->
			<center>
<!-- 				<h3>daum 도서검색 api</h3> -->

				<div class="searchDiv">
					<%
						String textValue = "";
						if (request.getParameter("title") != null) {
							textValue = request.getParameter("title");
						}
					%>
					<input type="text" id="searchStr" name="searchStr"
						onkeydown="if(event.keyCode == 13)searchBook(0);"
						placeholder="Enter your book title here" value="<%=textValue%>" />
					<button type="submit" id="strbtn" onclick="searchBook(0);">
						<i class="fa fa-search"></i>
					</button>
					<br>
					<br>
				</div>
			</center>
			<!-- 도서검색  -->

			<div class="row">
				<div class="col-md-3 col-sm-3 col-xs-12">
					<div class="shop-widget">
						<div class="shop-widget-top">
							<aside class="widget widget-categories">
							<h2 class="sidebar-title text-center">CATEGORY</h2>
							<ul class="sidebar-menu">
								<li><a href="#"> <i class="fa fa-angle-double-right"></i>
										LEARNING <span>(5)</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-angle-double-right"></i>
										LIGHTING <span>(8)</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-angle-double-right"></i>
										LIVING ROOMS <span>(4)</span>
								</a></li>
								<li><a href="#"> <i class="fa fa-angle-double-right"></i>
										LAMP <span>(7)</span>
								</a></li>
							</ul>
							</aside>
							<aside class="widget shop-filter">
							<h2 class="sidebar-title text-center">PRICE SLIDER</h2>
							<div class="info-widget">
								<div class="price-filter">
									<div id="slider-range"></div>
									<div class="price-slider-amount">
										<input type="text" id="amount" name="price"
											placeholder="Add Your Price" />
										<div class="widget-buttom">
											<input type="submit" value="Filter" /> <input type="reset"
												value="CLEAR" />
										</div>
									</div>
								</div>
							</div>
							</aside>
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
							<h2 class="sidebar-title">TOP SELLERS</h2>
							<div class="single-seller">
								<div class="seller-img">
									<img src="img/shop/1.jpg" alt="" />
								</div>
								<div class="seller-details">
									<a href="shop.jsp"><h5>Cold mountain</h5></a>
									<h5>$ 50.00</h5>
									<ul>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
									</ul>
								</div>
							</div>
							<div class="single-seller">
								<div class="seller-img">
									<img src="img/shop/2.jpg" alt="" />
								</div>
								<div class="seller-details">
									<a href=""><h5>The historian</h5></a>
									<h5>$ 50.00</h5>
									<ul>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
										<li><i class="fa fa-star icolor"></i></li>
									</ul>
								</div>
							</div>
							</aside>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-9 col-xs-12">
					<div class="shop-tab-area">
						<div class="shop-tab-list">
							<div class="shop-tab-pill pull-left">
								<ul>
									<li class="active" id="left"><a data-toggle="pill"
										href="#home"><i class="fa fa-th"></i><span>Grid</span></a></li>
									<li><a data-toggle="pill" href="#menu1"><i
											class="fa fa-th-list"></i><span>List</span></a></li>
								</ul>
							</div>
							<div class="shop-tab-pill pull-right">
								<ul>
									<li class="product-size-deatils">
										<div class="show-label">
											<label>Show : </label> <select>
												<option value="10" selected="selected">10</option>
												<option value="09">09</option>
												<option value="08">08</option>
												<option value="07">07</option>
												<option value="06">06</option>
											</select>
										</div>
									</li>
									<li class="product-size-deatils">
										<div class="show-label">
											<label><i class="fa fa-sort-amount-asc"></i>Sort by :
											</label> <select>
												<option value="position" selected="selected">Position</option>
												<option value="Name">Name</option>
												<option value="Price">Price</option>
											</select>
										</div>
									</li>
									<li class="shop-pagination"><a href="#">1</a></li>
									<li class="shop-pagination"><a href="#">2</a></li>
									<li class="shop-pagination"><a href="#"><i
											class="fa fa-caret-right"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="tab-content">
							<div class="row tab-pane fade in active" id="home">
								<div class="shop-single-product-area"></div>
							</div>
							<div id="menu1" class="tab-pane fade">
								<div class="row bookContainer"></div>
								<center>
									<div id="pageDiv">
										<a href="javascript:searchBook(-1);">이전</a> <a
											href="javascript:searchBook(1);">이후</a>
									</div>
								</center>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Shop Area End -->
	<script type="text/javascript">
		var jsonObj = '';
		var pageNo = 1;
		function searchBook(paramPageNo) {

			pageNo += paramPageNo;
			if (pageNo == 0 || paramPageNo == 0)
				pageNo = 1;
			var str = $('#searchStr').val();
			
			var reStr = '';
			$
					.post(
							'tempServer.jsp',
							{
								'str' : str,
								'pageno' : pageNo
							},
							function(obj) {
								jsonObj = JSON.parse(obj);
								console.log(jsonObj)

								$(".shop-single-product-area").empty();
								$(".bookContainer").empty();

								for (var i = 0; i < jsonObj.channel.result; i++) {
									var tempUrl = jsonObj.channel.item[i].cover_l_url;
									if (tempUrl == '')
										tempUrl = 'http://i1.daumcdn.net/img-contents/book/2010/110x160_v2.gif';
									var category =jsonObj.channel.item[i].category;
									var title = jsonObj.channel.item[i].title;
									title = title.replaceAll("&gt;", ">");
									title = title.replaceAll("&lt;", "<");
									var author = jsonObj.channel.item[i].author;
			                        var pub_nm = jsonObj.channel.item[i].pub_nm; //출판사
			                        var pub_date = jsonObj.channel.item[i].pub_date; //출판일
			                        var description = jsonObj.channel.item[i].description;
			                        var list_price = jsonObj.channel.item[i].list_price;
			                        var sale_price = jsonObj.channel.item[i].sale_price;
			                     
									
									var isbn = jsonObj.channel.item[i].isbn13;

									$('.shop-single-product-area')
											.append(
													"<div class='col-md col-sm-6'>"
															+ "<div class='single-banner'>"
															+ "<div class='product-wrapper'>"
															+ "<a href='stockSearch3?isbn="+isbn + "'class='single-banner-image-wrapper'>"
															+ "<img alt='' src='" + tempUrl + "'>"
															+ "</a>"
															+ "<div class='product-description'>"
															+ "<div class='functional-buttons'>"
															+ "<a href='#' title='Add to Cart'>"
															+ "<i class='fa fa-shopping-cart'></i>"
															+ "</a>"
															+ "<a href='#' title='Add to Wishlist'>"
															+ "<i class='fa fa-heart-o'></i>"
															+ "</a> <a href='#' title='Quick view' data-toggle='modal' data-target='#productModal'>"
															+ "<i class='fa fa-compress'></i>"
															+ "</a>"
															+ "</div>"
															+ "</div>"
															+ "</div>"
															+ "</div>"
															+ "<div class='banner-bottom text-center'>"
															+ "<div class='banner-bottom-title'>"
															+ "<br/><a href='stockSearch3?isbn=" + isbn + "'>["
															+ category+"]"+ title
															+ "</a>"
															+"<br/>"
															+ pub_nm +" | " + pub_date
															+"<br/>"
															+ list_price +" ㅡ> " + "<strong>"+sale_price+"</strong>"
															+"<br/>"
															+ "</div>"
															+ "<div class='rating-icon'>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "</div>"
															+ "</div>"
															+ "</div>");

									$('.bookContainer')
											.append(
													"<div class='single-shop-product'>"
															+ "<div class='col-xs-12 col-sm-5 col-md-4'>"
															+ "<div class='left-item'>"
															+ "<a href='stockSearch3?isbn="+isbn + "'>"
															+ "<img src='" + tempUrl + "'>"
															+ "</a>"
															+ "</div>"
															+ "</div>"
															+ "<div class='col-xs-12 col-sm-7 col-md-8'>"
															+ "<div class='deal-product-content'>"
															+ "<br/><a href='stockSearch3?isbn=" + isbn + "'>["
															+ category+"]"+ title
															+ "</a>"
															+"<br/>"
															+ pub_nm +" | " + pub_date
															+"<br/>"
															+ list_price +" ㅡ> " + "<strong>"+sale_price+"</strong>"
															+"<br/>"
															+ "</div>"
															+ "<div class='rating-icon'>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "<i class='fa fa-star icolor'></i>"
															+ "</div>"
															+ "</div>"
															+ "</div>");

								}
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
		var textvalue = $("#searchStr").val();
		if (textvalue != null && textvalue != '') {
			$('#strbtn').click();
		}
	</script>
</body>
</html>