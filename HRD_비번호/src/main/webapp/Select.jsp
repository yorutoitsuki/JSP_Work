<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@include file="Header.jsp"%>
	<%
	sql = "select to_char(joindate,'yyyy-mm-dd'), a.* from MEMBER_TBL_02 a";
	rs = stmt.executeQuery(sql);
	%>

	<section>
		<h2>회원 목록 조회/수정</h2>
		<table class="selectTable">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><a href="Update.jsp?custno=<%=rs.getString(2)%>"><%=rs.getString(2)%></a> </td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>


	<%@include file="Footer.jsp"%>
</body>
</html>