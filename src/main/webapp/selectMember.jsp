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
	<section>
		<div>
			<h2>회원조회</h2>
			<table width = 90%>
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>가입일</th>
					<th>성별</th>
					<th>전화번호</th>
				</tr>
				<%
				sql = "select memno, name, address, ";
				sql += " to_char(hiredate,'yyyy.mm.dd.'), ";
				sql += " decode(gender,'M','남','F','여','불명'), ";
				sql += " tel1||'-'||tel2||'-'||tel3 ";
				sql += " from MEMBER";
				rs = stmt.executeQuery(sql);
				while(rs.next()){
				%>
				<tr align="center">
					<td>
						<!-- 링크를 사용한 Get 방식으로 요청 시 : "요청 URL?파라미터이름 = 파라미터 값 -->
						<a href = "update.jsp?memno=<%=rs.getString(1) %>"><%=rs.getString(1) %></a>
					</td>
					<%-- <td><%=rs.getString(1)%></td> --%>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6).equals("--")?"":rs.getString(6)%></td>
				</tr>
				<% 
				}
				%>
			</table>
		</div>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- dbcon.jsp(DB 연결 해제) -->
</body>
</html>