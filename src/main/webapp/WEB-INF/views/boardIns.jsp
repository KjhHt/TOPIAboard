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
	게시글등록  
</h1>
	<form action="./ins" class="form"  method="post">
		<!-- <input type="hidden" name="no" value="${empty param.no?'0': param.no}"/> -->
		<div>
			<div>
				<span>제 목</span>
			</div>
			<input name="subject" value="${param.subject}" placeholder="제목 입력하세요" />	
		</div>  
		<div>
			<div>
				<span>작성자</span>
			</div>
			<input name="writer" value="${param.writer}" placeholder="작성자 입력하세요" />	
		</div> 		
		<div>
			<button type="button" onclick="insertProc()">등록</button>
			<button type="button" onclick="goMain()">메인화면</button>
		</div>		
	</form>
</body>
</html>
<script type="text/javascript">
function insertProc(){
	if(confirm("등록하시겠습니까?")){
		var subjectVal = $("[name=subject]").val();		
		if(	subjectVal == ""){
			alert("제목을 등록하세요");
			$("[name=subject]").focus();
			return; 
		}	
		var writerVal = $("[name=writer]").val();		
		if(	writerVal == ""){
			alert("작성자를 등록하세요");
			$("[name=writer]").focus();
			return; 
		}	
		document.querySelector("form").submit();
	}
}	

var isInsert = "${isInsert}"
	if(isInsert=="Y"){
		if(!confirm("등록성공했습니다\n계속등록하시겠습니까?")){
			location.href="${path}/board"
		}else{
			location.href="${path}/board/insform"
		}
	}
	
function goMain(){
	location.href="${path}/board";
}
</script>