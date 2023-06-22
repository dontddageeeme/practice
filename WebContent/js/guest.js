/*
	guest.js
 */
 
 function check(){	//function 키워드로 check()라는 함수 정의
 
 	if($.trim($("#gname").val())==""){
 		alert("글쓴이를 입력하세요!");
 		$('#gname').val("").focus();
 		return false;
 	}
 	if($.trim($("#gtitle").val())==""){
 		alert("글제목을 입력하세요!");
 		$('#gtitle').val("").focus();
 		return false;
 	}
 	
 	if($.trim($("#gpwd").val())==""){
 		alert("비밀번호를 입력하세요!");
 		$('#gpwd').val("").focus();
 		return false;
 	}
 	
 	if($.trim($("#gcont").val())==""){
 		alert("글내용을 입력하세요!");
 		$('#gcont').val("").focus();
 		return false;
 	}
 	
}
	 