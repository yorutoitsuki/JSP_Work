<%@page import="java.text.DecimalFormat"%>
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
			<h2>매출조회</h2>
			<table width = 90%>
				<tr>
					<th>등급</th>
					<th>회원번호</th>
					<th>이름</th>
					<th>구입액</th>
				</tr>
				<%
				sql  = "select memgrade, memno, name, hap ";
				//DECODE(memgrade, 1, 'VIP', 2, 'Gold', 3, 'Silver', 4, 'Normal') as memgrade
				sql += "from grade, (select memno, name, hap ";
				sql += "from member join   ";
				sql += "(select memno , sum(money) as hap ";
				sql += "from (select memno, (price*bno) as money from buy) ";
				sql += "group by memno) ";
				sql += "using(memno)) ";
				sql += "where loprice<= hap and hap <= hiprice ";
				sql += "order by hap desc";
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					String grade = "";
					switch(rs.getString(1)){
					case"1":
						grade = "VIP";
						break;
					case"2":
						grade = "Gold";
						break;
					case"3":
						grade = "Silver";
						break;
					case"4":
						grade = "Normal";
						break;
					}
					
					DecimalFormat df = new DecimalFormat("###,###");
					String hapComma = df.format(rs.getDouble("hap"));
					
				%>
				<tr align="center">
					<%-- <td><%=rs.getString(1)%></td> --%>
					<td><%=grade%></td>
					<td><%=rs.getString("memno")%></td>
					<td><%=rs.getString("name")%></td>
					<td><%=hapComma%></td>
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