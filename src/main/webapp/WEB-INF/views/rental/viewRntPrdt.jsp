<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/js/page/rental/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/js/page/rental/slick-theme.css" />
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<style>
/*
	#prdtModBtn{
		float: right;
    	margin-top: -526px;
	}
	#removePrdtForm{
		float: right;
    	margin-top: -526px;
	}
	#prdtModBtn{
		margin-right: -70px;
	}
	*/
#prdtInfo {
	display: inline-block;
	float: right;
}

#infoBox {
	width: 574px;
	font-size: 20px;
	margin-top: -577px;
	border-left: 1px solid #ebebeb;
	padding: 40px;
	margin-right: 25px;
}

#p_name_ko {
	height: 56px;
	font-size: 16px;
	color: #808080db;
}

.rntPrice {
	margin-right: 39px;
	font-size: 13px;
	color: #7c7c7c;
}

#body {
	font-family: -apple-system, BlinkMacSystemFont, Roboto,
		AppleSDGothicNeo-Regular, NanumBarunGothic, NanumGothic, 나눔고딕,
		Segoe UI, Helveica, Arial, Malgun Gothic, Dotum, sans-serif;
	margin-left: 70px;
}

.buy {
	position: relative;
	border-radius: 10px;
	background-color: #41b979;
	border: 0;
	width: 220px;
	color: white;
	padding: 15px 5px 15px 5px;
	text-align: center;
}

.slick-dots {
	margin-bottom: 95px
}
#reviewContent input[type='text']{
	width: 710px;
    height: 50px;
}
#reviewContent{
	text-align: center;
}
#rAll{
	    margin-left: 153px;
    	margin-bottom: 10px;
}
#reviewDeleteBtn, #rpBtn{
	background-color: black;
		color: white;
		font-weight: 700;
    	min-width: 80px;
    	padding: 0 18px;
	    height: 37px;
	    border-radius: 5px;
	    font-size: 14px;
	    letter-spacing: -.14px;
}
#reviews{
	margin-left: 151px;
	border-collapse: collapse;
	margin-top: 39px;
}
#reviews tr{
	border-bottom: 1px solid gray;
}
#intrstRemoveBtn:active,#intrstBtn:active,#rsvtBtn:active,#prdtRemvBtn:active ,#prdtModBtn:active{
 		background-color: #5b9a78;
	}
	#rpBtn:active, #reviewDeleteBtn:active{
		background-color: rgba(34,34,34,.8);
	}
</style>
<jsp:include page="../include/header.jsp" />
<div id="body" style="margin-top: 70px;">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="pri"/>
	</sec:authorize>
	<!-- 상품 이미지-------------------------------------------------------- -->
	<div class="slick" style="width: 502px">
		<c:forEach var="image" items="${imageList }">
			<c:url value="/displayImage" var="url">
				<c:param name="fileName" value="${image.img_url }"/>
			</c:url>
			<div style="width: 700px">
				<img src="${url}"/>
			</div>
		</c:forEach>
	</div>
	<!-- 상품 상세내용-------------------------------------------------------- -->

	<div id="prdtInfo">
		<table id="infoBox">
			<tr>
				<td><span>${pvo.p_brand}</span></td>
				<td style="text-align: right;"><c:choose>
						<c:when test="${interestVO.cnt > 0}">
							<span class="interest">♥</span>
						</c:when>
						<c:otherwise>
							<span class="interest">♡</span>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td colspan="2" style="max-width: 230px;">${pvo.p_name_en }</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #ebebeb; max-width: 230px;"
					colspan="2" id="p_name_ko">${pvo.p_name_ko }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 80px; text-align: right;">
					<div class="rntPrice">1일 기준 대여금액</div>
					<div style="margin-right: 39px;">
						<fmt:formatNumber value="${pvo.r_price }" pattern="#,###,###원"/>
					</div>
				</td>
			</tr>
			<tr>
				<td
					style="text-align: center; border-bottom: 1px solid #ebebeb; padding: 14px;">
					<sec:authorize access="hasRole('ROLE_USER')">
						<input class="buy" type="button" id="intrstRemoveBtn"
							value="관심상품삭제" />
						<input class="buy" type="button" id="intrstBtn" value="관심상품추가" />
					</sec:authorize>
				</td>
				<td
					style="text-align: center; border-bottom: 1px solid #ebebeb; padding: 14px;">
					<sec:authorize access="hasRole('ROLE_USER')">
						<div>
							<input class="buy" id="rsvtBtn" type="button" value="상품예약" />
						</div>
					</sec:authorize>
				</td>
			</tr>
			<tr style="font-size: 14px;">
				<td style="height: 85px; border-bottom: 1px solid #ebebeb;">
					<div style="font-weight: 500;">모델번호</div>
					<div>${pvo.p_model_no }</div>
				</td>
				<td style="border-bottom: 1px solid #ebebeb;">
					<div
						style="font-weight: 500; border-left: 1px solid #ebebeb; padding: 15px 30px 0px;">출시가</div>
					<div style="border-left: 1px solid #ebebeb; padding: 0px 30px 15px;">
						<fmt:formatNumber value="${pvo.p_release_price }" pattern="#,###,###원"/>
					</div>
				</td>
			</tr>
			<tr>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td style="text-align: center; padding: 14px;"><input
						id="prdtModBtn" class="buy" type="button" value="상품수정" /></td>
					<td style="text-align: center; padding: 14px;">
						<form id="removePrdtForm" action="/rental/removeRntPrdt"
							method="post">
							<input class="buy" type="button" id="prdtRemvBtn" value="상품삭제" />
							<input type="hidden" name="p_no" value="${pvo.p_no }">
						</form>
					</td>
				</sec:authorize>
			</tr>
		</table>
	</div>
	<!-- 한줄평 등록-------------------------------------------------------- -->
	<sec:authorize access="isAuthenticated()">
		<form id="reviewForm"  method="post">
			<!--별점  -->
			<div id="rAll">
				<span id="1" data-rval="n">☆</span> 
				<span id="2" data-rval="n">☆</span>
				<span id="3" data-rval="n">☆</span> 
				<span id="4" data-rval="n">☆</span>
				<span id="5" data-rval="n">☆</span>
			</div>

			<div id="reviewContent">
				<input type="text" placeholder="한줄평을 남겨주세요.(최대 30자)" name="rp_content" maxlength="30" /> 
				<sec:authorize access="isAuthenticated()">
					<input type="button" id="rpBtn" value="한줄평 등록" />
				</sec:authorize>
				<input type="hidden" name="p_no" value="${pvo.p_no }" /> 
				<input id="rst" type="hidden" name="rating" />
			</div>
		</form>
	</sec:authorize>






	<!-- 한줄평 리스트 출력--------------------------------------------------------------------------- -->
	<table class="table table-stripped" id="reviews">
		<thead>
			<tr>
				<th style=" height: 37px;">Rating</th>
				<!-- 평점 -->
				<th style="width: 125px; text-align: center;">User</th>
				<th style="width: 469px;">Text</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="reviewList">
		</tbody>
	</table>

</div>



<script type="text/javascript" src='/resources/js/page/rental/slick.min.js'></script>
<script type="text/javascript">
	
	var $ = jQuery.noConflict();	// j쿼리 충돌 막기 위해서 적어줌
	// -------------------------------------------------------------------------------------onload start
	$(function(){
		// 페이지 로드시 cnt가 0보다 클경우(관심상품 추가가 되어있는경우) 관심상품삭제 버튼으로 보이게
		if("${interestVO.cnt}"> 0){
			$("#intrstBtn").hide();
		}else{
			$("#intrstRemoveBtn").hide();
		}
		
		// 댓글 불러오기
		getReview();
		
		
		
		// 상품 수정 버튼 클릭 이벤트----------------------------------------------------------
		$("#prdtModBtn").on("click", function(){
			location.href="/rental/updateRntPrdtPage?p_no=${pvo.p_no}";
		});
		
		// 사진 슬라이드 효과 주기위한 옵션
		$('.slick').slick({
			  dots: true, //페이지 네비게이션
			  arrows:true, // next, prev 이동 버튼
			  autoplay:true, // 자동 넘김 여부
			  infinite: false, //반복설정
			  speed: 300, //슬라이드 속도
			  autoplaySpeed : 10000,   // 자동 넘김시 슬라이드 시간
			  pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
			  vertical : false,  // 세로 방향 슬라이드 옵션
			  prevArrow : "<button type='button' class='slick-prev' value=←>Previous</button>",        
			  nextArrow : "<button type='button' class='slick-next'value=→>Next</button>", //화살표 커스텀
			  slidesToShow: 1, //보여질 슬라이드 수
			  slidesToScroll: 1, //넘겨질 슬라이드 수
			  responsive: [ // -> 반응형 옵션
			    {
			      breakpoint: 480,// 반응형 ~ 480
			      settings: {
			        slidesToShow: 1,
			        slidesToScroll: 1
			      }
			    }
			 ]
		});
		
		// 상품 삭제 버튼 클릭 이벤트--------------------------------------------
		$("#prdtRemvBtn").on("click", function(){
			if(confirm("상품을 삭제하시겠습니까?")){
				$("#removePrdtForm").submit();
			}else{
				return;
			}
		});
		
		// 별점 선택시 색칠----------------------------------------------------
		$("#rAll").on("click", function(){
			var idx = event.target.id;
			var str = '';
			/* event.target : 클릭이 된 요소 , event.type : 이벤트 타입을 알려줌(ex)click, keyboard, mouse 등등) */
			if(event.target.tagName=='SPAN'){
				for(var i=0; i<5; i++){
					if(i<idx){
						str += '<span id='+(i+1)+'>★&nbsp;</span>';
					}else{
						str += '<span id='+(i+1)+'>☆&nbsp;</span>';
					}
				}
				$("#rst").val(idx);
				$("#rAll").html(str);
			
			}
		});
		
		// 댓글 적합성 검사-------------------------------------------------------------------
		$("#rpBtn").on("click", function(){

			var rst = $("#rst").val();
			var rp_content = $("input[name='rp_content']").val();
			
			if(rst == '' || rst == 0){
				alert("별점을 선택해주세요.");
				return;
			}
			if(rp_content.length < 10){
				alert("10자 이상 입력해주세요.");
				return;
			}
			
			$.ajax({
				type : "POST",            
		         url : "/rental/ajax/rgstReview",      
		         data : $("#reviewForm").serialize(), 
		         success : function(result){
		        	 if(result>0){
			        	 getReview();
		        	 }else{
						console.log("댓글 등록 실패");        		 
		        	 }
		         }			
			});
		});
		// 상품예약 버튼 클릭 이벤트------------------------------------------------------------
		$("#rsvtBtn").on("click", function(){
			location.href="/rsvt/rsvtPage?p_no=${pvo.p_no}";
		});
		
		// 관심 상품 버튼 클릭 이벤트-----------------------------------------------------------
		$("#intrstBtn").on("click", function(){
			interestAjax('insert');
		});
		
		
		// 관심 상품 삭제 버튼 클릭 이벤트-----------------------------------------------------------
		$("#intrstRemoveBtn").on("click", function(){
			interestAjax('remove');	
		});
		
		
		
		
		
		
		
	});
	// -------------------------------------------------------------------------------------onload end
	
	function interestAjax(type){
		var url = '';
		if(type == 'insert'){
			url = "/rental/insertInterest";
		}else{
			url = "/rental/removeInterest";
		}
		
		$.ajax({
            type : "POST",            
            url : url,      
            data : {p_no: "${pvo.p_no}"},
            dataType : 'json',
            success : function(result){
				if(result>0){
					if(type == 'insert'){
						$(".interest").html("♥");
						$("#intrstBtn").hide();
						$("#intrstRemoveBtn").show();
					}else{
						$(".interest").html("♡");
						$("#intrstRemoveBtn").hide();
						$("#intrstBtn").show();
					}
				}else{
					alert("관심 상품 " + (type == 'insert' ? '추가' : '삭제') + "를 실패하였습니다.")
				}
            }
        });
	}
	
	// 댓글 불러오는 ajax---------------------------------------------------
	function getReview(){
		
		$.ajax({
			 type : "POST",            
	         url : "/rental/ajax/getReview",      
	         data : {p_no: "${pvo.p_no}"},
	         dataType : 'json',
	         success : function(reviewList){
		        
	        	 var str='';
	        	 if(reviewList.length){
		        	 for(var i=0; i<reviewList.length; i++){
		        		
		        		str += '<tr>';
		        		str += '<td style=" height: 37px;">';
		        		for(var j=0; j<5; j++){
		        			if(reviewList[i].rating>j){				// reviewList[i] -> object형태로 덧글데이터를 들고있음 ㅣ둫ㅅ
				        		str += '<span>★&nbsp;</span>';
		        			}else{
				        		str += '<span>☆&nbsp;</span>';
		        			}
		        		}
		        		str += '</td>';
		        		str += '<td>'+reviewList[i].m_nickname+'</td>';
		        		str += '<td>';
		        		str += '<span>'+reviewList[i].rp_content+'</span>'; 
		        		str += '</td>';
		        		str += '<td>';
		        		if("${pri.m_no}"==reviewList[i].m_no || "${pri.authList[0].auth}"=='ROLE_ADMIN'){
			        		str += '<input type="button" id="reviewDeleteBtn" onclick="goRemoveReview('+reviewList[i].rp_idx+','+reviewList[i].p_no+')" value="삭제">';
		        		}
		        		str += '</td>';
		        		str += '</tr>';
		        		 
		        	 }
	        	 }else{
	        		 str = '<tr><td colspan="4" style=" height: 37px;">댓글이 없습니다.</td></tr>';
	        	 }
		         $("#reviewList").html(str);
	         }
		}); 
		
		
	}
	
	// 댓글 삭제하는 함수-------------------------------------------------------
	
	function goRemoveReview(rp_idx,p_no){
		
		var f = document.createElement('form');
		var obj1;
		obj1 = document.createElement('input');
		obj1.setAttribute('type', 'hidden');
		obj1.setAttribute('name', "rp_idx");
		obj1.setAttribute('value', rp_idx);
		
		var obj2;
		obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', "p_no");
		obj2.setAttribute('value', p_no);
		
		f.appendChild(obj1);
		f.appendChild(obj2);
		f.setAttribute('method', 'post');
		//f.setAttribute('action', '/rental/removeReview');
		document.body.appendChild(f);
		
		$.ajax({
			type : "POST",            
	         url : "/rental/ajax/removeReview",      
	         data : $(f).serialize(), // createElement는 j쿼리 문법이 아니므로 serialize사용을 위해 f를 j쿼리로 바꿔줘야함
	         success : function(result){
	        	 if(result>0){
		        	 getReview();
	        	 }else{
					console.log("댓글 삭제 실패");        		 
	        	 }
	         }			
		});
		
		
	}
	
	
	



</script>

<jsp:include page="../include/footer.jsp" />