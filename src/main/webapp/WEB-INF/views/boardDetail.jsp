<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
		<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	
</head>
<body>
<h1>
	게시판상세화면
</h1>
	<form action="./uptdate" class="form"  method="post">
		<input type="hidden" name="no" value="${empty param.no?'0': param.no}"/>
		<div>
			<div>
				<span>제 목</span>
			</div>
			<input name="subject" value="${board.subject}" placeholder="제목 입력하세요" />	
		</div>  
		<div>
			<div>
				<span>작성자</span>
			</div>
			<input name="writer" value="${board.writer}" placeholder="작성자 입력하세요" />	
		</div> 		
		<div>
			<button type="button" onclick="updateProc()">수정</button>
			<button type="button" onclick="deleteProc()">삭제</button>
			<button type="button" onclick="goMain()">메인화면</button>
		</div>		
	</form>
</body>
</html>
<script type="text/javascript">
function updateProc(){
	if(confirm("수정하시겠습니까?")){
		// 유효성 check
		$("form").attr("action","${path}/board/update");
		$("form").submit();
	}
}
function deleteProc(){
	if(confirm("삭제하시겠습니까?")){
		$("form").attr("action","${path}/board/memoboarddelete");
		$("form").submit();		
	}
}
var proc = "${proc}"
	if(proc=="upt"){
		if(confirm("수정성공!\n조회리스트화면으로 이동하시겠습니까?")){
			location.href="${path}/board";
		}
	}
	if(proc=="del"){
		alert("삭제성공\n조회 리스트화면으로 이동합니다.")
		location.href="${path}/board";
	}	

	function goMain(){
		location.href="${path}/board";
	}
</script>