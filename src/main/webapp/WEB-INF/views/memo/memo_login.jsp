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
<!-- bootstrap css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
</head>
<style>
   html,
   body {
     height: 100%;
   }
   
   body {
     display: flex;
     align-items: center;
     padding-top: 40px;
     padding-bottom: 40px;
     background-color: #f5f5f5;
   }
   
   .form-signin {
     width: 100%;
     max-width: 330px;
     padding: 15px;
     margin: auto;
   }
   
   .form-signin .checkbox {
     font-weight: 400;
   }
   
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }

nav {
	background: #002B45;
	margin: 0 auto;
	width: 100%;
	overflow: hidden;
	padding: 0;
	position: fixed;
	height: 130px;
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
header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
}

.banner {
	display: inline-block;
	position: absolute;
}
.banner > img {
	position: relative;
	transform: translate(16px,11px);
}

</style>
<body>
   <main class="form-signin"> 
   <header>
	<nav>
		<div class="banner">
			<img onclick="goreset()" style="cursor: pointer;"
				src="${pageContext.request.contextPath}/resources/img/topia.png"
				width="300px" height="100px" />
		</div>
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
						<input type="button" class="btn btn-primary btn-sm"
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
</header>

	<form action="/board/memo_login" id="login" method="post">
		<h1 class="h3 mb-3 fw-normal" style="text-align:center;">로그인 페이지</h1>
		
		 <div class="form-floating">
            <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디 입력...">
            <label for="user_id">아이디</label>
         </div>
		 <div class="form-floating">
            <input type="password" class="form-control" name="user_password" id="user_password" placeholder="Password">
            <label for="user_password">비밀번호</label>
         </div>
         
         <div class="checkbox mb-3">
            <label>
               <input type="checkbox" value="remember-me" id="remember"> 아이디 저장
            </label>
         </div>
		<button class="w-100 btn btn-lg btn-primary" type="button" onclick="login(); return false;">로그인</button>
		<p class="mt-5 mb-3 text-muted">&copy; 2022/09–2022/10 토피아정보기술(주)</p>
	</form>
  </main>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		var userInputid = getCookie("user_id");//저장된 쿠기값 가져오기
		$("input[name='user_id']").val(userInputid);

		if ($("input[name='user_id']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
			// 아이디 저장하기 체크되어있을 시,
			$("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}

		$("#remember").change(function() { // 체크박스에 변화가 발생시
			if ($("#remember").is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputid = $("input[name='user_id']").val();
				setCookie("userInputid", userInputid, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputid");
			}
		})

	});

	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}

	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}

	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}

	function login() {

		if ($("#user_id").val() == null || $("#user_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#user_id").focus();

			return false;
		}

		if ($("#user_password").val() == null
				|| $("#user_password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#user_password").focus();

			return false;
		}

		$.ajax({
			url : "loginCheck",
			method : "post",
			data : {
				user_id : $("#user_id").val(),
				user_password : $("#user_password").val()
			},
			dataType : "text",
			success : function(data) {
				console.log(data);
				if (data != "pass") {
					alert("비밀번호를 확인해주세요.");
				} else {
					$("#login").submit()
				}
			},
			error : function(error) {
				console.log(error);
			}
		})
	}
	$("#login").keyup(function() {
		if (event.keyCode == 13) {
			login();
		}
	});

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
</script>