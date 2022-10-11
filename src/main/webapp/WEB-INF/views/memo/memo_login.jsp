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
<h2>로그인</h2>
<form action="/board/memo_login" id="login" method="post">
아이디 : <input type="text" name="user_id" id="user_id"><br>
비밀번호 : <input type="password" name="user_password" id="user_password"><br>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                아이디 저장
              </label>
            </div>
          </div>
          <div class="col-4">
            <button type="button" onclick="login(); return false;">로그인</button>
            <input type="reset" value="다시입력">
          </div>
        </div>
        
 </form>

</body>
</html>
<script type="text/javascript">
	$(document).ready(function(){
		var userInputid = getCookie("user_id");//저장된 쿠기값 가져오기
		$("input[name='user_id']").val(userInputid); 
	     
	    if($("input[name='user_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	                                           // 아이디 저장하기 체크되어있을 시,
	        $("#remember").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#remember").change(function(){ // 체크박스에 변화가 발생시
	        if($("#remember").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputid = $("input[name='user_id']").val();
	            setCookie("userInputid", userInputid, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputid");
	        }
	    })
	    
	    
	});
	    
	    function setCookie(cookieName, value, exdays){
	        var exdate = new Date();
	        exdate.setDate(exdate.getDate() + exdays);
	        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	        document.cookie = cookieName + "=" + cookieValue;
	    }
	     
	    function deleteCookie(cookieName){
	        var expireDate = new Date();
	        expireDate.setDate(expireDate.getDate() - 1);
	        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	    }
	    
	    function getCookie(cookieName) {
	        cookieName = cookieName + '=';
	        var cookieData = document.cookie;
	        var start = cookieData.indexOf(cookieName);
	        var cookieValue = '';
	        if(start != -1){
	            start += cookieName.length;
	            var end = cookieData.indexOf(';', start);
	            if(end == -1)end = cookieData.length;
	            cookieValue = cookieData.substring(start, end);
	        }
	        return unescape(cookieValue);
	    }
	
	function login() {
			
		if ($("#user_id").val() == null || $("#user_id").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#user_id").focus();
			 
			return false;
		}
		
		if ($("#user_password").val() == null || $("#user_password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#user_password").focus();
			
			return false;		
		}
		
		$.ajax({
			url: "loginCheck",
			method: "post",
			data: {
				user_id: $("#user_id").val(),
				user_password: $("#user_password").val()
			},
			dataType: "text",
			success: function(data){
				console.log(data);
				if(data!="pass"){
					alert("비밀번호를 확인해주세요.");
				}else{
					$("#login").submit()
				}
			},
			error: function(error){
				console.log(error);
			}
		})
		
		
		
			
	}
	$("#login").keyup(function(){
		if(event.keyCode==13){
			login();
		}
	});
	/*
	$("#login").on('submit', function(){
		$.ajax({
			url: "loginCheck",
			method: "post",
			data: {
				user_id: $("#user_id").val(),
				user_password: $("#user_password").val()
			},
			dataType: "text",
			success: function(data){
				console.log(data);
				if(data!="pass"){
					alert("비밀번호를 확인해주세요.");
				}else{
					alert("DD");
					return false;
				}
			},
			error: function(error){
				console.log(error);
			}
		})
	})
	*/
</script>