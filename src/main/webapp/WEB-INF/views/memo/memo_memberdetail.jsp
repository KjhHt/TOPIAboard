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
<h2>회원정보 상세</h2>
	<form action="${path}/board/updatememberSts" method="post" id="updateform">
		<input type="hidden" name="user_no" id="user_no" value="${mem.user_no}"/>
		<table>
			<tr><td>권 한 :&nbsp;
				<select name="user_status" id="user_status" readonly>
					<option value="MASTER" <c:if test="${mem.user_status eq 'MASTER'}" >selected </c:if>disabled hidden >MASTER</option>
					<option value="ADMIN" <c:if test="${mem.user_status eq 'ADMIN'}" >selected </c:if> >ADMIN</option>
					<option value="USER" <c:if test="${mem.user_status eq 'USER'}" >selected</c:if> >USER</option>
				</select>
			</td></tr>
			<tr><td>아이디 :&nbsp;<input type="text" name="user_id" value="${mem.user_id}" readonly/></td></tr>
			<tr><td>이 름 :&nbsp;<input type="text" name="user_name" value="${mem.user_name}" readonly/></td></tr>
			<tr><td>주 소 :&nbsp;<input type="text" name="user_address" value="${mem.user_address}" readonly/></td></tr>
			<tr><td>생년월일 :&nbsp;<input type="date" name="user_birth" value="${mem.user_birth}" readonly/></td></tr>
			<tr><td><button type="button" onclick="goDelete2()">삭제</button>
			<button type="button" onclick="goback()">뒤로가기</button>
			<input type="button" value="권한수정" onclick="updateProc()"/></td></tr>
		</table>
	</form>
</body>
</html>
<script type="text/javascript">
	
function goDelete2(user_no){
	if(confirm("삭제하시겠습니까?")){
		$("#delform").attr("action","${path}/board/memberdelete");
		$("#delform").submit();		
	}
}
var proc = "${proc}"
if(proc=="del"){
	alert("삭제성공\n회원관리 리스트화면으로 이동합니다.")
	location.href="${path}/board/memberlist";
}
function goback(){
	location.href="${path}/board/memberlist";
}

function updateProc(){
	if(confirm("권한을 수정하시겠습니까?")){
		$("form").attr("action","${path}/board/updatememberSts");
		$("#updateform").submit();
	}
}
var isUpdate = "${isUpdate}"
	if(isUpdate=="Y"){
		if(!confirm("변경완료했습니다\n계속수정하시겠습니까?")){
			location.href="${path}/board/memberlist"
		}else{
			location.href="${path}/board/memberdetail?user_no="+${param.user_no}
		}
	}
</script>