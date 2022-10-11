<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
		<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
	<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
	<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
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
	var url = "checkmemberdelete"
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
					location.replace("memberlist")
				}
				else{
					alert("삭제 실패");
				}
			}
		});
	}
}
</script>
</head>
<style>
  table {
    width: 80%;
    border: 1px solid #444444;
    border-collapse: collapse;
    margin-left:auto; 
    margin-right:auto;
  }
  th, td {
    border: 1px solid #444444;
    text-align:center;
    text-overflow:ellipsis;
     overflow:hidden;
	white-space:nowrap; 
	max-width:10px;
  }
tr.colored:nth-child(even){

  background-color:none;

  color:#000000;

}

tr.colored:nth-child(odd){

  background-color:none;

  color:#000000;

}

tr.colored:hover td{

  background-color:#dcdcdc !important;

  color:#303f39 !important;

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
<div>
	<h2>회원정보리스트</h2>
</div>
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<select class="form-control-sm" id="listsch" name="selectresult">
			<option value="">검색조건</option>
			<option value="user_id">아이디</option>
			<option value="user_name">이름</option>
			<option value="user_address">주소</option>
		</select>
	<input type="text" class="form-control-sm" name="inputresult" value="${req.inputresult}">
	<button type="submit" value="검색" class="btn btn-primary btn-sm">검색</button>
		<input type="button" value="초기화" class="btn btn-dark btn-sm" onclick="goreset()"/>
		<input type="button" class="btn btn-danger btn-sm" value="선택삭제" onclick="deleteValue();"/>
 <div>&nbsp;</div>
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
	<form action="${path}/board/updatememberSts" id="Statusupdateform" method="post">
 	<table>
		<thead>
		<tr>
			<th><input class="allCheck" type="checkbox" name="allCheck"></th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>주소</th>
			<th>권한</th>
		</tr>
		</thead>
	<tbody>

	    <c:forEach var="bd" items="${mlist}">
			<tr ondblclick="goDetail(${bd.user_no})">
				 <td onclick="event.cancelBubble=true"><input name="RowCheck" class="check" type="checkbox" value="${bd.user_no}"></td>
				 <td>${bd.user_no}</td>
				 <td>${bd.user_id}</td>
				 <td>${bd.user_name}</td>
				 <td>${bd.user_birth}</td>
				 <td>${bd.user_address}</td>
				 <td>${bd.user_status}</td>
			</tr>
    	</c:forEach>	
		
	</tbody>
	</table>
<div>
	<ul class="pagination justify-content-center" style="margin:20px 0">
	  <li class="page-item">
	  	<a class="page-link" href="javascript:goPage(${memo_membersch.startBlock}-1)">이전</a></li>
		  <c:forEach var="cnt" begin="${memo_membersch.startBlock}" end="${memo_membersch.endBlock}">
		  	<li class="page-item ${memo_membersch.curPage==cnt?'active':''}">
		  			<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
		  </c:forEach>
	  <li class="page-item"><a class="page-link" href="javascript:goPage(${memo_membersch.endBlock}+1)">다음</a></li>
	</ul> 
</div>	
   	</form>	
   	<input type="button" value="리스트" class="btn btn-dark btn-sm" onclick="golist()"/>
	<form action="${path}/board/memberdetail" id="detailform" method="post">
		<input type="hidden" id="user_no" name="user_no" value="">
	</form>
</body>
</html>
<script type="text/javascript">
function goPage(cnt){
	// 요청값으로 현재 클릭한 페이지를 설정하고, 서버에 전달..
	$("[name=curPage]").val(cnt);
	$("#pageing").submit();
}
	// 선택된 페이지 크기 설정..
	$("[name=pageSize]").val("${memo_membersch.pageSize}");
	// 페이지 크기 변경시 마다, controller 단 호출..
	$("[name=pageSize]").change(function(){
		$("[name=curPage]").val("1");
		$("#pageing").submit();
	});
	
	$(document).ready(function(){
		<%-- 
		--%>	
	});
	function goDetail(user_no){
		$("#user_no").val(user_no);
		$("#detailform").submit();
	}	
	function goreset(){
		location.href="${path}/board/memberlist";
	}
	$(document).ready(function(){
		var selectresult = "${req.selectresult}"
		$("#listsch").val(selectresult)
		
	})
	function golist(){
		location.href="${path}/board/memo_board";
	}
	
</script>