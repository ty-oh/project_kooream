<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
   .content_area{
      overflow: hidden;
      max-width: 780px;
      min-height: 900px;
      margin: 0 auto;
      padding: 20px 40px 160px;
      background-color: #fafafa;
   }
   
   .buy_before{
      -webkit-box-align: center;
      align-items: center;
      width: 100%;
      margin-bottom: 20px;
   }
   
   .product_info{
      padding: 12px 32px;
      background-color: #fff;
   }
   
   .product_image{
      border-radius: 7px;
      height: 80px;
      width: 80px;
      float: left;
      margin-right: 16px;
      position: relative;
   }
   
   .code{
      line-height: 17px;
      font-size: 14px;
      font-weight: 700;
   }
   
   .name{
      line-height: 17px;
      font-size: 14px;
   }
   
   .kor_name{
      line-height: 16px;
      font-size: 13px;
      letter-spacing: -.05px;
      color: rgba(34,34,34,.5);
   }
   
   .p_size{
      font-size: 14px;
      font-weight: 700;
      margin-top: 7px;
      margin-bottom: 7px;
   }
   
   .section_total{
      padding: 32px;
      background-color: #fff;
      border-top: 8px solid #fafafa;
   }
   
   .title_txt{
      line-height: 22px;
      font-size: 18px;
      font-weight: 700;
      letter-spacing: -.15px;
   }
   
   .add_more_btn{
      margin-left: auto;
      padding-left: 2px;
      font-size: 13px;
      letter-spacing: -.07px;
      color: rgba(34,34,34,.5);
   }
   
   .section_title{
      display: flex;
      -webkit-box-align: center;
      align-items: center;
      padding-bottom: 12px;
   }
   
   .delivery_info{
      display: flex;
      width: 100%;
      height: 44px;
      border-radius: 10px;
      border: 1px solid #ebebeb;
      background-color: #fafafa;
      -webkit-box-align: center;
      align-items: center;
   }
   
   .guide_txt{
      margin-top: 7px;
      width: 100%;
      font-size: 14px;
      letter-spacing: -.21px;
      color: rgba(34,34,34,.5);
      height: 44px;
       border-radius: 10px;
       border: 1px solid #ebebeb;   
       background-color: #fafafa;
       -webkit-box-align: center;
       align-items: center;
       padding: 14px 12px;
   }
   
   .shipping_memo{
      position: relative;
      margin-top: 12px;
   }
   
   .button_shipping{
      font-size: 14px;
      height: 48px;
      padding: 14px 12px;
      -webkit-box-flex: 0;
      border: 1px solid #ebebeb;
      border-radius: 10px;
      width: 100%;
      text-align: left;
      cursor: pointer;
   }
   
   button{
      outline: none;
      background: none;
      background-color: transparent;
      appearance: none;
   }
   
   .button_shipping_memo{
      color: rgba(34,34,34,.3);
   }
   
   .section_unit2{
      margin-top: 22px;
      padding-top: 15px;
      border-top: 1px solid #ebebeb;
   }
   
   .delivery_option{
      background: #fafafa;
      border: 1px solid #ebebeb;
      cursor: not-allowed;
      padding: 12px 15px;
      border-radius: 10px;
   }
   
   .way_info{
      display: flex;
      -webkit-box-align: center;
      align-items: center;
      width: 100%;
   }
   
   .way_status{
      -webkit-box-flex: 0;
      flex: none;
      margin-right: 14px;
   }
   
   .way_img{
      width: 40px;
      height: 40px;
   }
   
   img{
      border: 0;
      vertical-align: top;
   }
   
   .company{
      font-size: 14px;
      letter-spacing: -.21px;
      line-height: 17px;
   }
   
   .badge_title{
      font-weight: 600;
   }
   
   .sub_txt{
      line-height: 16px;
      margin-top: 3px;
      font-size: 14px;
      color: rgba(34,34,34,.5);
   }
   
   .instant_group{
      padding-top: 22px;
   }
   
   .order_info{
      padding-top: 0;
      border-top: 0;
      padding-bottom: 19px;
      border-bottom: 2px solid #ebebeb;
   }
   
   .price_box{
      display: block;
      line-height: 26px;
       font-size: 20px;
       font-weight: 600;
       letter-spacing: normal;
   }
   
   .price_title{
      width: 100%;
      font-size: 14px;
      font-weight: 700;
      letter-spacing: -.01px;
   }
   
   .amount{
      width: 100%;
      text-align: right;
      display: block;
   }
   
   .price_addition{
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
      -webkit-box-align: center;
      align-items: center;
      min-height: 26px;
      font-size: 13px;
      letter-spacing: -.07px;
      font-weight: 700;
   }
   
   .price_bind{
      padding-top: 11px;
      font-size: 13px;
      letter-spacing: -.07px;
   }
   
   .price_tilte{
      color: #222;
   }
   
   .price_text{
      text-align: right;
      white-space: nowrap;
      color: #222;
      font-size: 14px;
      letter-spacing: -.21px;
   }
   
   .price_title2, .price_text2{
      font-weight: normal;
      color: rgba(34,34,34,.5);
   }
   
   .check_list {
      padding-bottom: 16px;
   }
   
   ul{
      list-style: none;
   }
   
   .notice_maintext{
      line-height: 18px;
      font-size: 15px;
      letter-spacing: -.01px;
   }
   
   .notice_subtext{
      margin-top: 4px;
      line-height: 16px;
      font-size: 13px;
      letter-spacing: -.05px;
      color: rgba(34,34,34,.5);
   }
   
   .chbox{
      margin-left: auto;
   }
   
   .notice_group{
      display: flex;
      -webkit-box-align: center;
      align-items: center;
      padding: 19px 0 20px;
      width: 100%;
   }
   
   .text_group{
      margin-right: 20px;
      word-break: keep-all;
      word-wrap: break-word;
   }
   
   .notice2{
      border-top: 1px solid #ebebeb;
   }
   
   .check_d{
      display: inline-block;
      float: right;
   }
   
   .price_box2{
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
      -webkit-box-align: center;
      align-items: center;
   }
   
   .price_title3{
      line-height: 18px;
      font-size: 15px;
      letter-spacing: -.01px;
      font-weight: 700;
   }
   
   .now_buy_btn{
      margin-top: 10px;
      font-weight: 600;
   }
   
      .btn_box{
      width: 100%;
      font-size: 16px;
      letter-spacing: -.16px;
      height: 52px;
      border-radius: 12px;
      color: #fff;
      background-color: #222;
      vertical-align: middle;
      text-align: center;
      align-items: center;
    }
    
    .full{
      display: inline-flex;
      cursor: pointer;
      -webkit-box-align: center;
      align-items: center;
      -webkit-box-pack: center;
      justify-content: center;
      vertical-align: middle;
      text-align: center;
    }


</style>

<div class="content_area">
	<sec:authentication property="principal.member" var="pri"/>	<!-- 시큐리티에서 member정보 가지고오기  -->
	<form name="now_buy" method="post" id="now_buy">
		<div class="buy_before">
			<div class="product_info">
				<div class="product_info">
					<div class="infobox">
						<c:forEach items="${imageUrls}" var="imageUrl" begin="0" end="0">
							<img class="product_image" src="${imageUrl }">
						</c:forEach>
						<!-- <img class="product_image" src="/resources/img/ps5.png"> -->
						<div class="product_infobox">
						<div class="code">${vo.p_model_no }</div>
						<div class="name">${vo.p_name_en }</div>
						<div class="kor_name">${vo.p_name_ko }</div>
						<div class="p_size">${vo2.pp_size }</div>
						</div>
					</div>
				</div>
			</div>
			<div class="section_total">
				<div class="section_unit">
					<div class="section_title">
                  <h3 class="title_txt">배송 주소</h3>
                  <!-- <a href="#" class="add_more_btn">+ 새 주소 추가</a> -->
               		</div> 
               		<input type="checkbox" id="copyAddr">기본 배송지선택
               		<div><input type="text" class="guide_txt" 
                                 id="sample6_address" 
                                 name="m_addr" onclick="sample6_execDaumPostcode()" 
                                 placeholder="주소를 입력해주세요."></div>
               <div><input type="text" class="guide_txt" id="sample6_detailAddress" name="m_Detail_addr" placeholder="상세주소를 입력하세요."></div>
              		<input type="hidden" name = "m_adress" value="">
               <!-- <a href="#" class="delivery_info">
                  <span class="guide_txt">
                     주소를 입력해주세요.
                  </span>
               </a> -->

<!---------------------------------------배송 관련----------------------------------------------------------------  -->
				<div class="shipping_memo">
					<input type="text" class="button_shipping">
					<span class="button_shipping_memo">배송 시 요청사항을 입력하세요.</span>						
				</div>
				</div>
				<div class="section_unit2">
					<div class="section_title">
						<h3 class="title_txt"> 배송 방법</h3>
					</div>
					<div class="section_content">
						<div class="delivery_option">
							<div class="way_info">
								<div class="way_status">
									<img src="/resources/img/deliverycar.png" class="way_img">
								</div>
								<div class="way_desc">
									<p class="company">
										<span class="badge_title">구림에서 직접 배송</span>
										<span>무료</span>
									</p>
									<p class="sub_txt">
									구림에서 직접 택배 배송
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!--------------------- 배송 끝 ------------------->
			<div class="section_total">
				<div class="section_title">
					<h3 class="title_txt">최종 주문 정보</h3>
				</div>
				<div class="instant_group">
					<div class="order_info">
						<dl class="price_box">
							<dt class="price_title">총 결제금액</dt>
							<dd class="price empty_price">
								<span class="amount"><fmt:formatNumber value="${vvo }" pattern="#,###,###원"/></span>
								
							</dd>
						</dl>
					</div>
					<div class="price_bind">
						<dl class="price_addition">
							<dt class="price_title"><span>구매가 희망가</span></dt>
							<dd class="price_text"><fmt:formatNumber value="${vvo }" pattern="#,###,###원"/></dd>
						</dl>
						<dl class="price_addition">
							<dt class="price_title2"><span>배송비</span></dt>
							<dd class="price_text2">무료</dd>
							<dt class="price_title2"><span>수수료</span></dt>
							<dd class="price_text2">무료</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="section_total">
				<div>
					<ul class="check_list">
						<li>
							<div class="notice_group">
								<div>
									<input type='checkbox' name="check_all" value='selectall' onclick='selectAll(this)'> 
									<b>전체 선택</b>
								</div>
							</div>
							<div class="notice_group">
								<div class="text_group">
									<p class="notice_maintext">판매자의 판매거부, 배송지연, 미입고 등의 사유가 발생할 경우, 거래가 취소될 수 있습니다.</p>
									<p class="notice_subtext">앱 알림 해제, 알림톡 차단, 전화번호 변경 후 미등록 시에는 거래 진행 상태 알림을 받을 수 없습니다.</p>
								</div>
								<div>
									<input type="checkbox" class="chbox" id="cbcon" name="check_all">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">구매 입찰의 거래가 체결되면, 단순 변심이나 실수에 의한 취소가 불가능합니다.</p>
									<p class="notice_subtext">본 거래는 개인간 거래로 전자상거래법(제17조)에 따른 청약철회(환불, 교환) 규정이 적용되지 않습니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" id="cbcon" name="check_all">
								</div>
							</div>
							<div class="notice_group notice2">
								<div class="text_group">
									<p class="notice_maintext">구매 조건을 모두 확인하였으며, 입찰 진행에 동의합니다.</p>
								</div>
								<div class="check_d">
									<input type="checkbox" class="chbox" id="cbcon" name="check_all">
									<input type="hidden" name="p_no" value="${vo.p_no }">
									<input type="hidden" name="pp_size" value="${vo2.pp_size }">
									<input type="hidden" name="bid_sell" id="bid_sell" value="${vvo }">
								</div>
							</div>
						</li>
					</ul>
					<div class="price_total">
						<dl class="price_box2">
							<dt class="price_title3">입찰 금액</dt>
							<dd class="empty_price2"><fmt:formatNumber value="${vvo }" pattern="#,###,###원"/></dd>
						</dl>
					</div>
					<div class="now_buy_btn">
						<div class="btn_box full" >구매 입찰 하기</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api 사용하기 위해 명시 -->
<script type="text/javascript">
$(function(){
	
	$("#copyAddr").on("click", function(){
		if($(this).is(':checked')){
			var addrList = "${pri.m_addr}".split("/");
		    $("#sample6_address").val(addrList[0]);
		    $("#sample6_detailAddress").val(addrList[1]);
		}else{
			$("#sample6_address").val("");
			$("#sample6_detailAddress").val("");
		}
	});	
});
	var m_no = $('input[name="pri_m_no"]').val();
	var addr = $("#sample6_address").val() + $("#sample6_detailAddress").val();
	var m_no_input = '<input type="hidden" name ="m_no" value="'+ m_no +'">' +
	'<input type="hidden" name ="m_adress" value="'+ addr +'">';

	$(".btn_box").on("click",function(){
		if ($('input:checkbox[id="cbcon"]').is(":checked") != true) {
			alert("동의하기 체크박스 선택하여야합니다.")
			return false;
		} else {
			var form = $('form');
			form.attr("action", "/shop/shop_buycomplete");
			console.log(m_no_input);
			console.log(m_no);
			console.log(addr);
			$('.empty_price2').html(m_no_input);
 			$(form).submit();
		}
	});

	function sample6_execDaumPostcode() {
		   new daum.Postcode({
		        oncomplete: function(data) {
		           document.getElementById("sample6_address").value = data.address; // 주소 넣기
		            document.querySelector("#sample6_detailAddress").focus(); //상세입력 포커싱
		        }
		   }).open();
		}
	
	 // 전체 체크 박스 
    function selectAll(selectAll)  {
      const checkboxes 
           = document.getElementsByName('check_all');
      
      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
      })
    }
</script>
<jsp:include page="../include/footer.jsp"/>