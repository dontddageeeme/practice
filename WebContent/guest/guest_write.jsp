<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>방명록 글쓰기 폼</title>
<script src="../js/jquery.js"></script>
<script src="../js/guest.js"></script>
</head>
<body>
	<form method="post" action="guest_write_ok.jsp" onsubmit="return check();">
		<table border = "1">
			<tr>
				<th colspan="2">jsp 방명록 글쓰기폼</th>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td><input name="gname" id="gname" size="14"></td>
			</tr>
			
			<tr>
				<th>글제목</th>
				<td><input name="gtitle" id="gtitle" size="36"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="gpwd" id="gpwd" size="14"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
				<textarea name="gcont" id="gcont" rows="10" cols="36"></textarea>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="방명록저장">
					<input type="reset" value="취소" onclick="$('#gname').focus();">
				</th>
			</tr>
			
		</table>
	
	</form>
</body>
</html>