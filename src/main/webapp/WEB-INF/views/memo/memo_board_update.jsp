<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  table {
    width: 60%;
    border: none;
    border-collapse: collapse;
       margin-left:auto; 
    margin-right:auto;
  }
  th, td {
    border: 1px;
    text-align:center;
    text-overflow:ellipsis;
    overflow:hidden;
	white-space:nowrap; 
	max-width:10px;
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
	text-align:center;
}
nav{
	background: #002B45;
	margin: 0 auto;
    width: 100%;
    overflow: hidden;
    padding : 0;
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
		<img onclick="goreset()" style="cursor:pointer;"
		 src="${pageContext.request.contextPath}/resources/img/topia.png" width="300px" height="100px"/>
</h3>
	<div style="float:right;">
		<div>
			<c:if test="${mem.user_name ne null}"><br>
				<input type="button" class="btn btn-warning btn-sm" value="회원가입" onclick="gojoinmember()"/>
				<input type="button" class="btn btn-warning btn-sm" value="정보수정" onclick="gol()"/>
				<input type="button" class="btn btn-warning btn-sm" value="로그아웃" onclick="gologout()"/><br>
					<span style="color : #40E0B5; font-size:x-large;">${mem.user_name}님 환영합니다.</span>
			</c:if>
		</div>
			<c:if test="${mem.user_name eq null}"><br>
				<input type="button" class="btn btn-warning btn-sm" value="회원가입" onclick="gojoinmember()"/>
				<input type="button" class="btn btn-warning btn-sm" value="로그인" onclick="gologin()"/>&nbsp;<br>
					<span style="color : none; font-size:x-large;"></span>
			</c:if>
	</div>
</nav>
<br>
<div>
	<h2 >답변 작성</h2>
</div>
<div class="container p-5 my-5 border" >
	<form action="${path}/board/memoboardupdate" id="update" method="post">
		<table>
		<tr><td> 
		 <input type="hidden" name="no" id="no" value="${memoboard.no}"/>
		<div class="input-group mb-1">
			등록   아이디 : ${memoboard.regist_id}
		</div>  
		</td></tr>
		<tr><td>
		<div class="input-group mb-1">
			등 록 자 명 : ${memoboard.regist_name}
		</div>  
			
		</td></tr>
		<tr><td>
		<div class="input-group mb-1">
			수정  아이디 : &nbsp;<input name="update_id" value="${memoboard.update_id}" />※ 수정 아이디는 최대 15자까지 입력 가능합니다.
		</div>  
		</td></tr>
		<tr><td>
		<div class="input-group mb-1">
			제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목 : &nbsp;
			<input style="width:530px;" name="title" value="${memoboard.title}" />
		</div>  
		</td></tr>
		<tr><td>
		<div class="input-group mb-1">
			공 지 여 부 : &nbsp;<input type="radio" name="notice_yn" id="Y" value="Y"
					<c:if test="${memoboard.notice_yn eq 'Y'}">checked</c:if> />공지 등록&nbsp;
					   <input type="radio" name="notice_yn" id="N" value="N"
					<c:if test="${memoboard.notice_yn eq 'N'}">checked</c:if> />공지 해제
		</div>  
		</td></tr>
		<tr><td>
		<div class="input-group mb-1">
			작 성 일 자 : &nbsp;<input type="date" name="regist_date" value="${memoboard.regist_date}" />
		</div>  
		</td></tr>
		<tr><td>
		<div>
			<div>
				<span>질 문 내 용</span>
			</div>
			<textarea style="width:700px;" name="content" rows="15">${memoboard.content}</textarea>
		</div> 	
		</td></tr>	
		<tr><td>		
		<div>
			<div>
				<span>내 용 답 변</span>
			</div>
			<textarea style="width:700px;" name="content_reply" rows="15">${memoboard.content_reply}</textarea>
		</div>
		</td></tr>
		<tr><td>		
<div>&nbsp;</div>			 				
		<div>
			<button class="btn btn-success" type="button" onclick="updateProc()">작성</button>
			<button class="btn btn-dark" type="button" onclick="goback(${memoboard.no})">뒤로가기</button>
			<button class="btn btn-primary" type="button" onclick="goMain()">리스트</button>
		</div>	
		</td></tr>
		</table>	
	</form>
</div>
	<form action="${path}/board/memo_boarddetail" id=back method="post">
		<input type="hidden" name="no" id="no" value="${memoboard.no}"/>
	</form>
</body>
</html>
<script type="text/javascript">
function updateProc(){
	if(confirm("수정하시겠습니까?")){
		$("form").attr("action","${path}/board/memoboardupdate");
		$("#update").submit();
	}
}
var isUpdate = "${param.isUpdate}"
	if(isUpdate=="Y"){
		if(!confirm("등록성공했습니다\n계속수정하시겠습니까?")){
			location.href="${path}/board/memo_board"
		}else{
			location.href="${path}/board/memo_boardUpdate?no="+${memoboard.no}
		}
	}
	
function goMain(){
	location.href="${path}/board/memo_board";
}
function goback(no){
	$("#no").val(no);
	$("#back").submit();
}	
function goUpdate(){
	location.href="${path}/board/memo_boardUpdate";
}
function gologout(){
	alert("${mem.user_name}님 로그아웃 완료! 리스트로 이동합니다.")
	location.href="/board/logout";
}
function gojoinmember(){
	location.href="${path}/board/jmemberform"
}
function goreset(){
	location.href="${path}/board/memo_board";
}

</script>