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
<style>
  table {
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
</style>
<body>
<h1>
	초간단게시판 
</h1>
	    <button onclick="goInsert()" type="button">등록</button>
	<table>
		<thead>
		<tr style="border:1;">
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
		</tr>
		</thead>
	<tbody>
	    <c:forEach var="bd" items="${blist}" >
			<tr ondblclick="goDetail(${bd.no})">
				 <td>${bd.cnt}</td>
				 <td>${bd.writer}</td>
				 <td>${bd.subject}</td>
			</tr>	
    	</c:forEach>	
	</tbody>
	</table>
	<form action="${path}/board/detail" id="detailform" method="post">
		<input type="hidden" id="no" name="no" value="">
	</form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
	function goInsert(){
		location.href="${path}/board/insform"
	}
	function goDetail(no){
		$("#no").val(no);
		$("#detailform").submit();
	}	
</script>