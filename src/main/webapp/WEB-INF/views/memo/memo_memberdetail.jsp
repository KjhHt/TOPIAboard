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
      <h2>회원 정보상세</h2>
    </div>

      <div class="col-md-7 col-lg-8" style=" width: 700px; margin-left :auto; margin-right :auto;">    
	<form class="needs-validation" action="${path}/board/updatememberSts" method="post" id="updateform">
          <div class="row g-3">		
		<input type="hidden" name="user_no" id="user_no" value="${mem2.user_no}" />

            <div class="col-sm-6">
              <label class="form-label" >아이디</label>
              <input type="text" class="form-control" value="${mem2.user_id}" readonly>
            </div>

            <div class="col-sm-6">
              <label class="form-label" >권한</label>
				<select class="form-control" name="user_status" id="user_status">
						<option value="MASTER"
							<c:if test="${mem2.user_status eq 'MASTER'}" >selected </c:if>
							disabled hidden>MASTER</option>
						<option value="ADMIN"
							<c:if test="${mem2.user_status eq 'ADMIN'}" >selected </c:if>>ADMIN</option>
						<option value="USER"
							<c:if test="${mem2.user_status eq 'USER'}" >selected</c:if>>USER</option>
				</select>
            </div>

            <div class="col-sm-12">
              <label class="form-label" >이 름</label>
              <input type="text" class="form-control" value="${mem2.user_name}" readonly>
            </div>

            <div class="col-sm-12">
              <label class="form-label" >생년월일</label>
              <input type="text" class="form-control" value="${mem2.user_birth}" readonly>
            </div>

            <div class="col-sm-12">
              <label class="form-label" >이메일</label>
              <input type="text" class="form-control" value="${mem2.user_email}" readonly>
            </div>

            <div class="col-sm-12">
              <label class="form-label" >주 소</label>
              <input type="text" class="form-control" value="${mem2.user_address}" readonly>
            </div>
           </div>
		 <hr class="my-4">
       <div class="row g-3">	
        <div class="col-sm-6" style="text-align:left;">
			<c:if test="${mem.user_status eq 'MASTER'}">
				<button class="w-30 btn btn-warning btn" type="button" onclick="updateProc()">권한수정</button>
			</c:if>
		</div>
        <div class="col-sm-6" style="text-align:right;">
        	<button class="w-30 btn btn-primary btn" type="button" onclick="goback()">뒤로가기</button>
			<button class="w-30 btn btn-danger btn" type="button" onclick="goDelete2()">삭제</button>	       
		</div>
	   </div>
	</form>
   </div>
   </main>	
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022/09 – 2022/10 토피아정보기술(주)</p>
  </footer>
  </div>
</body>
</html>
<script type="text/javascript">
	function goDelete2(user_no) {
		if (confirm("삭제하시겠습니까?")) {
			$("form").attr("action", "${path}/board/memberdelete");
			$("#updateform").submit();
		}
	}
	var proc = "${proc}"
	if (proc == "del") {
		alert("삭제성공\n회원관리 리스트화면으로 이동합니다.")
		location.href = "${path}/board/memberlist";
	}
	function goback() {
		location.href = "${path}/board/memberlist";
	}

	function updateProc() {
		if (confirm("권한을 수정하시겠습니까?")) {
			$("form").attr("action", "${path}/board/updatememberSts");
			$("#updateform").submit();
		}
	}
	var isUpdate = "${isUpdate}"
	if (isUpdate == "Y") {
		if (!confirm("변경완료했습니다\n계속수정하시겠습니까?")) {
			location.href = "${path}/board/memberlist"
		} else {
			location.href = "${path}/board/memberdetail?user_no=" + ${param.user_no}
		}
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