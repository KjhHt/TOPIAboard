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


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/test/bootstrap.min.css" />
<script type="text/javascript">
	//선택삭제 해보기
	$(function() {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length;

		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='RowCheck']");
			for (var i = 0; i < chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		});
		$("input[name='RowCheck']").click(function() {
			if ($("input[name='RowCheck']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
	function deleteValue() {
		var url = "checkmemberdelete"
		var valueArr = new Array();
		var list = $("input[name='RowCheck']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				valueArr.push(list[i].value);
			}
		}
		if (valueArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} else {
			var chk = confirm("정말 삭제하시겠습니까?");
			$.ajax({
				url : url,
				type : 'POST',
				traditional : true,
				data : {
					"valueArr" : valueArr
				},
				success : function(jdata) {
					if (jdata = 1) {
						alert("삭제 성공");
						location.replace("memberlist")
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	}
</script>
</head>
<style>

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
			<img onclick="goreset2()" style="cursor: pointer;"
				src="${pageContext.request.contextPath}/resources/img/topia.png"
				width="300px" height="100px" />
		</h3>
		<div style="float: right;">
			<div>
				<c:if test="${mem.user_name ne null}">
					<br>
					<input type="button" class="btn btn-warning btn-sm" value="회원가입"
						onclick="gojoinmember()" style="color:black;"/>
					<input type="button" class="btn btn-warning btn-sm" value="정보수정"
						onclick="gomemberupt()" style="color:black;"/>
					<input type="button" class="btn btn-warning btn-sm" value="로그아웃"
						onclick="gologout()" style="color:black;"/>
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
		<h2>회원정보리스트</h2><br><br>
	</div>


		<table class="table table-hover" style="width:70%; margin-left:auto; margin-right:auto;">
			<thead>
				<tr style="text-align:center;">
					<th>
						<input type="button" class="btn btn-danger btn-sm" value="선택삭제" onclick="deleteValue();"/>
					</th>
					<th colspan="6" style="text-align:center; padding: 0px;">
<div>
	<form action="./memberlist" method="POST">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
			class="form-control-sm" id="listsch" name="selectresult">
			<option value="">검색조건</option>
			<option value="user_id">아이디</option>
			<option value="user_name">이름</option>
			<option value="user_address">주소</option>
			<option value="user_email">이메일</option>
		</select> <input type="text" class="form-control-sm" name="inputresult"
			value="${req.inputresult}" style="width:300px;">
		<button type="submit" value="검색" class="btn btn-primary btn-sm">검색</button>
		<input type="button" value="초기화" class="btn btn-dark btn-sm"
			onclick="goreset()" /> 
	</form>
</div>
					</th>
					<th style="text-align:center; padding:0px; margin-left:10px;">
						<form class="form" id="pageing" method="post">
							<input type="hidden" name="curPage" value="0"> 
						<span>페이지 크기</span> 
							<select name="pageSize">
								<option>3</option>
								<option>5</option>
								<option>10</option>
								<option>20</option>
								<option>30</option>
							</select>
						</form>
					</th>
				</tr>
				<tr style="text-align:center;">
					<th><input class="allCheck" type="checkbox" name="allCheck"></th>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>주소</th>
					<th>권한</th>
				</tr>
			</thead>
			<tbody>
	<form action="${path}/board/updatememberSts" id="Statusupdateform" method="post">
				<c:forEach var="bd" items="${mlist}">
					<tr ondblclick="goDetail(${bd.user_no})" style="text-align:center;">
						<td onclick="event.cancelBubble=true"><input name="RowCheck"
							class="check" type="checkbox" value="${bd.user_no}"></td>
						<td>${bd.user_no}</td>
						<td>${bd.user_id}</td>
						<td>${bd.user_name}</td>
						<td>${bd.user_birth}</td>
						<td>${bd.user_email}</td>
						<td>${bd.user_address} ${bd.user_addressdetail}</td>
						<td>${bd.user_status}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div>
			<ul class="pagination justify-content-center" style="margin: 20px 0">
				<li class="page-item"><a class="page-link"
					href="javascript:goPage(${memo_membersch.startBlock}-1)">이전</a></li>
				<c:forEach var="cnt" begin="${memo_membersch.startBlock}"
					end="${memo_membersch.endBlock}">
					<li class="page-item ${memo_membersch.curPage==cnt?'active':''}">
						<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
					</li>
				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="javascript:goPage(${memo_membersch.endBlock}+1)">다음</a></li>
			</ul>
		</div>
	</form>
	<input type="button" value="쿼리연습실" class="btn btn-dark btn-sm"
		onclick="golist()" />
	<form action="${path}/board/memberdetail" id="detailform" method="post">
		<input type="hidden" id="user_no" name="user_no" value="">
	</form>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022/09 – 2022/10 토피아정보기술(주)</p>
  </footer>
</body>
</html>
<script type="text/javascript">
	function goPage(cnt) {
		// 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
		$("[name=curPage]").val(cnt);
		$("#pageing").submit();
	}
	// 선택된 페이지 크기 설정..
	$("[name=pageSize]").val("${memo_membersch.pageSize}");
	// 페이지 크기 변경시 마다, controller 단 호출..
	$("[name=pageSize]").change(function() {
		$("[name=curPage]").val("1");
		$("#pageing").submit();
	});

	function goDetail(user_no) {
		$("#user_no").val(user_no);
		$("#detailform").submit();
	}
	function goreset() {
		location.href = "${path}/board/memberlist";
	}

	$(document).ready(function() {
		var selectresult = "${req.selectresult}"
		$("#listsch").val(selectresult)

	})

	function golist() {
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
	function goreset2() {
		location.href = "${path}/board/memo_board";
	}
</script>