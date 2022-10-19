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
</head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
//선택삭제 해보기
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});
function deleteValue(){
	var url = "checkdelete"
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	for(var i=0; i<list.length; i++){
		if(list[i].checked){
			valueArr.push(list[i].value);
		}
	}
	if(valueArr.length == 0){
		alert("선택된 글이 없습니다.");
	}
	else{
		var chk = confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url : url,
			type : 'POST',
			traditional : true,
			data : {
				"valueArr" : valueArr
			},
			success: function(jdata){
				if(jdata = 1){
					alert("삭제 성공");
					location.replace("memo_board")
				}
				else{
					alert("삭제 실패");
				}
			}
		});
	}
}
</script>

<style>
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
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
		<h2>쿼리연습실</h2>
	</div>

	<div>&nbsp;</div>
	<form action="./memo_board" method="POST">
		&nbsp; <select class="form-control-sm" id="listsch"
			name="selectresult">
			<option value="">검색조건</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="regist_name">등록자명</option>
			<option value="regist_id">등록아이디</option>
		</select> <input type="text" class="form-control-sm" name="inputresult"
			value="${req.inputresult}">
		<button type="submit" value="검색" class="btn btn-primary btn-sm">검색</button>
		<input type="button" value="초기화" class="btn btn-dark btn-sm"
			onclick="goreset()" />
		<c:if
			test="${mem.user_status eq 'MASTER' || mem.user_status eq 'ADMIN'}">
			<input type="button" class="btn btn-danger btn-sm" value="선택삭제"
				onclick="deleteValue();" />
		</c:if>
		<div style="float: right;">
			<input type="button" class="btn btn-success btn-sm" value="게시글 등록"
				onclick="gobaordinsert(${mem.user_no})" />&nbsp;
		</div>
	</form>

	<form class="form" id="pageing" method="post">
		<input type="hidden" name="curPage" value="0">
		<!-- 페이지크기 설정 지금은안씀
			<span class="text-center input-group-text">페이지 크기</span>
			<select name="pageSize" class="form-select">
				<option>3</option>
				<option>5</option>
				<option>10</option>
				<option>20</option>
				<option>30</option>
			</select>
		 	-->
	</form>
	<div class="container-responsive-xxl">
		<table class="table">
			<col width="3%">
			<col width="3%">
			<col width="15%">
			<col width="20%">
			<col width="6%">
			<col width="6%">
			<col width="6%">
			<col width="5%">
			<col width="5%">
			<col width="5%">
			<col width="5%">
			<col width="5%">
			<thead class="table-primary">
				<tr>
					<th><input class="allCheck" type="checkbox" name="allCheck"></th>
					<th>순번</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일자</th>
					<th>등록일자</th>
					<th>수정일자</th>
					<th>등록자명</th>
					<th>등록아이디</th>
					<th>수정아이디</th>
					<th>등록아이피</th>
					<th>수정아이피</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ml" items="${mlist}">
					<tr class="colored" style="cursor: pointer;"
						onclick="goDetail(${ml.no})">
						<td onclick="event.cancelBubble=true"><input name="RowCheck"
							class="check" type="checkbox" value="${ml.no}"></td>
						<td>${ml.cnt}</td>
						<td><c:if test="${ml.notice_yn eq 'Y'}">
								<img
									src="${pageContext.request.contextPath}/resources/img/notice.png"
									width="20px" height="20px" />
							</c:if> ${ml.title}</td>
						<td><c:if test="${ml.content_reply ne null}">
								<img
									src="${pageContext.request.contextPath}/resources/img/reply.png"
									width="20px" height="20px" />
							</c:if> ${ml.content}</td>
						<td><fmt:formatDate value="${ml.write_date}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${ml.regist_date}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${ml.update_date}"
								pattern="yyyy-MM-dd" /></td>
						<td>${ml.regist_name}</td>
						<td>${ml.regist_id}</td>
						<td>${ml.update_id}</td>
						<td>${ml.regist_ip}</td>
						<td>${ml.update_ip}</td>
					</tr>
					<form action="${path}/board/memo_boarddetail" id="detailform2"
						method="post">
						<input type="hidden" name="no" id="no" value="${ml.no}" /> <input
							type="hidden" name="user_name" id="user_name"
							value="${mem.user_name}" />
					</form>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<ul class="pagination justify-content-center" style="margin: 20px 0">
			<li class="page-item"><a class="page-link"
				href="javascript:goPage(${memo_boardsch.startBlock}-1)">이전</a></li>
			<c:forEach var="cnt" begin="${memo_boardsch.startBlock}"
				end="${memo_boardsch.endBlock}">
				<li class="page-item ${memo_boardsch.curPage==cnt?'active':''}">
					<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a>
				</li>
			</c:forEach>
			<li class="page-item"><a class="page-link"
				href="javascript:goPage(${memo_boardsch.endBlock}+1)">다음</a></li>
		</ul>
	</div>
  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; 2022/09 – 2022/10 토피아정보기술(주)</p>
  </footer>
</body>
</html>
<script type="text/javascript">
function goPage(cnt){
	// 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
	$("[name=curPage]").val(cnt);
	$("#pageing").submit();
}
	// 선택된 페이지 크기 설정..
	$("[name=pageSize]").val("${memo_boardsch.pageSize}");
	// 페이지 크기 변경시 마다, controller 단 호출..
	$("[name=pageSize]").change(function(){
		$("[name=curPage]").val("1");
		$("#pageing").submit();
	});
function goDetail(no){
	var user_name = "${mem.user_name}"
	if(user_name != 0 ){
		$("#no").val(no);
		$("#detailform2").submit();
	}else{
		alert("로그인 후 확인 가능합니다.")
		location.href="${path}/board/memo_board";
	}
}	
		  
$(document).ready(function(){
	var selectresult = "${req.selectresult}"
	$("#listsch").val(selectresult)
	
})

function gologout(){
	alert("${mem.user_name}님 로그아웃 완료!")
	location.href="/board/logout";
}
function gomemberupt() {
	location.href="/board/memberupdateform";
}
function gomemberlist(){
	location.href="/board/memberlist";
}
function gojoinmember(){
	location.href="${path}/board/jmemberform"
}

function gobaordinsert(user_no){
	var user_name = "${mem.user_name}"
	if(user_name != 0 ){
	location.href="${path}/board/memo_boardinsertForm?user_no="+user_no+"&user_name="+user_name;
	}else{
	alert("로그인 후 확인 가능합니다.");
	location.href="${path}/board/memo_board";
}
}
function gologin(){
	location.href="${path}/board/memo_login";
}
function goreset(){
	location.href="${path}/board/memo_board";
}
</script>