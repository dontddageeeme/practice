<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");	//post로 전달되는 한글을 서버에서 받을 때 안 깨지게 해준다.
	
	int no = Integer.parseInt(request.getParameter("gno"));
	String gname = request.getParameter("gname");
	String gtitle = request.getParameter("gtitle");
	String gpwd = request.getParameter("gpwd");
	String gcont = request.getParameter("gcont");
	
	String driver = "oracle.jdbc.OracleDriver";            
   	String url = "jdbc:oracle:thin:@localhost:1521:XE";      
   	String user = "java";   
   	String password = "1234";   
   
   	Connection con = null;            
   	PreparedStatement pstmt = null;      
   	ResultSet rs = null;            
   	String sql = null; 
   	
   	try{
   		Class.forName(driver);
   		con = DriverManager.getConnection(url, user, password);
   		sql = "select * from guestbook where gno=?";
	   	 pstmt = con.prepareStatement(sql); 
	     pstmt.setInt(1, no);                              
	     rs = pstmt.executeQuery();
	     if(rs.next()){
	    	 if(!rs.getString("gpwd").equals(gpwd)){	//비번이 다르면
	    		 out.println("<script>");
	             out.println("alert('비번이 다릅니다~!');");
	             out.println("history.back();");	//뒤로 한칸 이동
	             out.println("</script>");
	    	 }else{
	    		 /*문제) 비번이 같으면 번호를 기준으로 글쓴이,글제목,글내용만 수정되게 update쿼리문 수행후 리턴값 1을 받아서 if조건문으로 '방명록 수정되었습니다'; 라는 alert() 경고창을 띄운다음 방명록 목록보기로 이동되게 만들자.*/
	    		 sql = "update guestbook set gname=? ,gtitle=?, gcont=? where gno=?";
	    		 pstmt = con.prepareStatement(sql);
	    		 pstmt.setString(1,gname);	//쿼리문의 첫번째 물음표에 문자열로 수정할 글쓴이를 저장
	    		 pstmt.setString(2,gtitle);
	    		 pstmt.setString(3,gcont);
	    		 pstmt.setInt(4,no);
	    		 
	    		 int re = pstmt.executeUpdate();		//수정 쿼리문 수행후 성공한 레코드의 행의 개수를 반환
	    		 
	    		 if(re==1){
	    			 out.println("<script>");
	    			 out.println("alert('방명록이 수정되었습니다.!');");
	    			 out.println("location='guest_list.jsp';");
	    			 out.println("</script>");
	    		 }
	    	 }//if else
	     }//if
	     
   	}catch (Exception e){e.printStackTrace();}
   	finally{
   		try{
   			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(Exception e){e.printStackTrace();}
   	}
	
%>