<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
    <%@include file="header.jsp" %>
    <body>
        <!-- Breadcrumbs Area Start -->
        <div class="breadcrumbs-area">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                   <div class="breadcrumbs">
                      <h2>서점 등록</h2> 
                      <ul class="breadcrumbs-list"> 
                          <li>
                              <a title="Return to Home" href="index.jsp">Home</a>
                          </li>
                          <li>서점 등록</li>
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
                     <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                           
                           <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne"
                           style=>
                        
                              <div class="panel-body">
                                 <div class="coupon-info">
                                   <h2 class="heading-title">서점 등록하기</h2>
                                    <form action="BookstoreInsert" method="post" enctype="multipart/form-data">
                                       <input name="id" type="hidden" value="${sessionScope.loginEmail}">
                                       <p class="required">*서점명</p>
                                       <p class="form-row">
                                          <input name="branchname" type="text" placeholder="서점명을 입력해주세요*">
                                       </p>
                                       <p class="required">*주소</p>
                                       <p class="form-row">
                                          <input name="address" id="address" type="text" placeholder="주소를 입력해주세요" readonly="readonly" onclick="execDaumPostcode()"><br/><br/>
                                          <input name="addressDetail" id="addressDetail" type="text" placeholder="상세주소를 입력해주세요">
                                       </p>
                                       <p class="required">*전화번호</p>
                                       <p class="form-row">
                                          <input name="phonenum" type="text" placeholder="전화번호를 입력해주세요*" />
                                       </p>
                                       	<p class="required">*서점 이미지</p>
										<p class="form-row">
											<input type="file" name="bookstorefile" id="bookstorefile">
										</p>
<!--                                        <p class="required">*재고엑셀파일</p>
                                       <p class="form-row">
                                          <input type="file" id="fileattach" name="fileattach" />
                                       </p> -->
                                    <center>
	                                    <input type="submit" class="btn button button-small" value="확인"/>
	                                    <input type="reset" class="btn button button-small" value="취소"/>
                                    </center>
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
      
      <!-- 주소 검색 -->
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = ''; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    fullAddr = data.roadAddress;
		
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    fullAddr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		                if(data.userSelectedType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('address').value = fullAddr;
		
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById('addressDetail').focus();
		            }
		        }).open();
		    }
		</script>
    
    <%@include file="footer.jsp" %>
</html>