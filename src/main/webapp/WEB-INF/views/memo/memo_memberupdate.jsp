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
</head>
<body>
<h2>정보 수정</h2>
	<form action="${path}/board/memberupdate" id="update" method="post">
		<input type="hidden" name="user_no" id="user_no" value="${mem.user_no}"/>
		<input type="hidden" name="user_status" id="user_status" value="${mem.user_status}"/>
		<table>
			<tr><td>아이디 :&nbsp;<input type="text" name="user_id" value="${mem.user_id}" readonly/></td></tr>
			<tr><td>이 름 :&nbsp;<input type="text" name="user_name" value="${mem.user_name}"/></td></tr>
			<tr><td>주 소 :&nbsp;<input type="text" name="user_address" value="${mem.user_address}"/></td></tr>
			<tr><td>생년월일 :&nbsp;<input type="date" name="user_birth" value="${mem.user_birth}"/></td></tr>
			<tr><td><button type="button" onclick="updateProc()">수정</button></td></tr>

		</table>
	</form>
</body>
</html>
<script type="text/javascript">
function updateProc(){
	if(confirm("수정하시겠습니까?")){
		$("form").attr("action","${path}/board/memberupdate");
		$("#update").submit();
	}
}
var isUpdate = "${isUpdate}"
	if(isUpdate=="Y"){
		if(!confirm("등록성공했습니다\n계속수정하시겠습니까?")){
			location.href="${path}/board/memo_board"
		}else{
			location.href="${path}/board/memberupdateform"
		}
	}
	
</script>