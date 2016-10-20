
<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%
	request.setCharacterEncoding("utf-8");
	String isbn = request.getParameter("isbn");
	isbn = URLEncoder.encode(isbn, "utf-8");
	String url = "http://apis.daum.net/search/book?q=" +isbn +"&apikey=b06a50bbe5f4ffcc16dc850c45a67fd1&output=json";
%>
<c:import url="<%=url%>" charEncoding="utf-8">
</c:import>

