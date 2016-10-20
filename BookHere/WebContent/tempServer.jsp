<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<%
	request.setCharacterEncoding("utf-8");
	String str = request.getParameter("str");
	String pageno = request.getParameter("pageno");
	str = URLEncoder.encode(str, "utf-8");
	String url = "http://apis.daum.net/search/book?result=10&q=" + str
			+ "&apikey=b06a50bbe5f4ffcc16dc850c45a67fd1&output=json&pageno=" + pageno;
%>
<c:import url="<%=url%>" charEncoding="utf-8">
</c:import>