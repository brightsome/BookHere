<%@page import="kr.ac.sku.bookhere.controller.StockSearchController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button id="1">ajax call 1</button> <!-- 버튼마다 동작을 다르게 하려면 id (유일한 값을 찾아내고 싶을 때), 그룹지어서 동작을 다르게 하려면 class -->
<div id ="div"><%=request.getParameter("isbn") %></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> <!-- $ : JQuery -->
<script type="text/javascript">
   $("#1").click(function() { 
      var isbn = <%=request.getParameter("isbn") %>;
      $.ajax({ 
         url:"kyoboStockSearch",
         data: {"isbn":isbn},
         success:function(data) { // data : 넘어오는 값 받을 애
            $("#div").append(data+"</br>");
         }
         });
   });
   $("#1").click(function() { // #id
      var isbn = <%=request.getParameter("isbn") %>;
      $.ajax({ 
         url:"ypStockSearch",
         data: {"isbn":isbn},
         success:function(data) { // data : 넘어오는 값 받을 애
            $("#div").append(data+"</br>");
         }
         });
   });
   $("#1").click(function() {
      var isbn = <%=request.getParameter("isbn") %>;
      $.ajax({ 
         url:"bandiStockSearch",
         data: {"isbn":isbn},
         success:function(data) { // data : 넘어오는 값 받을 애
            $("#div").append(data+"</br>");
         }
         });
   });
</script>
</body>
</html>