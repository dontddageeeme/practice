<%@ page contentType="text/html; charset=UTF-8"%>
<%
	/*
		문제) 비번이 같으면 삭제되게하고, 비번이 다르면 alert('비번이 다릅니다!!');라고 경고창을 띄우고 history.go(-1)을 사용해서 뒤로 한칸 이동한다. 이것을 history.back()과 같은 기능이다.
		delete 삭제 쿼리문 수행후 성공한 레코드 행의 개수1 리턴받아서 if조건문으로 처리해서 jsp내장객체인
		response.sendRedirect("guest_list.jsp")로 이동되게 만든다.
		참조할 소스 파일은 guest_edit_ok.jsp이다.
	*/
%>
