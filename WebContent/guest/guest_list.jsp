<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String driver = "oracle.jdbc.OracleDriver";        
	String url = "jdbc:oracle:thin:@localhost:1521:XE";      
	String user = "java";  
	String password = "1234"; 
	
	Connection con=null; //데이터 베이스 연결 con
	PreparedStatement pstmt =null;	//쿼리문 수행
	ResultSet rs = null;	//검색 결과 자료를 저장할 rs
	String sql = null;		//쿼리문 저장 변수
	
	try {
	 
	      Class.forName(driver);                              //jdbc드라이버 클래스 로드
	      con = DriverManager.getConnection(url, user, password);      //메서드 인자값으로 db접속주소, 사용자, 비번을 전달해서 DB연결 후 con생성
	      sql = "select * from guestbook order by gno desc";
	      pstmt = con.prepareCall(sql); 
	      rs = pstmt.executeQuery();
		      
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 목록</title>
</head>
<body>
	<table border = "1">
		<tr>
			<th colspan = "5">방명록 목록보기</th>
		</tr>
		<tr>
			<th>번호</th> <th>글 제목</th> <th>글쓴이</th> <th>조회수</th> <th>등록날짜</th>
		</tr>
		
		<% while(rs.next()){%>
			<tr>
				<th><%= rs.getInt(1)%></th>
				<th><a href = "guest_cont.jsp?no=<%=rs.getInt(1)%>"><%=rs.getString("gtitle") %></a></th>
				<th><%=rs.getString("gname")%></th>
				<th><%=rs.getInt("ghit")%></th>
				<th><%=rs.getString("gdate").substring(0,10)%></th>
				<%--0이상 10미만 사이의 년월일만 반환 --%>
			</tr>
		<% }//while end %>
		<tr>
			<th colspan="5"><input type = "button" value="방명록 글쓰기" onclick="location='guest_write.jsp';"></th>
		</tr>
		
	</table>
</body>
</html>

<% }catch (Exception e){e.printStackTrace();}
	finally {
		try{
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(Exception e){e.printStackTrace();}
	}
%>