<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
<script
	src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

<script
	src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
</head>
<style>
table {
	width: 80%;
	border: 1px solid #444444;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

th, td {
	border: 1px solid #444444;
	text-align: center;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 10px;
}

tr.colored:nth-child(even) {
	background-color: none;
	color: #000000;
}

tr.colored:nth-child(odd) {
	background-color: none;
	color: #000000;
}

tr.colored:hover td {
	background-color: #dcdcdc !important;
	color: #303f39 !important;
}

h2 {
	position: relative;
	display: inline-block;
	padding: 0.7rem 1rem;
}

h2::before, h2::after {
	position: absolute;
	display: inline-block;
	content: '';
	width: 20px;
	height: 30px;
}

h2::before {
	top: 0px;
	left: 0px;
	border-top: 2px solid #f44336;
	border-left: 2px solid #f44336;
}

h2::after {
	right: 0px;
	bottom: 0px;
	border-right: 2px solid #f44336;
	border-bottom: 2px solid #f44336;
}

div {
	text-align: center;
}

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
</style>
<body>
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
					<input type="button" class="btn btn-warning btn-sm" value="????????????"
						onclick="gojoinmember()" />
					<input type="button" class="btn btn-warning btn-sm" value="????????????"
						onclick="gomemberupt()" />
					<input type="button" class="btn btn-warning btn-sm" value="????????????"
						onclick="gologout()" />
					<br>
					<span style="color: #40E0B5; font-size: x-large;">${mem.user_name}???
						???????????????.</span>
					<br>
					<c:if
						test="${mem.user_status eq 'MASTER' || mem.user_status eq 'ADMIN'}">
						<input type="button" class="btn btn-primary btn-sm"
							value="???????????? ?????????" onclick="gomemberlist()" />
					</c:if>
				</c:if>
			</div>
			<c:if test="${mem.user_name eq null}">
				<br>
				<input type="button" class="btn btn-warning btn-sm" value="????????????"
					onclick="gojoinmember()" />
				<input type="button" class="btn btn-warning btn-sm" value="?????????"
					onclick="gologin()" />&nbsp;<br>
				<span style="color: none; font-size: x-large;"></span>
			</c:if>
		</div>
	</nav>

	<br>
	<div>
		<h2>?????????</h2>
	</div>
	<form action="/board/memo_login" id="login" method="post">
		????????? : <input type="text" name="user_id" id="user_id"><br>
		???????????? : <input type="password" name="user_password" id="user_password"><br>
		<div class="row">
			<div class="col-8">
				<div class="icheck-primary">
					<input type="checkbox" id="remember"> <label for="remember">
						????????? ?????? </label>
				</div>
			</div>
			<div class="col-4">
				<button type="button" onclick="login(); return false;">?????????</button>
				<input type="reset" value="????????????">
			</div>
		</div>

	</form>

</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		var userInputid = getCookie("user_id");//????????? ????????? ????????????
		$("input[name='user_id']").val(userInputid);

		if ($("input[name='user_id']").val() != "") { // ??? ?????? ID??? ???????????? ?????? ????????? ??????
			// ????????? ???????????? ?????????????????? ???,
			$("#remember").attr("checked", true); // ID ??????????????? ?????? ????????? ??????.
		}

		$("#remember").change(function() { // ??????????????? ????????? ?????????
			if ($("#remember").is(":checked")) { // ID ???????????? ???????????? ???,
				var userInputid = $("input[name='user_id']").val();
				setCookie("userInputid", userInputid, 7); // 7??? ?????? ?????? ??????
			} else { // ID ???????????? ?????? ?????? ???,
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
			alert("???????????? ??????????????????.");
			$("#user_id").focus();

			return false;
		}

		if ($("#user_password").val() == null
				|| $("#user_password").val() == "") {
			alert("??????????????? ??????????????????.");
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
					alert("??????????????? ??????????????????.");
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
		alert("${mem.user_name}??? ???????????? ??????!")
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
			alert("????????? ??? ?????? ???????????????.");
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