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
	sql  = " select custno, custname, grade, hap";
	sql +=" from member_tbl_02 ";
	sql +=" join (	select custno, sum(price) as hap";
	sql +=" 		from money_tbl_02";
	sql +=" 		group by (custno))";
	sql +=" using (custno)";
	sql +=" order by hap desc";
	rs = stmt.executeQuery(sql);
	%>

	<section>
		<h2>회원 목록 조회/수정</h2>
		<table class="selectTable">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
			while (rs.next()) {
				String grade = "";
				switch(rs.getString("grade")){
				case "A":
					grade = "VIP";
					break;
				case "B":
					grade = "일반";
					break;
				case "C":
					grade = "직원";
					break;
				}
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=grade%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>


	<%@include file="Footer.jsp"%>
</body>
</html>