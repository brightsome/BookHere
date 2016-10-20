<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- style css -->
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Here</title>
</head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<body style="background-color: #333333;">
	<div class="login-account section-padding2">
           <div class="container">
                <div class="row">
                    <div class="col-md-2 col-sm-2">
                       <form action="managerlogin" class="create-account-form" method="post" style="width: 50%; min-height: 250px; margin-top: 50px;">
                            <h2 class="heading-title" style="font-size: 25px">
                                MANAGER LOGIN
                            </h2>
                            <p class="form-row" style="width: 95%">
                                <input name="id" id="id" type="text" placeholder="Manager ID">
                            </p>
                            <p class="form-row" style="width: 95%">
                                <input name="password" id="password" type="password" placeholder="Password">
                            </p>
                            <center>
                                <button name="login" id="login" type="submit" class="button2">
                                    <span>                                   
                                        <i class="fa fa-user left"></i>
                                        LOGIN
                                    </span>
                                </button>  
						 	</center>   
                       </form>
                    </div>
                </div>               
           </div>
        </div>
</body>
</html>