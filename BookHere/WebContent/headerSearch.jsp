<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<body>

	<!-- Breadcrumbs Area Start -->
	<!-- Shop Area Start -->
	<div class="shopping-area section-padding4">
		<div class="container">
			<center>
				<div class="searchDiv">
					<%
						String textValue = "";
						if (request.getParameter("title") != null) {
							textValue = request.getParameter("title");
						}
					%>

					<form action="search.jsp" class="title-4" method='post'>
						<input type="text" id="title" name="title"
							placeholder="Enter your book title here">
						<button type="submit" id="strbtn">
							<i class="fa fa-search"></i>
						</button>
					</form>
					<br> <br>
				</div>
			</center>
		</div>
	</div>
</body>
</html>