<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
   <%@include file="header.jsp" %>
<head>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
</head>
    <body>
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
					    <div class="breadcrumbs">
					       <h2>LOGIN/REGISTER</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="index.jsp">Home</a>
						        </li>
						        <li>회원가입</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 
        <!-- Loging Area Start -->
        <div class="login-account section-padding2">
           <div class="container">
                <div class="row">
<!--                     <div class="col-md-6 col-sm-6"> -->
<!--                         <form action="my-account2.jsp" class="create-account-form" method="post"> -->
<!--                             <h2 class="heading-title">Login</h2>   -->
<!--                             <p class="form-row"> -->
<!--                                 <input type="email" placeholder="Email address"> -->
<!--                             </p> -->
<!--                             <div class="submit">                -->
<!--                                 <button name="submitcreate" id="submitcreate" type="submit" class="btn-default"> -->
<!--                                     <span> -->
<!--                                         <i class="fa fa-user left"></i>회원가입   </span> -->
<!--                                 </button> -->
<!--                             </div> -->
<!--                         </form> -->
<!--                     </div> -->
                    <div class="col-md-6 col-sm-6">
                       <form action="login" class="create-account-form" method="post">
                            <h2 class="heading-title">
                                LOGIN
                            </h2>
                            <p class="form-row">
                                <input name="id" id="id" type="text" placeholder="Id">
                            </p>
                            <p class="form-row">
                                <input name="password" id="password" type="password" placeholder="Password">
                            </p>
                            <center>
                                <button name="login" id="login" type="submit" class="button button-blue">
                                    <span>                                   
                                        <i class="fa fa-user left"></i>
                                        LOGIN
                                    </span>
                                </button>  
                                
                                <!-- 네이버아이디로로그인 버튼 노출 영역 -->
								<div id="naver_id_login"></div>
								<!-- //네이버아이디로로그인 버튼 노출 영역 -->
							        		
	                            
	                            <a href="signup.jsp" class="button button-blue" type="submit">
							   		<span>
							   			<i class="fa fa-user left"></i>
							   			SIGN UP
							   		</span>
								</a>
						 	</center>   
                       </form>
                       
                    </div>
                </div>               
           </div>
        </div>
        
        <form id="loginForm" action="loginCheck" method="post" style="display:none;">
			<input type="text" id="id" name="id" value="" />
			<input type="text" id="password" name="password" type="text" value="naver" />
			<input type="text" id="name" name="name" type="text" value="" />
			<input type="text" id="mail" name="mail" type="text" value="" />
			<input type="text" id="phonenumber" name="phonenumber" value="010-1234-5678" />
		</form>
		
        <!-- Loging Area End -->
		<%@include file="footer.jsp" %>

		<script type="text/javascript">
		<!-- 네이버아디디로로그인 초기화 Script -->
			var naver_id_login = new naver_id_login("GjuWNxUzc_Vxa3Ar17Cq", "http://127.0.0.1:8088/BookHere/login.jsp");
			var state = naver_id_login.getUniqState();
			naver_id_login.setButton("green", 3	, 40);
			naver_id_login.setDomain(".service.com");
			naver_id_login.setState(state);
			naver_id_login.init_naver_id_login();
			naver_id_login.getAccessToken();
		</script>
		
		<!-- 네이버아디디로로그인 Callback페이지 처리 Script -->
		<script type="text/javascript">
			// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
			function naverSignInCallback() {
			      $('#id').val(naver_id_login.getProfileData('email'));
			      $('#name').val(naver_id_login.getProfileData('nickname'));
			      $('#mail').val(naver_id_login.getProfileData('email'));
			      $('#accTok').val(naver_id_login.oauthParams.access_token);
			      if($('#id').val() != null){
			         $('#naver_id_login').hide();
			      }else{
			         $('#naver_id_login').show();
			      }
			      $('#loginForm').submit();
			   }
		
			// 네이버 사용자 프로필 조회
			naver_id_login.get_naver_userprofile("naverSignInCallback()");
		</script>
    </body>
</html>