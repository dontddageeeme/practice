<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));	//get으로 전달된 번호값을 받아서  정수로 변경
	
	String driver = "oracle.jdbc.OracleDriver";            
   	String url = "jdbc:oracle:thin:@localhost:1521:XE";      
   	String user = "java";   
   	String password = "1234";   
   
   	Connection con = null;            
   	PreparedStatement pstmt = null;      
   	ResultSet rs = null;            
   	String sql = null;               
   	
   	try {
   	 
	      Class.forName(driver);                              
	      con = DriverManager.getConnection(url, user, password);      
	      sql = "select * from guestbook where gno=?";
	      pstmt = con.prepareStatement(sql); 
	      pstmt.setInt(1, no);                              
	      rs = pstmt.executeQuery();
	      
	      if (rs.next()){
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 수정폼</title>
<script src="../js/jquery.js"></script>
<script src="../js/guest.js"></script>
</head>
<body>
	<form method="post" action="guest_edit_ok.jsp" onsubmit="return check();">
	<input type = "hidden" name = "gno" value = "<%=no%>">
	<%--hidden은 브라우저 주소창에 만들어지지 않지만 gno 네임피라미터 이름에 value속성값을 담아서 전달할 때 유용하게 사용한다. 이때 전달되는 번호값은 문자열 타입이다. 하지만 페이지 소스보기에서는 노출된다. 그러므로 보안상 중요한 비번같은 데이터는 히든으로 전달하지 않는다. --%>
		<table border = "1">
			<tr>
				<th colspan="2">jsp 방명록 글수정폼</th>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input name="gname" id="gname" size="14" value = "<%=rs.getString("gname")%>"></td>
			</tr>
			
			<tr>
				<th>글제목</th>
				<td><input name="gtitle" id="gtitle" size="36" value = "<%=rs.getString("gname")%>"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="gpwd" id="gpwd" size="14"></td>
			</tr>
			
			<tr>
				<th>글 내용</th>
				<td>
				<textarea name="gcont" id="gcont" rows="10" cols="36">
					<%=rs.getString("gcont")%>
				</textarea>
				<%--textarea에는 value속성이 없다. --%>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="방명록 수정">
					<input type="reset" value="취소" onclick="$('#gname').focus();">
				</th>
			</tr>
			
		</table>
	
	</form>
</body>
</html>



<%}
	}catch (Exception e){e.printStackTrace();}
	finally {
		try{
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(Exception e){e.printStackTrace();}
	}
%>