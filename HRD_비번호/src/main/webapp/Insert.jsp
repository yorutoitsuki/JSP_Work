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
	sql = "select NVL(max(custno),0)+1, to_char(sysdate,'yyyymmdd') from member_tbl_02";
	rs = stmt.executeQuery(sql);
	String custno = "";
	String joindate = "";
	if(rs.next()){
		custno = rs.getString(1);
		joindate = rs.getString(2);
	}
	%>

	<section>
		<div>
			<h2>홈쇼핑 회원 등록</h2>
		</div>
		<form action="insertPro.jsp" name="f" method="post">
			<table>
				<tr>
					<th>회원번호 (자동발생)</th>
					<td><input type="text" value="<%=custno %>" name="custno" maxlength="6" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" value="" size="20" maxlength="20" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" value="" size="13" maxlength="13" name="phone">('-'포함)</td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" value="" size="60" maxlength="60" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" value="<%=joindate %>" size="10" name="joindate" readonly="readonly"></td>
				</tr>
				<tr>
					<th>고객등급[A:LVIP,B:일반,C:직원]</th>
					<td><input type="text" value="" name="grade" size="1" maxlength="1"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" value="" name="city" size="2" maxlength="2"></td>
				</tr>
				<tr>
					<td colspan="2" class="buttonTd">
						<button type="button" onclick="check();">등록</button>
						&nbsp;
						<button type="button" onclick="location.href='Select.jsp';">조회</button>
					</td>
				</tr>
				
			</table>
		</form>
	</section>
	<%@include file="Footer.jsp"%>
</body>
</html>