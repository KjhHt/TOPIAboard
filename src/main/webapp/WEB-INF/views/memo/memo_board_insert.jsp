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

<script
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
table {
	width: 55%;
	border: none;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

th, td {
	border: 1px;
	text-align: center;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	max-width: 10px;
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
	<br>
	<div>
		<h2>게시물 등록</h2>
	</div>
	<div class="container p-5 my-5 border">
		<form action="${path}/board/memo_boardinsert" method="post">
			<table>
				<tr>
					<td><input type="hidden" name="user_no"
						value="${param.user_no}" />
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								등록 아이디 : <input name="regist_id" value="${param.regist_id}" />
								※ 등록 아이디는 최대 15자까지 입력 가능합니다.
							</div>
						</div></td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								등 록 자 명 : <input name="regist_name" value="${param.user_name}"
									readonly /> ※ 등록자명은 수정이 불가능합니다.
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							제&nbsp;&nbsp;목 : <input name="title" value="${param.title}"
								placeholder="제목을 입력하세요(한글기준 50자 이내)" style="width: 530px;" />
						</div>
						<br>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								공 지 여 부 : <input type="radio" name="notice_yn" id="Y" value="Y" />공지
								등록 <input type="radio" name="notice_yn" id="N" value="N" />공지 해제
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								작 성 일 자 : <input type="date" name="regist_date"
									value="${param.regist_date}" />
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>
							<div>
								<span>질 문 내 용</span>
							</div>
							<textarea style="width: 600px;" name="content" rows="15">${param.content}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div>&nbsp;</div>
						<div>
							<button class="btn btn-success" type="button"
								onclick="goinsert()">저장</button>
							<button class="btn btn-dark" type="button" onclick="goMain()">뒤로가기</button>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022/09 – 2022/10 토피아정보기술(주)</p>
  </footer>
</body>
</html>
<script type="text/javascript">
	function goinsert() {
		if (confirm("저장하시겠습니까?")) {
			var subjectVal = $("[name=subject]").val();
			if (subjectVal == "") {
				alert("제목을 등록하세요");
				$("[name=subject]").focus();
				return;
			}
			var writerVal = $("[name=writer]").val();
			if (writerVal == "") {
				alert("작성자를 등록하세요");
				$("[name=writer]").focus();
				return;
			}
			document.querySelector("form").submit();
		}
	}

	var isInsert = "${isInsert}"
	if (isInsert == "Y") {
		if (!confirm("등록성공했습니다\n계속등록하시겠습니까?")) {
			location.href = "${path}/board/memo_board"
		} else {
			location.href = "${path}/board/memo_boardinsertForm"
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
</script>