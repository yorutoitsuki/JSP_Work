<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리 프로그램</title>
</head>
<body>
	<!-- dbcon.jsp(DB 연결) -->
	<%@ include file="header.jsp" %> 
	<%
	/* 빈 구문객체 -1, Statment 구문객체 사용 : select => 반드시 결과로 ResultSet*/
	%>
	
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<table>
			<tr>
				<th>회원번호</th>
				<td>
					<input type="text" name="mno" value="" size="10" maxlength="4" readonly="readonly">자동입력
				</td>
			</tr>
			<tr>
				<th>회원이름</th>
				<td>
					<input type="text" name="name" value="" size="15" maxlength="30">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="address" value="" size="40" maxlength="100">
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>
					<input type="text" name="hiredate" value="" size="10" maxlength="15" readonly="readonly">자동입력
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="M" size="10" maxlength="">남자</label>
					<label><input type="radio" name="gender" value="F" size="10" maxlength="">여자</label>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="tel1" value="" size="10" maxlength="">-
					<input type="text" name="tel2" value="" size="10" maxlength="">-
					<input type="text" name="tel3" value="" size="10" maxlength="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit">
					<input type="submit">
				</td>
			</tr>
		</table>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- dbcon.jsp(DB 연결 해제) -->
</body>
</html>