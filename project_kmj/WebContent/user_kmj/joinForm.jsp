<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

 <!-- jquery 준비 시작 -->
<script src="https://code.jquery.com/jquery-3.6.0.js" 
integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
crossorigin="anonymous">
</script>
<!-- jquery 준비 끝 -->
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   
 </script>
 <![endif]-->
</head>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/JavaScript">
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('address2').focus();
					}
				}).open();
	}
	</script>
	
	<script type="text/javascript">
	//회원가입 유효성 검사
	function checkAll(){
		
		 var idCheck = /^[a-zA-Z0-9]{5,15}$/; 
		 var emailCheck= /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[".com", ".net"]{3}$/i; 
		 var nameCheck = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; 
	
		 var id = document.form.id.value;
		 var pw = document.form.pw.value;
		 var pw2 = document.form.pw2.value;
		 var email = document.form.email.value;
		 var email2 = document.form.email2.value;
		 var name = document.form.name.value;
		 
		// 아이디 공백일 경우
		if(id == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		// 아이디가 5~15자리 영문대소문자와 숫자로만 입력
		if(!idCheck.test(id)){
			alert("아이디를 5~15자리 영문대소문자와 숫자로만 입력해주세요.");
			return false;
		}
		
		//password가 입력되지 않을 경우
		if(pw ==""){
			alert("비밀번호가 입력되지 않았습니다.");
			return false;
		}
		
		if(pw.length <4 && pw.length<12){
			alert("비밀번호는 4~12자 이내로 입력해주세요");			
			form.pw.select();			
			form.pw.focus();		
			return false;		
		}
			
		//Retype Password 입력되지 않을 경우
		if(pw2 ==""){
			alert("비밀번호 확인이 입력되지 않았습니다.");
			return false;
		}
			 
		//비밀번호와 비밀번호 확인이 일치하지 않을 경우
		if (pw != pw2) {
			alert("두 비밀번호가 맞지 않습니다.");
			form.pw.value = "";
			form.pw2.value = "";
			form.pw2.focus();
			return false;
		}
		
		//id와 password가 같을 경우
		if(id == pw){
			alert("아이디와 비밀번호가 같습니다.");
			return false;
		}
		
		// 이메일이 이메일 형식과 맞지 않을 경우
		if(emailCheck.test(email) == false){
			alert("이메일형식이 맞지 않습니다.");
			return false;
		}
			 
		//아이디 중복확인 체크 유무
		if(email2 == "중복체크"){	
			alert("이메일 중복체크를 반드시 해주세요.");
			return false;
		}
			 
		// 이름이 영문자 섞여서 입력될 경우
		if(nameCheck.test(name) == false){
			alert("이름형식이 맞지 않습니다.");
			return false;
		} 
		return true;
	}
	</script>
	
<script type="text/javascript">
      // jquery 시작
     $(function() {
         // 아이디 중복체크 시작
         var num = 0;
          $('#id').keyup(function() {
            var id = $('#id').val();
            $.ajax({
               url : "joinIDCheck.jsp",
               type : "post",
               data : {id:id},
               success:function(data){
                  //alert(data);
				if(id.length < 5){
					$('#idcheck1').html("");
					$('#idcheck2').html("5~15자리 영문과 숫자로만 입력");                   
				}else if(id.length > 0){
					if(data == 0){
						$('#idcheck2').html("");
						$('#idcheck1').html("사용가능한 아이디");
					}else if(data == 1){
						$('#idcheck1').html("");
						$('#idcheck2').html("이미 사용중인 아이디");                  
					}   
				}else{
					$('#idcheck1').html("");
					$('#idcheck2').html("");
					$('#idcheck3').html("");
				}  
               }
            
               });  
            });
        });
         // 아이디 중복체크 끝
   </script>
	
<script type="text/javascript">
	 //이메일 중복확인 새창열기
	 function winopen(){
    	if(document.form.email.value == ""){
    		alert("이메일을 입력하세요.");
    		document.form.email.focus();
    		return;
    	}
    	var useremail = document.form.email.value;
    	
    	//email 값이 있을때 -> 새창열기
    	window.open("joinEmailCheck.jsp?useremail="+useremail,"","width=400,height=300");    	
    	
    }
</script>

<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
			<jsp:include page="../inc/top.jsp"/>
		<!-- 헤더들어가는 곳 -->
		
		<!-- 본문들어가는 곳 -->
			
			<!-- 본문메인이미지 -->
			<div id="sub_img_member"></div>
			<!-- 본문메인이미지 -->
			
			<!-- 왼쪽메뉴 -->
			<nav id="sub_menu">
			<ul>
			<li><a href="/project_kmj/user_kmj/main.jsp">Home</a></li>
			<li><a href="/project_kmj/contact_kmj/location.jsp">Location</a></li>
			</ul>
			</nav>
			<!-- 왼쪽메뉴 -->
			
			<!-- 본문내용 -->
				<article>
				
				<h1>Join Us</h1>
					<form action="joinPro.jsp" id="join" name="form" method="post" onsubmit="return checkAll()">
					<fieldset>
						<legend>Basic Info</legend>
						<label><span id="star">* </span>User ID</label>    
						<input type="text" name="id" id="id" maxlength="15" placeholder="5~15자리 영문자,숫자 입력">
						<span id="idcheck1" style="color: #BDBDBD;" id=""></span>
    					<span id="idcheck2" style="color: #FF7012;"></span>
    					<span id="idcheck3" style="color: #FF7012;"></span>
						<br>
						<label><span id="star">* </span>Password</label>
						<input type="password" name="pw" id="pw" maxlength="12" onblur="checkPw()" placeholder="4~12자리 입력"><br>
						<label><span id="star">* </span>Retype Password</label>
						<input type="password" name="pw2" id="pw2" placeholder="비밀번호 확인"><br>
						
						<label><span id="star">* </span>Name</label>
						<input type="text" name="name" id="name" required><br>
						
						<label><span id="star">* </span>E-Mail</label>
						<input type="email" name="email" id="email" required placeholder="이메일형식으로 작성">
						<input type="button" value="중복체크" name="email2" id="email2" class="dup" onclick="winopen();"><br>
						
						<label><span id="star">* </span>Phone</label>
						<input type="tel" name="phone" id="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="예)010-0000-0000" required><br>
						
					</fieldset>
					
					<fieldset>
						<legend>Optional</legend>
						<label>Address</label>
						<input type="button" class="btn btn-warning" value="우편번호 찾기" onclick="execDaumPostcode()"><br>
						<label>우편번호</label>
						<input type="text" name="post" id="post" required readonly><br>
						<label>주소 </label>
						<input type="text" name="address" id="address" required readonly><br>
						<label>상세주소</label> 
						<input type="text" name="address2" id="address2"><br>
						
						<label>Birth</label>
						<input type="date" name="birth" id="birth"><br>
						
						<label>Gender</label>
						<input type="radio" name="gender" value="남" checked="checked" style="width:70px;">남 
						<input type="radio" name="gender" value="여" style="width:70px;">여 <br>
					</fieldset>
					<div class="clear"></div>
					<div id="buttons">
						<input type="submit" value="회원가입" class="submit">
						<input type="reset" value="재입력" class="cancel">
					</div>
					</form>
				</article>
			<!-- 본문내용 -->
		
		<!-- 본문들어가는 곳 -->
		
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
			<jsp:include page="../inc/bottom.jsp"/>
		<!-- 푸터들어가는 곳 -->
	</div>

</body>
</html>