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
	<form action="./jmember" class="form"  method="post">
	<table>
		<thead>
			<tr>
				<th colspan="3">회원가입</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>이름</td><td><input type="text"  name="user_name" value="${param.user_name}"/></td>
			</tr>
			<tr>
				<td>아이디</td><td><input type="text"  name="user_id" value="${param.user_id}"/></td>
			</tr>
			<tr>
				<td>비밀번호</td><td><input type="text"  name="user_password" value="${param.user_password}"/></td>
			</tr>
			<tr>
				<td>주소</td><td><input type="text" name="user_address" value="${param.user_address}"/></td>
			</tr>
			<tr>
				<td>생년월일</td><td><input type="date" name="user_birth" value="${param.user_birth}"/></td>
			</tr>
		</tbody>
	</table> 		
		<div>
			<button type="button" onclick="insertProc()">회원가입</button>
			<button type="button" onclick="goMain()">메인화면</button>
		</div>		
	</form>
</body>
</html>
<script type="text/javascript">
function insertProc(){
	if(confirm("등록하시겠습니까?")){
		var nameVal = $("[name=user_name]").val();		
		if(	nameVal == ""){
			alert("이름을 등록하세요");
			$("[name=user_name]").focus();
			return; 
		}	
		var idVal = $("[name=user_id]").val();		
		if(	idVal == ""){
			alert("아이디를 등록하세요");
			$("[name=user_id]").focus();
			return; 
		}	
		var passVal = $("[name=user_password]").val();		
		if(	passVal == ""){
			alert("패스워드를 등록하세요");
			$("[name=user_password]").focus();
			return; 
		}	
		document.querySelector("form").submit();
	}
}	

var isInsert = "${isInsert}"
	if(isInsert=="Y"){
		if(!confirm("회원가입 완료!\n계속 등록하시겠습니까?")){
			location.href="${path}/board/memo_board"
		}else{
			location.href="${path}/board/jmemberform"
		}
	}
	
function goMain(){
	location.href="${path}/board/memo_board";
}
</script>