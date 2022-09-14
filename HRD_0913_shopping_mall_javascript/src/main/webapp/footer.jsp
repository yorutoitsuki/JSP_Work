<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<footer>
		<!-- 입력방법 1, 한글 자음 입력, 한자 입력  -->
		HRDKOREA Copyright&copy; 2019 All reserved
	</footer>
</body>
</html>
<!-- DB 연결 해제 -->
<!-- 변수에 오류가 생겨도 무시 : 향후 index.jsp에서 합칠 예정 -->

<%
	try{
		if(con != null){
			con.close();
		}
		if(stmt != null){
			stmt.close();
		}
		if(ps != null){
			ps.close();
		}
		if(rs != null){
			rs.close();
		}
	}
	catch(Exception e){
		
	}
%>