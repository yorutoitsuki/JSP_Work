<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" src = "javaScript.js"></script>
<body>
	<%@include file="Header.jsp"%>
	<%
	String custno = request.getParameter("custno");
	sql = "select to_char(joindate,'yyyy-mm-dd'),a.* from member_tbl_02 a where custno = " + custno;
	rs = stmt.executeQuery(sql);
	String custName = "";
	String phone = "";
	String address = "";
	String joindate = "";
	String grade = "";
	String city = "";
	
	if(rs.next()){
		joindate = rs.getString(1);
		custName = rs.getString(3);
		phone = rs.getString(4);
		address = rs.getString(5);
		grade = rs.getString(7);
		city = rs.getString(8);
	}
	%>

	<section>
		<div>
			<h2>홈쇼핑 회원 수정</h2>
		</div>
		<form action="UpdatePro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>회원번호</th>
					<td><input type="text" value="<%=custno %>" name="custno" size="6" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" value="<%=custName %>" name="custname" size="20"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" value="<%=phone %>" name="phone" size="13"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" value="<%=address %>" name="address" size="60"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" value="<%=joindate %>" name="joindate" size="10" readonly="readonly"></td>
				</tr>
				<tr>
					<th>고객등급[A:LVIP,B:일반,C:직원]</th>
					<td><input type="text" value="<%=grade %>" name="grade" size="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" value="<%=city %>" name="city" size="2"></td>
				</tr>
				<tr>
					<td colspan="2" class="buttonTd">
						<button type="button" onclick="check();">수정</button>
						&nbsp;
						<button type="button" onclick="location.href='Select.jsp'">조회</button>
					</td>
				</tr>
				
			</table>
		</form>
	</section>
	<%@include file="Footer.jsp"%>
</body>
</html>