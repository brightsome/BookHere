<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>



<body>
	<div class="container">

		<h2>모달</h2>

		<!-- 버튼 -->
		<button type="button" class="btn btn-primary btn-lg"
			data-toggle="modal" data-target="#myModal">Launch demo
			modal</button>

		<!-- 모달 팝업 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">내 서재에 담기</h4>
					</div>
					<div class="modal-body" style="margin-left: 40px">
			

							<div class="form-row" >
								<div class="radio-inline">
									<label class="top"> <span class="checked"> <input
											type="radio" name="type" value="recommend" />
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
						
							<br>
							<div class="form-group">
								<label>내용</label><br>
								<textarea id="cont" name="cont" class="form-control" rows="5"
									style="width: 500px;"></textarea>
							</div>
							<br>

						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-primary" type="submit"
							onclick="window.close()">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<!-- 		<button type="button" class="btn btn-primary">Save changes</button> -->
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script>
	<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script>

</body>
</html>