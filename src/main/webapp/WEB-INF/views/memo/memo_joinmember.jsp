<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>토피아정보기술(주)</title>
<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
<script
	src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

<script
	src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <!-- Custom styles for this template 
    <link href="form-validation.css" rel="stylesheet">-->

<style>
nav {
	background: #002B45;
	margin: 0 auto;
	width: 100%;
	overflow: hidden;
	padding: 0;
}

.nav h1 a {
	display: block;
	background: url(/resources/img/notice.png) no-repeat 0 0;
	height: 55px;
	margin-top: 17px;
	text-indent: -9999px;
}

h3 {
	position: relative;
	display: inline-block;
	padding: 0.7rem 1rem;
}

h3::before, h3::after {
	position: absolute;
	display: inline-block;
	content: '';
	width: 20px;
	height: 30px;
}
#overlappedID {background-color: GhostWhite; width: 100%; }
#ckPass {background-color: GhostWhite; width: 100%; }
.olmessagef {color: red; font-style: Italic; }
.olmessaget {color: blue; font-style: Italic; }
.pwmessagef {color: red; font-style: Italic;}
.pwmessaget {color: blue; font-style: Italic;}
</style>
</head>
<nav>
	<h3>
		<img onclick="goreset()" style="cursor: pointer;"
			src="${pageContext.request.contextPath}/resources/img/topia.png"
			width="300px" height="100px" />
	</h3>
	<div style="float: right;">
		<div>
			<c:if test="${mem.user_name ne null}">
				<br>
				<input type="button" class="btn btn-warning btn-sm" value="회원가입"
					onclick="gojoinmember()" />
				<input type="button" class="btn btn-warning btn-sm" value="정보수정"
					onclick="gomemberupt()" />
				<input type="button" class="btn btn-warning btn-sm" value="로그아웃"
					onclick="gologout()" />
				<br>
				<span style="color: #40E0B5; font-size: x-large;">${mem.user_name}님
					환영합니다.</span>
				<br>
				<c:if
					test="${mem.user_status eq 'MASTER' || mem.user_status eq 'ADMIN'}">
					<input type="button" class="btn btn-primary btn-sm" style="display:block; margin : auto;"
						value="회원관리 리스트" onclick="gomemberlist()" />
				</c:if>
			</c:if>
		</div>
		<c:if test="${mem.user_name eq null}">
			<br>
			<input type="button" class="btn btn-warning btn-sm" value="회원가입"
				onclick="gojoinmember()" />
			<input type="button" class="btn btn-warning btn-sm" value="로그인"
				onclick="gologin()" />&nbsp;<br>
			<span style="color: none; font-size: x-large;"></span>
		</c:if>
	</div>
</nav>
  <body class="bg-light">
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>회원 가입</h2>
    </div>
    
    
      <div class="col-md-7 col-lg-8" style=" width: 700px; margin-left :auto; margin-right :auto;">
        <form  class="needs-validation" novalidate action="./jmember" class="form" method="post">
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="firstName" class="form-label" >이름</label>
              <input type="text" class="form-control" id="firstName" name="user_name" placeholder="User name" value="${param.user_name}" required>
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">생년 월 일</label>
              <input type="date" class="form-control" name="user_birth" id="lastName" placeholder="User birth" value="${param.user_birth}" required>
            </div>
                        
            <div class="col-12">
              <label for="username" class="form-label">아이디</label>
              <div class="input-group has-validation">
                <input type="text" class="form-control" minlength="4" name="user_id" id="user_id" placeholder="User id" value="${param.user_id}" required>
              </div>
            </div>
            
            <label class="form-label" style="text-align:center;">
            	<span id="olmessage"></span>
            </label>
            
            <div class="col-12">
              <label for="username" class="form-label">비밀번호</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="user_password" name="user_password" value="${param.user_password}" placeholder="User Password" required>
              </div>
            </div>

            <div class="col-12">
              <label for="username" class="form-label">비밀번호 확인</label>
              <div class="input-group has-validation">
                <input type="password" class="form-control" id="PassCk" placeholder="User Password" required>
              </div>
            </div>

            <label class="form-label" style="text-align:center;">
            	<span id="pwmessage"></span>
            </label>

            <div class="col-2">
              <label for="address" class="form-label">우편번호</label>
              <input type="text" class="form-control" id="postcode" name="user_addressno" value="${param.user_addressno}">
            </div>
            
            <div class="col-8">
              <label for="address" class="form-label">주 소</label>
              <input type="text" class="form-control" id="address" name="user_address" value="${param.user_address}" placeholder="Ex) 서울특별시 금천구 가산동 481-4 1101호" required>
            </div>

            <div class="col-2">
              <label for="address" class="form-label">&nbsp;</label>
              <input type="button" class="form-control" onclick="execDaumPostcode()" value="주소찾기">
            </div>

            <div class="col-12">
              <label for="address" class="form-label">상세주소</label>
              <input type="text" class="form-control" id="detailAddress" name="user_addressdetail" value="${param.user_addressdetail}">
            </div>
	<input type="hidden" id="extraAddress" placeholder="참고항목">                                    
	                        
            <div class="col-12">
              <label for="email" class="form-label">이메일 <span class="text-muted">(@포함 작성)</span></label>
              <input type="email" class="form-control" id="email" name="user_email" value="${param.user_email}" placeholder="you@example.com">
            </div>
		  </div>
		  
          <hr class="my-4">
        <div class="col-12" style="text-align:right;">
			<button class="w-30 btn btn-danger btn" type="button" onclick="goMain()">메인화면</button>
	        <button class="w-30 btn btn-primary btn" id="signup" type="button" onclick="no()">작성완료</button>
		</div>
	</form>
   </div>
   </main>	



   
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022/09 – 2022/10 토피아정보기술(주)</p>
  </footer>
</div>


    <script src="/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

     <!--   <script src="form-validation.js"></script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </body>
</html>
<script type="text/javascript">


	function insertProc() {
		if (confirm("등록하시겠습니까?")) {
			var nameVal = $("[name=user_name]").val();
			if (nameVal == "") {
				alert("이름을 등록하세요");
				$("[name=user_name]").focus();
				return;
			}
			var idVal = $("[name=user_id]").val();
			if (idVal == "") {
				alert("아이디를 등록하세요");
				$("[name=user_id]").focus();
				return;
			}
			var passVal = $("[name=user_password]").val();
			if (passVal == "") {
				alert("패스워드를 등록하세요");
				$("[name=user_password]").focus();
				return;
			}
			// 비밀번호 유효성
			var pw = $("#user_password").val();
			var pwck = $("#PassCk").val();
			if (pw == pwck){
				$("#pwmessage").text("비밀번호가 일치합니다.");	
				$("#pwmessage").addClass("pwmessaget");
				$("#pwmessage").removeClass("pwmessagef");
				$("#signup").attr("onclick", "insertProc()");
			}else{
				$("#pwmessage").text("비밀번호가 일치하지 않습니다.");
				$("#pwmessage").addClass("pwmessagef");
				$("#pwmessage").removeClass("pwmessaget");
				$("#signup").attr("onclick", "no2()");
			}		
			// 아이디 유효성
		var id = $("#user_id").val();
		$.ajax({
			type: "get",
			async: false,
			url: "${path}/board/idcheck",
			data: {"user_id": id},
			success: function (data) {
				if(id != "" && id != null){
					if(data == 1) {
						$("#olmessage").text("이미 사용중인 ID 입니다.");
						$("#olmessage").addClass("olmessagef");
						$("#olmessage").removeClass("olmessaget");
						$("#signup").attr("onclick", "no()");
					}else if(id == "" || id == null){
						alert("아이디를 등록하세요");
					}else{
						$("#olmessage").text("사용 가능한 ID 입니다.");
						$("#olmessage").addClass("olmessaget");
						$("#olmessage").removeClass("olmessagef");
						$("#signup").attr("onclick", "insertProc()");
					}
				}
			}
		})
		
			document.querySelector("form").submit();
		}
	}


	
	var isInsert = "${isInsert}"
	if (isInsert == "Y") {
		if (!confirm("회원가입 완료!\n계속 등록하시겠습니까?")) {
			location.href = "${path}/board/memo_board"
		} else {
			location.href = "${path}/board/jmemberform"
		}
	}

	function goMain() {
		location.href = "${path}/board/memo_board";
	}
	function gologout() {
		alert("${mem.user_name}님 로그아웃 완료!")
		location.href = "/board/logout";
	}
	function gomemberupt() {
		location.href = "/board/memberupdateform";
	}
	function gomemberlist() {
		location.href = "/board/memberlist";
	}
	function gojoinmember() {
		location.href = "${path}/board/jmemberform"
	}

	function gobaordinsert(user_no) {
		var user_name = "${mem.user_name}"
		if (user_name != 0) {
			location.href = "${path}/board/memo_boardinsertForm?user_no="
					+ user_no + "&user_name=" + user_name;
		} else {
			alert("로그인 후 확인 가능합니다.");
			location.href = "${path}/board/memo_board";
		}
	}
	function gologin() {
		location.href = "${path}/board/memo_login";
	}
	function goreset() {
		location.href = "${path}/board/memo_board";
	}
	//$("#overlappedID").click(function(){	
	$("#user_id").keyup(function(){
		var id = $("#user_id").val();
		$.ajax({
			type: "get",
			async: false,
			url: "${path}/board/idcheck",
			data: {"user_id": id},
			success: function (data) {
				if(id != "" && id != null){
					if(data == 1) {
						$("#olmessage").text("이미 사용중인 ID 입니다.");
						$("#olmessage").addClass("olmessagef");
						$("#olmessage").removeClass("olmessaget");
						$("#signup").attr("onclick", "no()");
					}else if(id == "" || id == null){
						alert("아이디를 등록하세요");
					}else{
						$("#olmessage").text("사용 가능한 ID 입니다.");
						$("#olmessage").addClass("olmessaget");
						$("#olmessage").removeClass("olmessagef");
						$("#signup").attr("onclick", "insertProc()");
					}
				}
			}
		})
	});
	
	function no(){
		alert("이미 사용중인 아이디입니다!.");
		$("#user_id").focus();
	}
	function no2(){
		alert("비밀번호가 일치하지 않습니다..");
		$("#user_password").focus();
	}

	
	$("#user_id").keyup(function(){
		var idck = $("#user_id").val();
	});
	
	// 비밀번호 확인
	$("#PassCk").keyup(function(){
		var pw = $("#user_password").val();
		var pwck = $("#PassCk").val();
		if (pw == pwck){
			$("#pwmessage").text("비밀번호가 일치합니다.");	
			$("#pwmessage").addClass("pwmessaget");
			$("#pwmessage").removeClass("pwmessagef");
			$("#signup").attr("onclick", "insertProc()");
		}else{
			$("#pwmessage").text("비밀번호가 일치하지 않습니다.");
			$("#pwmessage").addClass("pwmessagef");
			$("#pwmessage").removeClass("pwmessaget");
			$("#signup").attr("onclick", "no2()");
		}
	});
	// 비밀번호
	$("#user_password").keyup(function(){
		var pw = $("#user_password").val();
		var pwck = $("#PassCk").val();
		if(pwck != "" && pwck != null){
			if (pw == pwck){
				$("#pwmessage").text("비밀번호가 일치합니다.");	
				$("#pwmessage").addClass("pwmessaget");
				$("#pwmessage").removeClass("pwmessagef");
				$("#signup").attr("onclick", "insertProc()");
			}else{
				$("#pwmessage").text("비밀번호가 일치하지 않습니다.");
				$("#pwmessage").addClass("pwmessagef");
				$("#pwmessage").removeClass("pwmessaget");
				$("#signup").attr("onclick", "no2()");
			}
		}
	});
	// 주소처리
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>