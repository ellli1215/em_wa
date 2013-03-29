<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>이마트몰, 당신과 가장 가까운 이마트</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link rel="shortcut icon" href="http://img.emart.co.kr/front_2010/images/main/ico/emartico.ico" />
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js_new/jquery-1.6.2.min.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js_new/jquery.easing.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js_new/emart_lib_new.js"></script>
<script type="text/JavaScript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/ajax.js"></script>
<script type="text/JavaScript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js_new/common.js"></script>
<script type="text/JavaScript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/openwin.js"></script>
<script type="text/JavaScript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/link.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/indexJumpoPopCommon.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/form.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/validate.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/number.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js/text.js"></script>
<script type="text/javascript">
//<![CDATA[
	// 로그인 후 콜백
	function fn_loginCallBack(){

		with( document.reloadForm ){

			action = "/common.do";
			submit();
		}
	}
	// 실시간 로그인 체크 - ajax를 통한 로그인 체크후 로그인이 안되어있다면 로그인 팝업을 띄운다.
	// 회원여부체크의 경우 type은 넘길 필요없음. 회원/비회원 로그인여부 체크인 경우 type에 AuthO을 넘길것
	function chkLogin(type,url){

		var result = false;

		if( typeof(type) == "undefined" ){
			type = "Auth";
		}else{
			type = "AuthO";
		}

		if( typeof(url) == "undefined" )
			url = "opener:fn_loginCallBack";

		$.ajax({
	    	type : "GET",
	    	url : "/common.do?method=isLogin&type="+type,
			async : false,
			dataType : "text",
			success:function(data){
				if( data == "false" ){
					var param = "&amp;method=loginPop&amp;forwardUrl="+url;
					openNoScrollWin("/common.do", "login", "로그인", 409, 557, param);
					result = true;
				}else{

					result = false;
				}
			}
	    });

		return result;
	}

	// 실시간 로그인 체크 - ajax를 통한 로그인 체크후 로그인여부("T" 혹은 "F")를 리턴한다
	// 회원/비회원 로그인여부 체크
	function fnIsLoginFlashAuth(){

		var result = false;

		$.ajax({
	    	type : "GET",
	    	url : "/common.do?method=isLogin&type=Auth",
			async : false,
			dataType : "text",
			success:function(data){
				if(data == "false") {
					result = "F"
				} else {
					result = "T"
				}
			}
	    });

		return result;
	}

	// 실시간 로그인 체크 - ajax를 통한 로그인 체크후 로그인여부("T" 혹은 "F")를 리턴한다
	// 회원 로그인여부 체크
	function fnIsLoginFlashAuthO(){

		var result = false;

		$.ajax({
	    	type : "GET",
	    	url : "/common.do?method=isLogin&type=AuthO",
			async : false,
			dataType : "text",
			success:function(data){
				if(data == "false") {
					result = "F"
				} else {
					result = "T"
				}
			}
	    });

		return result;
	}

	// 로그인 팝업을 띄운다.
	// url에 로그인팝업창에서 확인버튼 누르면 실행할 url을 입력한다
	function fnLoginPopFlash(url){
		var	cbFun = "opener:fn_loginCallBack";
		var param = "&amp;method=loginPop&amp;forwardUrl="+cbFun;
		openNoScrollWin("/common.do", "login", "로그인", 409, 557, param);
	}
//]]>
</script>

<style type="text/css">
	@font-face {font-family:web-font;src:url(http://www.emart.com/static/font/UttumDotum_limitless.eot)};
	body{font-family:web-font; font-size: 12px;}
	div, p, span, a{font-family:web-font; font-size: 12px;}
</style>
</head>
<body>

<!-- [s]each page css/js -->
<script type="text/javascript" charset="euc-kr" src="http://c.img.emart.co.kr/static/js_new/netfunnel_debug.js"></script>
<link rel="stylesheet" type="text/css" href="http://c.img.emart.co.kr/static/css_new/login.css" />
<script type="text/javascript">
//<![CDATA[
	$(document).ready(function(){
		$.ajaxSetup({
			asyn : false
		});

		window.resizeTo(765,445);

		$.getJSON("/index.do?method=getCornerInfoJson&ctg_id=6000000&con_id=M33",function(data,textStatus){
			var bannerImgLength = data.length;	//로그인 우측 배너 랜덤으로 노출(2012.05.24)
			if(bannerImgLength >0){
				var no = Math.floor( Math.random() * bannerImgLength );
				$.each(data,function(i){
					if(i==no){
						$(".event_area .event").html("<a href=\"javascript:goBannerUrl('"+this.Banner_url+"');\"><img src=\"http://img.emart.co.kr/back/www/uploadImg/ctg/corner/banner\/"+this.Banner_img_name+"\" alt=\""+this.Elements_name+"\" /></a>");
						return false;
					}
				});
			}else{
				$(".event_area .event").html("<a href=\"javascript:goBannerUrl('http://www.emart.com/display/theme.do?method=getWorldCuisineMain&emid=HD_CTG_10_09');\"><img src=\"http://img.emart.co.kr/back/www/uploadImg/ctg/corner/banner/30/00/000/worldbanner_120524.jpg\" alt=\"\" /></a>");
			}
		});
		
		// [D] wah_start: 아래 주석처리 된부분 삭제 해주세요
		//window.focus();
		//if('' == "noMem"){
		//	document.nonmem_form.email_addr.focus();
		//}else{
		//	if("" == document.myform.memberid.value){
		//		document.myform.memberid.focus();
		//	}else{
		//		document.myform.pwd.focus();
		//	}
		//}
	});

	function goBannerUrl(url){
		window.open(url,'','');
		self.close();
	}

	//EnterKey를 눌렀을시에 submit 시키는 함수
	function fnEnterSubmit(e, login_gb){
		if(window.event){
			// IE
			keynum = e.keyCode;
		}else if(e.which){
			// Netscape/Firefox/Opera
			keynum = e.which;
		}
	  	if(keynum == 13){
			fnLogin(login_gb);
		}
	}

	// 로그인처리
	function fnLogin(login_gb){
		//아이디 저장하기 체크 확인
		if(document.myform.save_id.checked){
			document.loginForm.save_id_flag.value = true;
		}else{
			document.loginForm.save_id_flag.value = false;
		}
		if( login_gb == 'Common' ){
			//공백제거
			document.myform.memberid.value = trim(document.myform.memberid.value);
			if(isEmpty(document.myform.memberid, "ID를 입력하세요.")) return;
			if(isEmpty(document.myform.pwd, "비밀번호를 입력하세요.")) return;
			if(document.myform.memberid.value=='nag2'){
				alert("고객님은 현재 특정 사유로 로그인 하실 수 없습니다.");
				return;
			}
		}else if( login_gb == 'NonMember' ){  // 비회원 주문하기 로그인 시 Validation 체크
			document.nonmem_form.member_name.value = trim(document.nonmem_form.member_name.value);
			document.nonmem_form.hp2.value = trim(document.nonmem_form.hp2.value);
			document.nonmem_form.hp3.value = trim(document.nonmem_form.hp3.value);
			document.nonmem_form.email_addr.value = trim(document.nonmem_form.email_addr.value);
			document.nonmem_form.write2.value = trim(document.nonmem_form.write2.value);

			document.nonmem_form.toname.value = trim(document.nonmem_form.toname.value);
			document.nonmem_form.tocontp2.value = trim(document.nonmem_form.tocontp2.value);
			document.nonmem_form.tocontp3.value = trim(document.nonmem_form.tocontp3.value);
			document.nonmem_form.tohp2.value = trim(document.nonmem_form.tohp2.value);
			document.nonmem_form.tohp3.value = trim(document.nonmem_form.tohp3.value);

			var zipcode1 = trim(document.nonmem_form.tozip1.value);
			var zipcode2 = trim(document.nonmem_form.tozip2.value);
			var detailaddr = trim(document.nonmem_form.toaddr2.value);

			if(!chkMembername(document.nonmem_form.member_name, "주문자 이름을 입력하세요.")) return;

			if(!chkPhone(document.nonmem_form.hp1, document.nonmem_form.hp2, document.nonmem_form.hp3, "주문자 휴대폰")) return;

			if(!chkEmail(document.loginForm.email_addr, document.nonmem_form.email_addr, document.nonmem_form.write2)) return;

			if(document.nonmem_form.agreement[0].checked == false){
				alert("비회원 개인정보 보호정책 약관에 동의하셔야 합니다");
				document.nonmem_form.agreement[0].focus();
				return;
			}

			if(document.nonmem_form.agreement1[0].checked == false){
				alert("이용 약관에 동의하셔야 합니다");
				document.nonmem_form.agreement1[0].focus();
				return;
			}

			if(!chkMembername(document.nonmem_form.toname, "받으실 분 이름을 입력하세요.")) return;

			if(!chkPhone(document.nonmem_form.tocontp1, document.nonmem_form.tocontp2, document.nonmem_form.tocontp3, "수령인 연락처")) return;

			if(!chkPhone(document.nonmem_form.tohp1, document.nonmem_form.tohp2, document.nonmem_form.tohp3, "수령인 휴대폰")) return;

			if(zipcode1.length < 3 || zipcode2.length < 3) {
				alert("수령인 우편번호를 입력해주세요.");
				fnSrchAddr();
				return;
			}else if(detailaddr.length == 0) {
				alert("수령인 상세주소를 입력해주세요.");
				document.nonmem_form.toaddr2.focus();
				return;
			}
		}else if( login_gb == 'NonMemberSearch' ){
			document.nonmem_search_form.member_name.value = trim(document.nonmem_search_form.member_name.value);
			document.nonmem_search_form.email_addr.value = trim(document.nonmem_search_form.email_addr.value);
			document.nonmem_search_form.payment_id.value = trim(document.nonmem_search_form.payment_id.value);

			if(!chkMembername(document.nonmem_search_form.member_name, "이름을 입력하세요.")) return;

			if(!chkEmail(document.loginForm.email_addr, document.nonmem_search_form.email_addr, null)) return;

			if(!isNumber(document.nonmem_search_form.payment_id,"지불번호를 기입해 주세요!")) return;
		}else if( login_gb == 'Order' ){
			if(isEmpty(document.myform.nm_kor, "고객명을 입력하세요.")) return;
			if( isNotValidPID(document.myform.jmno1, document.myform.jmno2) ) return;
			jmno.value = document.myform.jmno1.value + document.myform.jmno2.value;
			if(isEmpty(document.myform.reserve_key, "주문번호를 입력하세요.")) return;
		}

		//로그인 버튼 사용못하게 처리  중복클릭 안되게
		document.myform.butlogin.disabled = true;

		//폼 데이터 이관
		if(login_gb == 'NonMember'){
			document.loginForm.membername.value = document.nonmem_form.member_name.value;
			//비회원 핸드폰
			document.loginForm.nomem_hphone.value =
				document.nonmem_form.hp1[document.nonmem_form.hp1.selectedIndex].value + "-" +
				document.nonmem_form.hp2.value + "-" +
				document.nonmem_form.hp3.value;
			document.loginForm.email_addr.value = document.nonmem_form.email_addr.value;
			document.loginForm.write.value 	 = document.nonmem_form.write2.value;
			//document.loginForm.emailsel.value 	 = document.nonmem_form.emailsel.value;
			//document.loginForm.member_pid1.value = document.nonmem_form.member_pid1.value;
			//document.loginForm.member_pid2.value = document.nonmem_form.member_pid2.value;
			//var iFrameDoc = document.getElementById("sendlist_frame").contentWindow.document.shipFrm;
			//document.loginForm.ship_addr_name.value = iFrameDoc.ship_addr_name.value;

			document.loginForm.receiver_name.value = document.nonmem_form.toname.value;
			//수령인 연락처
			document.loginForm.receiver_cell_phone.value =
				document.nonmem_form.tocontp1[document.nonmem_form.tocontp1.selectedIndex].value + "-" +
				document.nonmem_form.tocontp2.value + "-" +
				document.nonmem_form.tocontp3.value;
			//수령인 핸드폰
			document.loginForm.receiver_hphone.value =
				document.nonmem_form.tohp1[document.nonmem_form.tohp1.selectedIndex].value + "-" +
				document.nonmem_form.tohp2.value + "-" +
				document.nonmem_form.tohp3.value;

			document.loginForm.ship_zip_code1.value =document.nonmem_form.tozip1.value;
			document.loginForm.ship_zip_code2.value =document.nonmem_form.tozip2.value;
			document.loginForm.ship_zip_code_addr.value = document.nonmem_form.toaddr1.value;
			document.loginForm.ship_zip_code_detail_addr.value = document.nonmem_form.toaddr2.value;
		}else if(login_gb == 'NonMemberSearch'){
			document.loginForm.membername.value = document.nonmem_search_form.member_name.value;
			document.loginForm.email_addr.value = document.nonmem_search_form.email_addr.value;
			document.loginForm.payment_id.value 	 = document.nonmem_search_form.payment_id.value;
		}else{
			document.loginForm.memberid.value = document.myform.memberid.value;
			document.loginForm.pwd.value = document.myform.pwd.value;
		}


		document.loginForm.login_type.value = login_gb;
		document.loginForm.method.value = "authenticate";
		document.loginForm.action = "https://www.emart.com/common.do";
		document.loginForm.submit();
	}

	//비회원 수령인 정보 복사
	function fnOrderCopy(login_gb) {
		if( login_gb == "NonMember"){  // 비회원 주문하기 수령인 정보 복사
			var isChecked = document.nonmem_form.copyorder.checked;

			if(!isChecked) return;
			var member_name = trim(document.nonmem_form.member_name.value);
			var hp1 = trim(document.nonmem_form.hp1[document.nonmem_form.hp1.selectedIndex].value);
		 	var hp2 = trim(document.nonmem_form.hp2.value);
			var hp3 = trim(document.nonmem_form.hp3.value);

			if(!chkMembername(document.nonmem_form.member_name, "주문자 이름을 입력하세요.")) {
				document.nonmem_form.copyorder.checked = false;
				return;
			}

			if(!chkPhone(document.nonmem_form.hp1, document.nonmem_form.hp2, document.nonmem_form.hp3, "주문자 휴대폰")) {
				document.nonmem_form.copyorder.checked = false;
				return;
			}

			if(!chkEmail(document.loginForm.email_addr, document.nonmem_form.email_addr, document.nonmem_form.write2)) {
				document.loginForm.email_addr.val = "";
				document.nonmem_form.copyorder.checked = false;
				return;
			}

			document.nonmem_form.toname.value = member_name;
			document.nonmem_form.tohp1.value = hp1;
			document.nonmem_form.tohp2.value = hp2;
			document.nonmem_form.tohp3.value = hp3;
		 }
	}

	//폼 오브젝트 체크 펑션
	function chkMembername(obj, msg) {
		var member_name = trim(obj.value);
		if(isEmpty(obj, msg)) {
			obj.focus();
			return false;
		}
		return true;
	}

	function chkPhone(obj1,obj2,obj3, msg) {
		var hp1 = trim(obj1[obj1.selectedIndex].value);
	 	var hp2 = trim(obj2.value);
		var hp3 = trim(obj3.value);

		if(hp2.length < 3) {
			alert(msg+" 번호를 정확히 입력해 주시기 바랍니다.\n\n앞자리는 3자리 이상입니다.");
			obj2.focus();
			return false;
		}
		if(!isNumber(obj2,msg+" 번호 앞자리는 숫자로만 기입해 주세요!")) {
			obj2.focus();
			return false;
		}
		if(hp3.length < 4) {
			alert(msg+" 번호를 정확히 입력해 주시기 바랍니다.\n\n뒷자리는 4자리 입니다.");
			obj3.focus();
			return false;
		}
		if(!isNumber(obj3,msg+" 번호 뒷자리는 숫자로만 기입해 주세요!")) {
			obj3.focus();
			return false;
		}

		return true;
	}

	function chkEmail(obj,obj1, obj2) {
		if(obj2 == null) obj.value = obj1.value;
		else obj.value = obj1.value+"@"+obj2.value;
		if(!isEmail(obj)) {
			alert("이메일 주소를 확인해주세요.");
			obj1.focus();
			return false;
		}
		return true;
	}

	//회원로그인 버튼을 클릭했을경우
	function fnMemberGo(){
		$(".nomember").hide();
		$(".member").show();

		if(navigator.appVersion.indexOf("MSIE 6.0")>= 0){
			window.resizeTo(765,445);
		}else{
			window.resizeTo(765,445);
		}
		
		// [D] wah_start: 아래 주석처리 된부분 삭제 해주세요
		//window.focus();
		//if("" == document.myform.memberid.value){
		//	document.myform.memberid.focus();
		//}else{
		//	document.myform.pwd.focus();
		//}
	}

	var nomemTabIndex = 0;
	//비회원로그인 버튼을 클릭했을경우
	function fnNomemberGo(){
		$(".member").hide();
		$(".nomember").show();
		$("#sendlist_frame").attr("src","/order/order.do?method=getDeliveryRegIframe&gubunFlag=login");

		if(nomemTabIndex == 1){
			window.resizeTo('580','950');
		}else{
			window.resizeTo('580','580');
		}

		// [D] wah_start: 아래 주석처리 된부분 삭제 해주세요
		//window.focus();
		//if(nomemTabIndex == 1) document.nonmem_form.member_name.focus();
		//else document.nonmem_search_form.member_name.focus();
	}

	//포커스이동
	function funcFocusMove(str, el){
		var frm = document.nonmem_form;
		if(str == 1 ){
	 		 if(frm.member_pid1.value.length==6)
				frm.member_pid2.focus();
		}else if(str == 2){
			if(frm.member_pid2.value.length==7)
				//frm.member_pid2.focus();
				// [s]2012년 3월 1일부터 14세 미만 고객 온라인 주문 불가
				if(s_jumin_age(document.nonmem_form.member_pid1.value+document.nonmem_form.member_pid2.value) < 14){
					alert("2012년3월1일부터 만14세미만 고객님은 신규 온라인 주문이 불가능합니다.\n기존의 만14세미만 주문건에 대한 [주문/배송조회]는 고객센터로 문의하여 주시기 바랍니다.\n감사합니다.");
					return;
				}
				// [e]2012년 3월 1일부터 14세 미만 고객 온라인 주문 불가
		}
	}

	//회원가입 이동페이지
	function fnMemberShip(){
		//opener.top.location.href="https://www.shinsegaepoint.com:444/spcom/servlet/spcom001.do?action=spcom001_new_reg&subent=909101&sid=noSession&PART_GB=EMALL&ckchannel=emallpcweb&return_url=http://www.emart.co.kr/";
		window.open("https://www.shinsegaepoint.com:444/spcom/servlet/spcom001.do?action=spcom001_new_reg&subent=909101&sid=noSession&PART_GB=EMALL&ckchannel=emallpcweb&return_url=http://www.emart.co.kr/","loginPopNew","");
		self.close();
	}

	// 우편번호 세팅
	function fnFormSetting(address, zip_code, zip_seq, dong) {
		$('#tozip1').val(zip_code.substr(0, 3));
		$('#tozip2').val(zip_code.substr(4, 7));
		$('#toaddr1').val(address);
		$('#toaddr2').focus();
	}
//]]>
</script>
<!-- [e]each page css/js -->

<form name="loginForm" method="post" action="">
<input type="hidden" name="envelopData" />
<input type="hidden" name="cert" value="" />
<input type="hidden" name="method" id="method" value="" />
<input type="hidden" name="login_type" />
<input type='hidden'	name='pop_flag' value="true" />
<input type="hidden" name="forwardUrl"	value="" />
<input type="hidden" name="pagePath" value="LoginPop" />
<input type="hidden" name="memberid" />
<input type="hidden" name="pwd" />
<!-- 비회원 START -->
<input type="hidden" name="email_addr" id="email_addr" />
<input type="hidden" name="write" id="write" />
<input type="hidden" name="emailsel" id="emailsel" />
<input type="hidden" name="member_pid1" id="member_pid1" />
<input type="hidden" name="member_pid2" id="member_pid2" />
<input type="hidden" name="ship_addr_name" id="ship_addr_name" />
<input type="hidden" name="receiver_name" id="receiver_name" />
<input type="hidden" name="receiver_cell_phone" id="receiver_cell_phone" />
<input type="hidden" name="receiver_hphone" id="receiver_hphone" />
<input type="hidden" name="nomem_hphone" id="nomem_hphone" />
<input type="hidden" name="ship_zip_code1" id="ship_zip_code1" />
<input type="hidden" name="ship_zip_code2" id="ship_zip_code2" />
<input type="hidden" name="ship_zip_code_addr" id="ship_zip_code_addr" />
<input type="hidden" name="ship_zip_code_detail_addr" id="ship_zip_code_detail_addr" />
<input type="hidden" name="official_yn" id="official_yn" />
<input type="hidden" name="membername" id="membername" />
<input type="hidden" name="payment_id" id="payment_id" />
<!-- 비회원 END  -->
<!-- 아이디 저장 FLAG -->
<input type="hidden" name="save_id_flag" />
</form>

<style type="text/css">
.login_left{float:left}
.loginbox dl dd.idsave label{width:auto}
.loginbox .btnset{clear:both;width:286px;padding:10px 0 30px 92px;border-top: 4px solid #33353d} 
.event_area{float:right;margin-top:-33px !important}
</style>

<div id="pop_login" class="member" style="display:"> <!-- 팝업 사이즈 738 * 380 -->
	<span class="close"><a href="javascript:self.close();"><img src="http://img.emart.co.kr/front_201109/images_new/login/icon_close.gif" alt="닫기" /></a></span>
	<div class="loginbox">
		<h1><img src="http://img.emart.co.kr/front_201109/images_new/login/ptit_login.gif" alt="로그인" /></h1>

		<!-- [D] h1에서 p 분리 -->
		<p class="radio">
			<span><label for="lb_member"><input type="radio" id="lb_member" checked="checked" class="radio" /><img src="http://img.emart.co.kr/front_201109/images_new/login/txt_member.gif" alt="회원" /></label></span>	<!-- [D] label 및 input에 id값 추가 -->
			<span><label for="lb_nonmember"><input type="radio" id="lb_nonmember" onclick="fnNomemberGo();" class="radio" /><img src="http://img.emart.co.kr/front_201109/images_new/login/txt_member_no.gif" alt="비회원" /></label></span>	<!-- [D] label 및 input에 id값 추가 -->
		</p>
		<!-- [D] ID.87 start: login_left 전체 감쌈 -->
		<div class="login_left">
			<form method="post" name="myform" action="" onsubmit="return false;">
				<dl>				
				<dd class="id_inp"><label for="u-id"><img src="http://img.emart.co.kr/front_201109/images_new/login/hd_id.gif" alt="아이디" /></label> <input type="text" name="memberid" id="u-id" class="txt" value="" maxlength="20" /></dd>
				<dd class="pw_inp"><label for="u_password"><img src="http://img.emart.co.kr/front_201109/images_new/login/hd_pw.gif" alt="비밀번호" /></label> <input type="password" name="pwd" id="u_password" class="txt" onkeydown="fnEnterSubmit(event, 'Common')" /></dd>			
				<dd class="idsave">
					<label for="save_id">
						<input type="checkbox" class="checkbox" name="save_id_flag"  id="save_id" />
						<img src="http://img.emart.co.kr/front_201109/images_new/login/txt_idsave.gif" alt="아이디 저장" />
					</label>
				</dd>
				<dd class="btnlogin"><a href="javascript:fnLogin('Common');"><img src="http://img.emart.co.kr/front_201109/images_new/login/btn_login_02.gif" alt="로그인" id="butlogin" /></a></dd>
				</dl>
			</form>
			<p class="btnset">
				<a href="javascript:fnFindMemberId('');"><img src="http://img.emart.co.kr/front_201109/images_new/login/btn_idsch.gif" alt="아이디 찾기" /></a>
				<a href="javascript:fnFindMemberPassword('','')"><img src="http://img.emart.co.kr/front_201109/images_new/login/btn_pwsch.gif" alt="비밀번호 찾기" /></a>
				<a href="javascript:fnMemberShip();"><img src="http://img.emart.co.kr/front_201109/images_new/login/btn_memberjoin.gif" alt="회원가입 하기" /></a>
			</p>
		</div>
		<!-- //[D] ID.87 end -->

		<div class="event_area">
			<p class="logo"><img src="http://img.emart.co.kr/front_201109/images_new/login/logo_login.gif" alt="이마트몰" /></p>
			<p class="event"></p>
		</div>
	</div>
	<!-- [D] </div></div> 에서 </div> 하나 삭제 -->
</div>


<div id="pop_login2" class="nomember" style="display:none" >  <!-- 팝업 사이즈 580 * 850 -->
	<span class="close"><a href="javascript:self.close();"><img src="http://img.emart.co.kr/front_201109/images_new/login/icon_close.gif" alt="닫기" /></a></span>
	<h1 class="nomemTit"><img src="http://img.emart.co.kr/front_2012/front/login/nomember_tit.jpg" alt="비회원 로그인" /></h1>

	<!-- [D] h1 에서 p분리 -->
	<p class="radio">
		<span><input type="radio" class="radio"  onclick="fnMemberGo();" /><img src="http://img.emart.co.kr/front_201109/images_new/login/txt_member.gif" alt="회원" /></span>
		<span><input type="radio" class="radio" checked="checked" /><img src="http://img.emart.co.kr/front_201109/images_new/login/txt_member_no.gif" alt="비회원" /></span>
	</p>

	<ul class="pop_tab">
		<li><a href="#nomem_status"><img src="http://img.emart.co.kr/front_2012/front/login/nomember_tab_1_on.jpg"  alt="주문/배송조회" /></a></li>
		<li><a href="#nomem_login"><img src="http://img.emart.co.kr/front_2012/front/login/nomember_tab_2_off.jpg"  alt="주문하기" /></a></li>
	</ul>

	<!-- [s]비회원 주문배송조회 -->
	<div class="order_status nomemContent" id="nomem_status" style="display:">
		<form name="nonmem_search_form" method="post" onsubmit="return false;" action="">	<!-- [D] action="" 추가 -->
		<div class="searchFormBox">
			<ul class="">
				<li>
					<img src="http://img.emart.co.kr/front_2012/front/login/nosearch_tit_1.jpg" alt="이름" />
					<input type="text" class="txt" title="이름" value="" name="member_name"/>
				</li>
				<li>
					<img src="http://img.emart.co.kr/front_2012/front/login/nosearch_tit_2.jpg" alt="이메일" />
					<input type="text" class="txt" title="이메일" value="" name="email_addr"/>
				</li>
				<li>
					<img src="http://img.emart.co.kr/front_2012/front/login/nosearch_tit_3.jpg" alt="지불번호" />
					<input type="text" class="txt" title="지불번호" value="" name="payment_id" onkeydown="fnEnterSubmit(event, 'NonMemberSearch')"/>
				</li>
			</ul>
			<div class="">
				<a href="javascript:fnLogin('NonMemberSearch');"><img src="http://img.emart.co.kr/front_2012/front/login/nosearch_tit_btn_1.jpg" alt="주문배송조회" /></a>
			</div>
		</div>
		<div class="searchJoin">
			<img src="http://img.emart.co.kr/front_2012/front/login/nosearch_txt_1.jpg" width="167" height="25" alt="아직 이마트몰 회원이 아니신가요?" />
			<a href="javascript:fnMemberShip();"><img src="http://img.emart.co.kr/front_2012/front/login/nosearch_tit_btn_2.jpg" width="87" height="25" alt="회원가입 하기" /></a>
		</div>
		<ul class="ment">
			<li>-비회원으로 상품을 구매하신 경우에만 주문/배송조회가 가능합니다.</li>
			<li>-이름/이메일/지불번호를 모두 입력하셔야 정상 조회가 가능합니다.</li>
			<li>-비회원 구매 시에는 이마트몰의 할인/적립 혜택을 받으실 수 없습니다.</li>
			<li>-2012년 10월 4일 이전 주문고객님은 받으실분 이름으로 조회를 하셔야 합니다.</li>
		</ul>
		</form>
	</div>
	<!-- [e]비회원 주문배송조회 -->

	<!-- [s]비회원 주문하기 -->
	<div class="login_others nomemContent" id="nomem_login" style="display:none">
		<form name="nonmem_form" method="post" onsubmit="return false;" action=""> <!-- [D] action="" 추가 -->
		<h2><img src="http://img.emart.co.kr/front_201109/images_new/login/stit_login_01.gif" alt="비회원 개인정보 보호정책" /></h2>
		<div class="rulebox">
			1. 개인정보의 수집항목
			및 이용목적<br />
			이마트몰에서는 비회원 구매에 따른 이용자 확인, 이용대금 결제, 상품배송 및 통계 분석을 통한 마케팅 자료로써 귀하의 취향에
			맞는 최적의 서비스를 제공하기 위한 목적으로 귀하의 개인정보를 수집, 이용하고 있습니다.<br />
			수집하는 개인정보 항목에 따른 구체적인 수집목적 및 이용목적은 다음과 같습니다.<br />
			- 성명, 이메일, 핸드폰번호는 이용자의 식별을 위해 수집됩니다.<br />
			- 주소는 주문 상품의 배송을 위해 수집됩니다.<br />
			- 전화번호는 계약의 이행을 위한 연락 및 안내, 영수증 및 청구서 송부, 배송 진행상황의 통보 등을 위해
			수집됩니다.<br />
			- 은행 계좌정보, 신용카드정보는 상품 구매에 대한 결제 및 환불 등을 위해 수집됩니다. 단, 이용자의 기본적 인권 침해의
			우려가 있는 민감한 개인정보(인종, 민족, 사상, 신조, 출신지, 본적지, 정치적 성향, 범죄기록, 건강상태 등)는 수집하지
			않습니다.<br />
			<br />

			2.개인정보의 보유기간 및 이용기간<br />
			비회원구매 고객의 개인정보 삭제를 원하실 경우에, 재생할 수 없는 기술적 방법에 의해 삭제되며 어떠한 용도로도 열람 또는
			이용될 수 없도록 처리됩니다.<br />
			단, 계약내용 및 그 이행 등 거래에 관한 기록 중 아래 각 항은 &quot;전자상거래 등에서의 소비자보호에 관한
			법률&quot; 등 관련법령의 규정에 의거 각 해당 기간 동안 보관해야 합니다.<br />
			- 계약 또는 청약철회 등에 관한 기록 : 5년<br />
			- 대금결제 및 재화등의 공급에 관한 기록 : 5년<br />
			- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br />
			</div>
		<p class="txt_chk">개인정보보호조치 관련 정보통신방법에 의거하여 동의서에 동의하셔야 서비스를 이용하실 수 있습니다.</p>
		<!-- [D] wah_start: <label> 넣어주세요 -->
		<p class="agree_chk">
			<span><label for="agree1"><input type="radio" class="radio" id="agree1" name="agreement" value="Y"/>동의함</label></span>
			<span><label for="agree2"><input type="radio" class="radio" id="agree2" name="agreement" value="N" />동의하지 않음</label></span>
		</p>
		<!-- //[D] wah_end -->
		<h2><img src="http://img.emart.co.kr/front_201109/images_new/login/stit_login_02.gif" alt="이용약관" /></h2>
		<div class="rulebox">
			제1조 (목적)<br />
			이 약관은 ㈜이마트(이하 &quot;당사&quot;라 한다)에서 운영하는 이마트닷컴(http://www.emart.com)(이하 &quot;닷컴&quot;이라 한다)에서 제공하는 인터넷 관련 서비스(이하 &quot;서비스&quot;라 한다)를 이용함에 있어 당사와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.<br /><br />

			제2조 (정의)<br />

			① &quot;닷컴&quot;이란 당사의 재화 또는 용역(이하 &quot;재화 등&quot;이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br />
			② &quot;이용자&quot;란 &quot;닷컴&quot;에 접속하여 이 약관에 따라 &quot;닷컴&quot;이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br />
			③ '회원'이라 함은 &quot;닷컴&quot;에 개인정보를 제공하여 회원 등록을 한 자로서, &quot;닷컴&quot;의 정보를 지속적으로 제공받으며, &quot;닷컴&quot;이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br />
			④ '비회원'이라 함은 회원에 가입하지 않고 &quot;닷컴&quot;이 제공하는 서비스를 이용하는 자를 말합니다.<br /><br />

			제3조 (약관 등의 명시와 설명 및 개정)<br />

			① &quot;닷컴&quot;은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 &quot;닷컴&quot;의 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.<br />
			② &quot;닷컴&quot;은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약 철회, 배송 책임, 환불 조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결 화면 또는 팝업 화면 등을 제공하여 이용자의 확인을 구합니다.<br />
			③ &quot;닷컴&quot;은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br />
			④ &quot;닷컴&quot;이 약관을 개정할 경우에는 적용 일자 및 개정 사유를 명시하여 현행 약관과 함께 &quot;닷컴&quot;의 초기 화면에 그 적용 일자 7일 전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관 내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예 기간을 두고 공지합니다.<br />
			이 경우 &quot;닷컴&quot;은 개정 전 내용과 개정 후 내용을 명확히 비교하여 이용자가 알기 쉽도록 표시합니다. 개정약관에 이의가 있는 회원은 회원 탈퇴를 할 수 있습니다. 단, 이의가 있음에도 불구하고 본 조 제1항, 제2항에 따른 당사의 고지가 있은 후 30일 이내에 회원 탈퇴를 하지 않은 회원은 개정약관에 동의한 것으로 간주합니다.<br />
			⑤ &quot;닷컴&quot;이 약관을 개정할 경우에는 그 개정 약관은 그 적용 일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관 조항이 그대로 적용됩니다. 다만 이 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정 약관의 공지 기간 내에 &quot;닷컴&quot;에 송신하여 &quot;닷컴&quot;의 동의를 받은 경우에는 개정 약관 조항이 적용됩니다.<br />
			⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계 법령 또는 상관례에 따릅니다.<br /><br />

			제4조 (서비스의 제공 및 변경)<br />

			① &quot;닷컴&quot;은 다음과 같은 업무를 수행합니다.<br />
			1. 재화 또는 용역에 대한 정보 제공 및 구매 계약의 체결<br />
			2. 구매 계약이 체결된 제화 또는 용역의 배송<br />
			3. 기타 &quot;닷컴&quot;이 정하는 업무<br />
			② &quot;닷컴&quot;은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공 일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br />
			③ &quot;닷컴&quot;이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br />
			④ 전항의 경우 &quot;닷컴&quot;은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, &quot;닷컴&quot;이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br /><br />

			제5조 (서비스의 중단)<br />

			① &quot;닷컴&quot;은 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br />
			② 제1항에 의한 서비스 중단의 경우에는 &quot;닷컴&quot;은 제8조에 정한 방법으로 이용자에게 통지합니다.<br />
			③ &quot;닷컴&quot;은 1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, &quot;닷컴&quot;이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br /><br />

			제6조 (회원 가입)<br />

			① 이용자는 &quot;닷컴&quot;이 정한 가입 양식에 따라 회원 정보를 기입한 후 이 약관과 개인정보의 수집, 제공 및 활용에 동의한다는 의사 표시를 함으로써 가입을 신청합니다.<br />
			② &quot;닷컴&quot;은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<br />
			1. 가입 신청자가 이 약관 제7조제3항에 의하여 이전에 회원 가입을 상실한 적이 있는 경우<br />
			(다만 제7조제3항에 의한 회원 자격 상실 후 3년이 경과한 자로서 &quot;닷컴&quot;의 회원 재가입 승낙을 얻은 경우는 예외로 합니다.)<br />
			2. 등록 내용에 허위, 기재 누락, 오기가 있는 경우<br />
			3. 기타 회원으로 등록하는 것이 &quot;닷컴&quot;의 기술상 현저히 지장이 있다고 판단되는 경우<br />
			4. 회원가입신청일 현재 만14세 미만의 아동인 경우<br />
			③ 회원 가입 계약의 성립 시기는 &quot;닷컴&quot;의 승낙이 회원에게 도달한 시점으로 합니다.<br />
			④ 회원은 등록 사항에 변경이 있는 경우, 즉시 전자우편 또는 기타 방법으로 &quot;닷컴&quot;에 대하여 그 변경 사항을 알려야 합니다.<br />
			⑤ &quot;닷컴&quot;의 회원으로 가입하시면 &quot;신세계포인트&quot; 회원이 되며, 신세계닷컴(www.shinsegae.com)과 신세계몰(mall.shinsegae.com)회원을 선택하여 동시 가입할 수 있습니다.<br />
			<br />
			제7조 (회원 탈퇴 및 자격 상실 등)<br />

			① 회원은 &quot;닷컴&quot;에 언제든지 탈퇴를 요청할 수 있으며 &quot;닷컴&quot;은 즉시 회원 탈퇴를 처리합니다.<br />
			② 회원이 다음 각호의 사유에 해당하는 경우, &quot;닷컴&quot;은 회원 자격을 제한 및 정지시킬 수 있습니다.<br />
			1. 가입 신청시에 허위 내용을 등록한 경우<br />
			2. &quot;닷컴&quot;을 이용하여 구입한 재화 등의 대금, 기타 &quot;닷컴&quot; 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br />
			3. 다른 사람의 &quot;닷컴&quot; 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br />
			4. &quot;닷컴&quot;을 이용하여 법령 또는 이 약관이 금지하거나 공서 양속에 반하는 행위를 하는 경우<br />
			5. 회원이 사망한 경우<br />
			③ &quot;닷컴&quot;이 회원 자격을 제한, 정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 &quot;닷컴&quot;은 회원 자격을 상실시킬 수 있습니다.<br />
			④ &quot;닷컴&quot;이 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원 등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br /><br />

			제8조 (회원에 대한 통지)<br />

			① &quot;닷컴&quot;이 회원에 대한 통지를 하는 경우, 회원이 &quot;닷컴&quot;과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br />
			② &quot;닷컴&quot;은 불특정 다수 회원에 대한 통지의 경우 1주일 이상 &quot;닷컴&quot;게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지를 합니다.<br /><br />

			제9조 (구매 신청)<br />

			&quot;닷컴&quot; 이용자는 &quot;닷컴&quot;상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, &quot;닷컴&quot;은 이용자가 구매를 신청함에 있어서 다음의 각 내용을 알기 쉽게 제공합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.<br />
			1. 재화 등의 검색 및 선택<br />
			2. 성명, 주소, 전화번호, 전자우편주소(또는 휴대전화번호) 등의 입력<br />
			3. 약관 내용, 청약 철회권이 제한되는 서비스, 배송료, 설치비 등의 비용 부담과 관련한 내용에 대한 확인<br />
			4. 이 약관에 동의하고 위 3. 호의 사항을 확인하거나 거부하는 표시(예: 마우스 클릭)<br />
			5. 재화 등의 구매 신청 및 이에 관한 확인 또는 &quot;닷컴&quot;의 확인에 대한 동의<br />
			6. 결제 방법의 선택<br />
			7. 기타 &quot;닷컴&quot;이 별도로 정하는 절차<br /><br />

			제10조 (계약의 성립)<br />
			① &quot;닷컴&quot;은 제9조와 같은 구매 신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다.<br />
			1. 신청 내용에 허위, 기재 누락, 오기가 있는 경우<br />
			2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br />
			3. 기타 구매 신청에 승낙하는 것이 &quot;닷컴&quot; 기술상 현저히 지장이 있다고 판단하는 경우<br />
			② &quot;닷컴&quot;의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br />
			③ &quot;닷컴&quot;의 승낙의 의사 표시에는 이용자의 구매 신청에 대한 확인 및 판매 가능 여부, 구매 신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br /><br />

			제11조 (지급 방법)<br />

			&quot;닷컴&quot;에서 이용자가 구매하거나 이용하는 재화 또는 용역에 대한 대금 지급 방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, &quot;닷컴&quot;은 이용자의 지급 방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br />
			1. 계좌이체<br />
			2. 신용카드 결제<br />
			3. 전자 화폐에 의한 결제<br />
			4. &quot;닷컴&quot;이 지급한 포인트에 의한 결제<br />
			5. &quot;닷컴&quot;과 계약을 맺었거나 &quot;닷컴&quot;이 인정한 상품권에 의한 결제<br />
			6. 기타 전자적 지급 방법에 의한 대금 지급 등<br /><br />

			제12조 (수신 확인 통지, 구매 신청 변경 및 취소)<br />

			① &quot;닷컴&quot;은 이용자의 구매 신청이 있는 경우 이용자에게 수신 확인 통지를 합니다.<br />
			② 수신 확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매 신청 변경 및 취소를 요청할 수 있고 &quot;닷컴&quot;은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조 청약 철회 등에 관한 규정에 따릅니다.<br /><br />

			제13조 (재화 등의 공급)<br />

			① &quot;닷컴&quot;은 이용자와 재화 등의 공급 시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만 &quot;닷컴&quot;이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 다만, 소비자와 &quot;닷컴&quot;간 재화 등의 공급 시기에 관하여 별도의 약정이 있는 경우에는 그러하지 아니합니다. 이때 &quot;닷컴&quot;은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br />
			② &quot;닷컴&quot;은 이용자가 구매한 재화에 대해 배송 수단, 수단별 배송 비용 부담자, 수단별 배송 기간 등을 명시합니다. 만약 &quot;닷컴&quot;이 약정 배송 기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 &quot;닷컴&quot;이 고의, 과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br /><br />

			제 14조 (환급)<br />

			&quot;닷컴&quot;은 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br /><br />

			제15조 (청약 철회 등)<br />

			① &quot;닷컴&quot;과 재화 등의 구매에 관한 계약을 체결한 이용자는 계약 내용에 관한 서면을 교부 받은 날부터 7일 이내에 청약의 철회를 할 수 있습니다. 다만 그 서면을 교부 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등의 공급을 받거나 공급이 개시된 날부터 7일 이내에 청약의 철회를 할 수 있습니다.<br />
			② 이용자는 재화 등을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br />
			1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우<br />
			(다만 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약 철회를 할 수 있습니다.)<br />
			2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br />
			3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우<br />
			4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br />
			③ 제2항 제2호 내지 제4호의 경우에는 &quot;닷컴&quot;이 사전에 청약 철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약 철회 등이 제한되지 않습니다.<br />
			④ 이용자는 제1항 및 제2항의 규정에도 불구하고 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약 철회 등을 할 수 있습니다.<br /><br />

			제16조 (청약 철회 등의 효과)<br />

			① &quot;닷컴&quot;은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 &quot;닷컴&quot;이 이용자에게 재화 등의 환급을 지연한 때에는 그 지연 기간에 대하여 공정거래위원회가 정하여 고시하는 지연 이자율을 곱하여 산정한 지연 이자(이하 &quot;지연 배상금&quot;이라 한다)를 지급합니다.<br />
			② &quot;닷컴&quot;은 위 대금을 환급함에 있어서 이용자가 신용카드 그밖에 대통령령이 정하는 결제 수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제 수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다. 다만, &quot;닷컴&quot;이 결제 업자로부터 해당 재화 등의 대금을 이미 지급 받은 때에는 지체 없이 이를 결제업자에게 환급하고, 그 사실을 소비자에게 통지하여야 합니다.<br />
			③ 청약 철회 등의 경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. &quot;닷컴&quot;은 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행되어 청약 철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 &quot;닷컴&quot;이 부담합니다.<br />
			④ 이미 재화 등이 일부 사용 또는 일부 소비된 경우에는 그 재화 등의 사용 또는 일부 소비에 의하여 소비자가 얻은 이익 또는 그 재화 등의 공급에 소요된 비용에 상당하는 금액으로서 대통령령이 정하는 범위의 금액의 지급을 이용자에게 청구할 수 있습니다.<br />
			⑤ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 &quot;닷컴&quot;은 청약 철회 시 그 비용을 누가 부담하는지를 알기 쉽도록 명확하게 표시합니다.<br /><br />

			제17조 (적립금)<br />

			① 적립금은 &quot;닷컴&quot; 내에서 마치 현금처럼 사용할 수 있는 전자 화폐입니다.<br />
			② &quot;닷컴&quot; 회원으로 가입하시고, 적립금 지급 상품을 구입하실 경우, &quot;닷컴&quot;의 운영정책에 따라 상품별로 정해진 사은 적립금을 드립니다.<br />
			③ 적립금은 &quot;닷컴&quot;에서 상품을 구매하실 경우 금액과 상관없이 현금과 동일하게 사용하실 수 있습니다. 다만, 상품권, PP카드, 공동구매, 여행 등 일부 품목은 제외합니다.<br />
			④ 다음의 경우 적립금이 소멸됩니다.<br />
			- 회원을 탈퇴한 경우<br />
			- 최근 1년간 구매 내역 및 적립금액의 변동이 없는 경우<br />
			- 적립금 사용가능 조건 및 소멸에 대한 내용이 별도로 공지된 경우<br /><br />

			제18조 (개인정보보호)<br />

			① &quot;닷컴&quot;은 신세계 패밀리&quot;는 이용자의 정보 수집 시 구매 계약 이행에 필요한 최소한의 정보를 수집하고동의를 받습니다. 다음 사항을 필수 사항으로 하며 그 외 사항은 선택 사항으로 합니다.<br />
			1. 성명<br />
			2. 주민등록번호(회원의 경우) 또는 외국인등록번호<br />
			- &quot;I-Pin&quot;을 입력하여 회원에 가입할 경우에는 주민등록번호를 수집하지 않습니다.<br />
			3. 주소<br />
			4. 전화번호<br />
			5. 희망 아이디(ID) (회원의 경우)<br />
			6. 비밀번호(회원의 경우)<br />
			7. 전자우편주소<br />
			② 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제 3자에게 제공할 수 없으며 이에 대한 모든 책임은 &quot;닷컴&quot;이 집니다. 다만 다음의 경우에는 예외로 합니다.<br />
			1. 배송 업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려 주는 경우<br />
			2. 통계 작성, 학술 연구 또는 시장 조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공되는 경우<br />
			3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우<br />
			4. 도용방지를 위하여 본인확인에 필요한 경우<br />
			5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우<br />
			③ &quot;닷컴&quot; 이용자의 개인정보 수집/이용 동의를 받아야 하는 경우에는 개인정보 수집 항목, 수집/이용 목적, 보유기간 등 개인정보보호법 및 정보통신망이용촉진및정보보호등에관한법률 등 관련 법률에서 규정한 사항을 미리 명시하거나 고지하여 동의를 받으며, 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br />
			④ 이용자는 언제든지 &quot;닷컴&quot;이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며, &quot;닷컴&quot;은 이에 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 &quot;닷컴&quot;는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br />
			⑤ &quot;닷컴&quot;은 개인정보보호를 위하여 관리자를 한정하여 그 수를 최소화하며, 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br />
			⑥ &quot;닷컴&quot; 또는 그로부터 개인정보를 제공 받은 제3자는 개인 정보의 수집 목적 또는 제공 받는 목적을 달성한 때에 당해 개인정보를 지체 없이 파기합니다.<br /><br />

			제19조 (&quot;닷컴&quot;의 의무)<br />

			① &quot;닷컴&quot;은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화, 용역을 제공하는데 최선을 다하여야 합니다.<br />
			② &quot;닷컴&quot;은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 합니다.<br />
			③ &quot;닷컴&quot;이 상품이나 용역에 대하여 &quot;표시,광고의공정화에관한법률&quot; 제3조 소정의 부당한 표시, 광고 행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br />
			④ &quot;닷컴&quot;은 이용자가 원하지 않는 영리 목적의 광고성 전자우편을 발송하지 않습니다.<br /><br />

			제20조 (회원의 아이디(ID) 및 비밀번호에 대한 의무)<br />

			① 제17조의 경우를 제외한 아이디(ID)와 비밀번호에 관한 관리 책임은 회원에게 있습니다.<br />
			② 회원은 자신의 아이디(ID) 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br />
			③ 회원이 자신의 아이디(ID) 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 &quot;닷컴&quot;에게 통보하고 &quot;닷컴&quot;의 안내가 있는 경우에는 그에 따라야 합니다.<br /><br />

			제21조 (이용자의 의무)<br />

			이용자는 다음 행위를 하여서는 안됩니다.<br />
			1. 신청 또는 변경시 허위 내용의 등록<br />
			2. 타인의 정보 도용<br />
			3. &quot;닷컴&quot;에 게시된 정보의 변경, 삭제 등 훼손<br />
			4. &quot;닷컴&quot;이 정한 정보 이외의 정보 (컴퓨터 프로그램 등) 등의 송신 또는 게시<br />
			5. &quot;닷컴&quot;이 기타 제3자의 저작권 등 지적 재산권에 대한 침해<br />
			6. &quot;닷컴&quot; 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br />
			7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 &quot;닷컴&quot;에 공개 또는 게시하는 행위<br /><br />

			제22조 (연결 &quot;닷컴&quot;과 피연결 &quot;닷컴&quot;간의 관계)<br />

			① 상위 &quot;닷컴&quot;과 하위 &quot;닷컴&quot;이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 &quot;닷컴&quot;(웹 사이트)이라고 하고 후자를 피연결 &quot;닷컴&quot;(웹사이트)이라고 합니다.<br />
			② &quot;닷컴&quot;은 자신의 사이트에 &quot;닷컴&quot; 연결 사이트가 취급하는 상품 또는 용역에 대하여 보증책임을 지지 않는다는 내용을 명시한 경우, 그 거래에 대한 보증책임을 지지 않습니다.<br />
			③ &quot;닷컴&quot;과 &quot;닷컴&quot; 연결 사이트는 독자적으로 점포를 운영하는 것으로 &quot;닷컴&quot;은 &quot;닷컴&quot; 연결사이트와 이용자간에 행해진 거래에 대하여 어떠한 책임도 지지 않습니다.<br /><br />

			제23조 (저작권의 귀속 및 이용 제한)<br />

			① &quot;닷컴&quot;이 작성한 저작물에 대한 저작권 기타 지적 재산권은 &quot;닷컴&quot;에 귀속합니다.<br />
			② 이용자는 &quot;닷컴&quot;을 이용함으로써 얻은 정보 중 &quot;닷컴&quot;에게 지적 재산권이 귀속된 정보를 &quot;닷컴&quot;의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br />
			③ &quot;닷컴&quot;은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br /><br />

			제24조 (분쟁 해결)<br />

			① &quot;닷컴&quot;은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 피해 보상 처리 기구를 설치, 운영합니다.<br />
			② &quot;닷컴&quot;은 이용자로부터 제출되는 불만 사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 지체 없이 통보해 드립니다.<br />
			③ &quot;닷컴&quot;과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해 구제 신청이 있는 경우에는 공정거래위원회 또는 분쟁조정기관의 조정에 따를 수 있습니다.<br />
			④ 소비자에게 책임 있는 사유로 인하여 재화 등의 판매에 관한 계약이 해제된 경우 전자상거래등에서의소비자호보에관한법률에 의거 &quot;닷컴&quot;이 이용자에게 청구하는 손해배상액은 다음 각호에서 정한 금액에 대금 미납에 따른 지연 배상금을 더한 금액을 초과할 수 없습니다.<br />
			1. 공급 받은 재화 등이 반환된 경우에는 다음 각목의 1에 해당하는 금액 중 큰 금액<br />
			가. 반환된 재화 등의 통상 사용료액 또는 그 사용에 의하여 통상 얻어지는 이익에 상당하는 금액<br />
			나. 반환된 재화 등의 판매 가격에서 그 재화 등이 반환된 당시의 가액을 공제한 금액<br />
			2. 공급 받은 재화 등이 반환되지 아니한 경우에는 그 재화 등의 판매 가액에 상당하는 금액<br /><br />

			제25조 (재판권 및 준거법)<br />

			① &quot;닷컴&quot;과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 합니다. 다만 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사 소송법상의 관할 법원에 제기합니다.<br />
			② &quot;닷컴&quot;과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.<br /><br />

			부칙 제1조 (약관의 효력)<br />
			이 약관은 2012년 4월 1일부터 시행됩니다.
		</div>
		<p class="txt_chk">개인정보보호조치 관련 정보통신방법에 의거하여 동의서에 동의하셔야 서비스를 이용하실 수 있습니다.</p>
		<p class="agree_chk">
			<span><label for="agree3"><input type="radio" class="radio" name="agreement1" value="Y" id="agree3" />동의함</label></span>
			<span><label for="agree4"><input type="radio" class="radio" name="agreement1" value="N" id="agree4" />동의하지 않음</label></span>
		</p>


		<div class="boardwrap nomemInfo">
			<div class="pop_mem_tit">
				<img src="http://img.emart.co.kr/front_2012/front/login/nomem_tit_1.jpg" alt="주문자정보" />
			</div>			
			<table cellpadding="0" cellspacing="0">
			<caption class="e_bl">주문자정보 입력</caption>	<!-- [D] caption추가 -->
			<colgroup>
				<col width="95" />
				<col width="120" />
				<col width="95" />
				<col width="*" />
			</colgroup>			
			<tr class="rows_th">
				<!-- [D] wah_start: label 추가 및 input에 for 속성값의 id 추가, input에 title삭제/ 이하 input 내용 상동 -->
				<th scope="row"><label for="lb_name"><img src="http://img.emart.co.kr/front_2012/front/login/nomem_th_1.jpg" alt="이름" /></label></th>
				<td class="inp">
					<input type="text" name="member_name"  id="lb_name" class="txt" style="width: 96px;" />
				</td>
				<th scope="row"><label for="lb_phone"><img src="http://img.emart.co.kr/front_2012/front/login/nomem_th_2.jpg" alt="휴대폰" /></label></th>
				<td class="inp">
					 <select name="hp1" id="lb_phone" style="width: 45px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					 </select>
					<input type="text" name="hp2" id="lb_phone2" title="휴대폰 두번째 네자리 혹은 세자리" class="txt" style="width: 40px;" maxlength="4"/> -
					<input type="text" name="hp3" id="lb_phone3" title="휴대폰 세번째 네자리" class="txt" style="width: 40px;" maxlength="4"/>
				</td>
			</tr>
			<tr class="rows_th">
				<th scope="row"><label for="lb_email"><img src="http://img.emart.co.kr/front_201109/images_new/login/hd_email.gif" alt="이메일" /></label></th>
				<td class="inp" colspan="3">
					<input type="text" class="txt" name="email_addr" id="lb_email" style="width: 96px;" /> @ <input class="txt" type="text" name="write2" id="write2" title="이메일 공급회사" style="width:255px" />	<!-- [D] 끝에 /> 추가 -->
				</td>
			</tr>
			</table>

			<div class="pop_mem_tit">
				<img src="http://img.emart.co.kr/front_2012/front/login/nomem_tit_2.jpg" alt="수령인정보" />
				<label for="lb_order"><input type="checkbox" class="copyorder" name="copyorder" id="lb_order" onclick="fnOrderCopy('NonMember');"/> 주문자와동일</label>
			</div>

			<table cellpadding="0" cellspacing="0">
			<caption class="e_bl">수령인 정보</caption> <!--[D] caption추가 -->
			<colgroup>
				<col width="95" />
				<col width="170" />
				<col width="60" />
				<col width="*" />
			</colgroup>			
			<tr class="rows_th">
				<th scope="row"><label for="lb_ordername"><img src="http://img.emart.co.kr/front_2012/front/login/nomem_th_4.jpg" alt="이름" /></label></th>
				<td class="inp" colspan="3">
					<input type="text" name="toname" id="lb_ordername" class="txt" style="width: 96px;" />
				</td>
			</tr>
			<tr class="rows_th">
				<th scope="row"><label for="lb_orderphone"><img src="http://img.emart.co.kr/front_2012/front/login/nomem_th_5.jpg" alt="연락처" /></label></th>
				<td class="inp">
					 <select name="tocontp1" title="국번" id="lb_orderphone" style="width: 45px;">
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
						<option value="041">041</option>
						<option value="042">042</option>
						<option value="043">043</option>
						<option value="051">051</option>
						<option value="052">052</option>
						<option value="053">053</option>
						<option value="054">054</option>
						<option value="055">055</option>
						<option value="061">061</option>
						<option value="062">062</option>
						<option value="063">063</option>
						<option value="064">064</option>
						<option value="070">070</option>
						<option value="0502">0502</option>
						<option value="0505">0505</option>
						<option value="0506">0506</option>
					 </select>
					<input type="text" name="tocontp2" class="txt" id="lb_orderphone2" title="전화번호 두번째 세자리" style="width: 40px;" maxlength="4"/> -
					<input type="text" name="tocontp3" class="txt" style="width: 40px;" id="lb_orderphone3" title="전화번호 세번째 네자리" maxlength="4"/>
				</td>
				<th scope="row"><label for="lb_ordercell"><img src="http://img.emart.co.kr/front_2012/front/login/nomem_th_6.jpg" alt="휴대폰" /></label></th>
				<td class="inp">
					 <select name="tohp1" id="lb_ordercell" title="휴대폰 앞번호 세자리" style="width: 45px;">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					 </select>
					<input type="text" name="tohp2" id="lb_ordercell2" title="휴대폰 두번째 네자리 혹은 세자리" class="txt" style="width: 40px;" maxlength="4"/> -
					<input type="text" name="tohp3" id="lb_ordercell3" title="휴대폰 세번째 네자리" class="txt" style="width: 40px;" maxlength="4" />
				</td>
			</tr>
			<tr class="rows_th">
				<th scope="row" style="vertical-align:top; "><label for="lb_add"><img src="http://img.emart.co.kr/front_2012/front/login/nomem_th_4.jpg" alt="받으실 분" /></label></th>
				<td class="inp" colspan="3">
					<div class="">
						<input type="text" id="tozip1" class="txt" style="width: 40px;" title="우편번호 앞 세자리" value="" name="tozip1" readonly="readonly" /> -
						<input type="text" id="tozip2" class="txt" style="width: 40px;" title="우편번호 뒤 세자리" value="" name="tozip2" readonly="readonly" />
						<input type="image" src="http://img.emart.co.kr/front_2012/front/login/btn_address.jpg" id="lb_add" alt="우편번호찾기" onclick="javascript:fnSrchAddr();" class="inp_img" /> <!-- [D] a -> input, width="68" height="18" 삭제 -->
					</div>
					<p>
						<input type="text" class="txt" name="toaddr1" id="toaddr1" style="width: 340px;" readonly="readonly" />
					</p>
					<p>
						<input type="text" class="txt" name="toaddr2" id="toaddr2" style="width: 340px;" onkeydown="fnEnterSubmit(event, 'NonMember')"/>
					</p>
				</td>
			</tr>
			</table>
		</div>
			<div class="btnright">
				<a href="javascript:fnLogin('NonMember');"><img src="http://img.emart.co.kr/front_2012/front/login/btn_order.jpg" alt="주문하기" /></a>
				<a href="javascript:self.close();"><img src="http://img.emart.co.kr/front_2012/front/login/btn_cancel.jpg" alt="취소" /></a>
			</div>
		</form>
	</div>
	<!-- [e]비회원 주문하기 -->
</div>


<script type="text/javascript">
//<![CDATA[
	var nomemContent = $('.nomemContent');
	var nomemTab = $('.pop_tab img');
	nomemTab.each(function(n){this.n=n}).click(function(){
		nomemContent.hide().eq(this.n).show();
		var num = this.n;
		nomemTab.each(function(j){
			if(num == j){
					this.src = this.src.replace('_off','_on');
					window.resizeTo('580','950');
					nomemTabIndex = 1;
			}else{
					this.src = this.src.replace('_on','_off');
					window.resizeTo('580','580');
					nomemTabIndex = 0;
			}
		})

		// [D] wah_start: 아래 주석처리 된부분 삭제 해주세요
		//window.focus();
		//if(nomemTabIndex == 1) document.nonmem_form.member_name.focus();
		//else document.nonmem_search_form.member_name.focus();

		return false;
	})
//]]>
</script>

<!--Netfunnel Start-->
<script type='text/javascript'>
//<![CDATA[
	//NetFunnel_goComplete({host:"58.181.39.178",port:80,cookie_id:"NetFunnel_ID1"});
	NetFunnel_goComplete({host:"210.92.198.76",port:9001,cookie_id:"NetFunnel_ID1"});
//]]>
</script>
<!--Netfunnel End-->


<div style="display:none">
	<iframe src="" name="paction_frame" width="0" height="0" title="빈프레임"></iframe>
	<iframe src="" name="action_frame" width="0" height="0" title="빈프레임"></iframe>

	<div id="tempFormDiv">
		<form name="tempForm" method="post" action="">
		<input type="hidden" name="method" />
		<input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="null" />

		<div id="divTemp"></div>
		</form>
	</div>
</div>

<!-- [D] <style> 삭제 
<style>
@font-face{
	font-family:yoonDotum;
	src:url('http://img.emart.co.kr/front_201109/font/UttumDotum_limitless.eot');	/* ie */
	src:local('yoonDotum'), url('http://img.emart.co.kr/front_201109/static/css_new/yoonDotum.ttf') format('truetype');	/* ff_ttf */
	/* src:local('NanumGothic_otf'), url('http://img.emart.co.kr/front_201109/static/css_new/yoonDotum.otf') format('truetype');	 ff_otf */
}
</style>
-->

<form name="reloadForm" method="get" action="">
	<input type="hidden" name="emid" value=""/>
	<input type="hidden" name="method" value="loginPop"/>
	<input type="hidden" name="loginFlag" value=""/>
</form>

</body>
</html>
