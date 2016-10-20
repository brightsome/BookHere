<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<%@include file="header.jsp"%>
<body>

	<!-- Breadcrumbs Area Start -->
	<div class="breadcrumbs-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumbs">
						<h2>회원 가입</h2>
						<ul class="breadcrumbs-list">
							<li><a title="Return to Home" href="index.jsp">Home</a></li>
							<li>회원 가입</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumbs Area Start -->
	<!-- My Account Area Start -->
	<div class="my-account-area section-padding2">
		<div class="container">
			<div class="row">
				<div class="addresses-lists">
					<div class="col-xs-12 col-sm-6 col-lg-6-1">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">

								<div id="collapseOne" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne" style=>

									<div class="panel-body">
										<div class="coupon-info">
											<h2 class="heading-title">가입 정보 입력하기</h2>
											<form action="MemberInsert" method="post" enctype="multipart/form-data">
												<p class="required">*id</p>
												<p class="form-row">
													<input name="id" type="text" placeholder="사용할 id를 입력해주세요 *">
												</p>
												<p class="required">*이름</p>
												<p class="form-row">
													<input name="name" type="text" placeholder="이름을 입력해주세요 *">
												</p>
												<p class="required">*비밀번호</p>
												<p class="form-row">
													<input name="password" type="password"
														placeholder="비밀번호를 입력해주세요 *" />
												</p>
												<p class="required">*비밀번호 확인</p>
												<p class="form-row">
													<input type="password" placeholder="비밀번호를  확인 *" />
												</p>

												<p class="required">*전화번호</p>
												<p class="form-row">
													<input name="phonenumber" type="text"
														placeholder="전화번호를 입력해주세요*" />
												</p>
												<p class="required">*메일</p>
												<p class="form-row">
													<input name="mail" type="text" placeholder="메일을 입력해주세요*" />
												</p>
												<p class="required">*책장 이미지</p>
												<p class="form-row">
													<input type="file" name="ufile" id="ufile">
												</p>


												<input type="submit" class="btn button button-small"
													value="확인" /> <input type="reset"
													class="btn button button-small" value="취소" />
											</form>
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
	<!-- My Account Area End -->
	<!-- Footer Area Start -->

</body>
<%@include file="footer.jsp"%>
</html>