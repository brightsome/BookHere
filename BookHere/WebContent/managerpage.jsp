<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@include file="header2.jsp"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-default navbar-static-top" role="navigation" >
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index"><img src="img/logo.png" alt="book here" style="width: 190px; height: 28px"></a>
            </div>
            <!-- /.navbar-header -->
            
            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
     </nav>
   <!-- Counter Area Start -->
   <div class="counter-area section-padding text-center">
      <div class="container">
         <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-6">
               <div class="single-counter wow" data-wow-duration="1.5s"
                  data-wow-delay=".3s">
                  <div class="counter-info">
                     <span class="fcount"> <span class="counter" onclick="location.href='MemberList'"> 100 </span>
                     </span>
                     <h3>회원</h3>
                  </div>
               </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-6">
               <div class="single-counter wow" data-wow-duration="1.5s"
                  data-wow-delay=".3s">
                  <div class="counter-info">
                     <span class="fcount"> <span class="counter"> 20 </span>
                     </span>
                     <h3>동네서점</h3>
                  </div>
               </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-6">
               <div class="single-counter wow" data-wow-duration="1.5s"
                  data-wow-delay=".3s">
                  <div class="counter-info">
                     <span class="fcount"> <span class="counter"> 91 </span>
                     </span>
                     <h3>대형서점</h3>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Counter Area End -->

    <div id="wrapper">

        <!-- Navigation -->
        <nav>
            <div class="navbar-default sidebar" role="navigation" style="margin-top: 0;">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                     <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                  <span><strong>메뉴</strong></span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i>회원 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a id="member">사용자</a>
                                </li>
                                <li>
                                    <a id="owner">Owner 수락</a>
                                    <!-- owner=1로 바꾸고, website에 id넣기 -->
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i>서점 관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a id="bookstore">동네 서점</a>
                                </li>
                                <li>
                                    <a id="gbookstore">대형 서점</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 환경 설정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">추가할 내용</a>
                                </li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
        <div id="page-wrapper">
        </div>
   </div>
    <%@include file="footer2.jsp"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
	   // 사용자
	   $('#member').click(member);
	     
	   // owner
	   $('#owner').click(owner);
	     
	   // 동네서점
	   $('#bookstore').click(bookstore);
	     
	   // 대형서점
	   $('#gbookstore').click(gbookstore);
	     
	   function member() {
		    $('#page-wrapper').empty();
	        $.ajax({
	           url: "MemberList",
	           type: 'post',
	           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	           success: function(retVal) {
	           var searchResult = ''
	                 if(retVal.code == "OK") { //controller에서넘겨준성공여부코드
	                     values = retVal.memberlist ; //java에서정의한ArrayList명을적어준다.
	                     $.each(values, function( index, value ) {
	                   searchResult += MemberHtml(value);
	                     });
	                 }
	                 else {
	                     alert("실패");
	                 }
	              $('#page-wrapper').append('<div class="row"><div class="col-lg-12"><h1 class="page-header">User Tables</h1></div></div>'+
	                    '<div class="row"><div class="col-lg-12"><div class="panel panel-default"><div class="panel-heading"></div>'+
	                    '<div class="panel-body"><table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">'+
	                   '<thead><tr><th>id</th><th>name</th><th>phonenumber</th><th>mail</th>'+
	                     '<th>likecount</th><th>owner</th><th>수정</th><th>삭제</th></tr></thead><tbody>');
	              $('#dataTables-example').append(searchResult);
	              $('#dataTables-example').append('</tbody></table></div></div></div></div>');
	             },
	           error:function(request,status,error){
	                alert("code:"+request.status+"\n"+"error:"+error);
	            },
	        });
	   }
	   
	   function owner() {
		    $('#page-wrapper').empty();
	        $.ajax({
	           url: "ownerandbookstore",
	           type: 'post',
	           contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	           success: function(retVal) {
	           var searchResult = ''
	                 if(retVal.code == "OK") { //controller에서넘겨준성공여부코드
	                     values = retVal.ownerandbookstoreList ; //java에서정의한ArrayList명을적어준다.
	                     $.each(values, function( index, value ) {
	                   searchResult += OwnerandBookstoreHtml(value);
	                     });
	                 }
	                 else {
	                     alert("실패");
	                 }          
 	              $('#page-wrapper').append('<div class="row"><div class="col-lg-12"><h1 class="page-header">Owner Tables</h1></div></div>');
	              $('#page-wrapper').append(searchResult);
	             },
	           error:function(request,status,error){
	                alert("code:"+request.status+"\n"+"error:"+error);
	            },
	        });
	   }
	   function bookstore() {
	          $('#page-wrapper').empty();
	           $.ajax({
	              url: "bookstoreList",
	              type: 'post',
	              contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	              success: function(retVal) {
	              var searchResult = ''
	                    if(retVal.code == "OK") { //controller에서넘겨준성공여부코드
	                        values = retVal.bookstorelist ; //java에서정의한ArrayList명을적어준다.
	                        $.each(values, function( index, value ) {
	                      searchResult += BookstoreHtml(value);
	                        });
	                    }
	                    else {
	                        alert("실패");
	                    }
	              $('#page-wrapper').append('<div class="row"><div class="col-lg-12"><h1 class="page-header">Bookstore Tables</h1></div></div>'+
	                    '<div class="row"><div class="col-lg-12"><div class="panel panel-default"><div class="panel-heading"></div>'+
	                    '<div class="panel-body"><table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">'+
	                   '<thead><tr><th>num</th><th>storename</th><th>branchname</th><th>latitude</th>'+
	                     '<th>longitude</th><th>address</th><th>phonenum</th><th>수정</th><th>삭제</th></tr></thead><tbody>');
	              $('#dataTables-example').append(searchResult);
	              $('#dataTables-example').append('</tbody></table></div></div></div></div>');
	                },
	              error:function(request,status,error){
	                   alert("code:"+request.status+"\n"+"error:"+error);
	               },
	           });
	      }
	      
	      function gbookstore() {
	          $('#page-wrapper').empty();
	           $.ajax({
	              url: "gbookstoreList",
	              type: 'post',
	              contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	              success: function(retVal) {
	              var searchResult = ''
	                    if(retVal.code == "OK") { //controller에서넘겨준성공여부코드
	                        values = retVal.gbookstorelist ; //java에서정의한ArrayList명을적어준다.
	                        $.each(values, function( index, value ) {
	                      searchResult += BookstoreHtml(value);
	                        });
	                    }
	                    else {
	                        alert("실패");
	                    }          
	              $('#page-wrapper').append('<div class="row"><div class="col-lg-12"><h1 class="page-header">Great Bookstore Tables</h1></div></div>'+
	                    '<div class="row"><div class="col-lg-12"><div class="panel panel-default"><div class="panel-heading"></div>'+
	                    '<div class="panel-body"><table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">'+
	                   '<thead><tr><th>num</th><th>storename</th><th>branchname</th><th>latitude</th>'+
	                     '<th>longitude</th><th>address</th><th>phonenum</th><th>수정</th><th>삭제</th></tr></thead><tbody>');
	              $('#dataTables-example').append(searchResult);
	              $('#dataTables-example').append('</tbody></table></div></div></div></div>');
	                },
	              error:function(request,status,error){
	                   alert("code:"+request.status+"\n"+"error:"+error);
	               },
	           });
	      }
	     
	     
	    function MemberHtml(data){
	       var html = '';
	       html += '<tr class="odd gradeX">';
	       html += '<input class="id" type="hidden" value="'+data.id+'"/>';
	       html += '<td>' + data.id + ' </td>';
	       html += '<td>' + data.name + ' </td>';
	       html += '<td>' + data.phonenumber + ' </td>';
	       html += '<td>' + data.mail + ' </td>';
	       html += '<td>' + data.likecount + ' </td>';
	       html += '<td>' + data.owner + ' </td>';
	       html += '<td><a href="MemberUpdateForm?id=${sessionScope.loginInfo.getId() }">수정</a></td>';
	       html += '<td><a class="deleteMember">삭제</a></td></tr>';
	       return html;
	     }
	    
	    function BookstoreHtml(data){
	       var html = '';
	       html += '<tr class="odd gradeX">';
	       html += '<td>' + data.branchid + ' </td>';
	       html += '<input class="branchid" type="hidden" value="' + data.branchid + '"/>';
	       html += '<td>' + data.storename + ' </td>';
	       html += '<td>' + data.branchname + ' </td>';
	       html += '<td>' + data.latitude + ' </td>';
	       html += '<td>' + data.longitude + ' </td>';
	       html += '<td>' + data.address + ' </td>';
	       html += '<td>' + data.phonenum + ' </td>';
	       html += '<td><a href="BookstoreUpdateForm?id=${sessionScope.loginInfo.getId() }">수정</a></td>';
	       html += '<td><a class="deleteBookstore">삭제</a></td></tr>';
	       
	       return html;
	     }
	    

    
    function OwnerandBookstoreHtml(data){
        var html = '';
        html += '<div class="row"><div class="col-lg-12"><div class="panel panel-default"><div class="panel-heading"></div>';
        html += '<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">';
        html += '<input class="branchid" type="hidden" value="' + data.branchid + '"/>';
        html += '<input class="id" type="hidden" value="' + data.id + '"/>';
        html += '<tr><td rowspan="7" align="center" style="width: 350px;"><img src="upload/' + data.bookstorepic +'" style="width: 280px; height: 180px; margin-top: 10px;"></td></tr>';
        html += '<tr><th width="200px" style="text-align: center;">동네서점명</th><td>' + data.branchname + '</td></tr>'
        html += '<tr><th style="text-align:center;">서점 주소</th><td>' + data.address + '</td></tr>'
        html += '<tr><th style="text-align:center;">서점 전화번호</th><td>' + data.phonenum + '</td></tr>'
        html += '<tr><th style="text-align:center;">신청인 아이디</th><td>' + data.id + '</td></tr>'
        html += '<tr><th style="text-align:center;">신청인 이름</th><td>' + data.name + '</td></tr>'
        html += '<tr><th style="text-align:center;">신청인 휴대폰번호</th><td>' + data.phonenumber + '</td></tr></table>';
        html += '<span style="float:right; margin:5px; padding-bottom:20px;"><input type="submit" class="btn button button-small" id="acceptOwner" value="거절"/></span>';
        html += '<span style="float:right; margin:5px; padding-bottom:20px;"><input type="submit" class="btn button button-small" id="denyOwner" value="승인"/></span>';
        html += '</div></div></div></div>';
        return html;
      }
    
    // 사용자, owner 삭제
    $(document).on("click",".deleteMember",function(){
    	var id = $('.id').val();
    	$.ajax({
            url: "MemberDelete",
            data: {"id":id},
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(retVal) {
                  if(retVal.code == "user") {
                      member();
                  }
                  else if(retVal.code =="owner") {
                  	  owner();
                  }
                  else {
                      alert("실패");
                  }                   
              },
            error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"error:"+error);
             },
         });
     }); 
    
    // 동네서점, 대형서점 삭제
    $(document).on("click",".deleteBookstore",function(){
    	var branchid = $('.branchid').val();
    	$.ajax({
            url: "BookstoreDelete",
            data: {"branchid":branchid},
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(retVal) {
            	if(retVal.code == "bookstore") {
                    bookstore();
                }
                else if(retVal.code =="gbookstore") {
                	gbookstore();
                }
                else {
                    alert("실패");
                }                    
              },
            error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"error:"+error);
             },
         });
     });
    
    // 동네서점 승인
    $(document).on("click",".acceptOwner",function(){
    	var branchid = $('.branchid').val();
    	var id = $('.id').val();
    	$.ajax({
            url: "acceptOwner",
            data: {"id":id,"branchid":branchid},
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(retVal) {
            	if(retVal.code == "OK") {
        			owner();
                });
            }
            else {
                alert("실패");
            }                  
              },
            error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"error:"+error);
             },
         });
     }); 
    
 // 동네서점 거절
    $(document).on("click",".denyOwner",function(){
    	var branchid = $('.branchid').val();
    	var id = $('.id').val();
    	$.ajax({
            url: "denyOwner",
            data: {"id":id,"branchid":branchid},
            type: 'post',
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            success: function(retVal) {
            	if(retVal.code == "OK") {
            			owner();
                    });
                }
                else {
                    alert("실패");
                }                  
              },
            error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"error:"+error);
             },
         });
     }); 
    
    
    </script>
    
</body>

</html>