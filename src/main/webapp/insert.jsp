<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리 프로그램</title>
</head>

<script type="text/javascript"></script>

<body>
	<!-- dbcon.jsp(DB 연결) -->
	<%@ include file="header.jsp" %> 
	<%
	/* 빈 구문객체 -1, Statment 구문객체 사용 : select => 반드시 결과로 ResultSet*/
	/*
		NVL (max(memno),0)이 NULL이 아니면 max(memno), null이면 0
		NVL (max(memno), 0) +1 
	*/
	
	//방법 1, 반드시 회원번호 4자리로 1001부터 시작해야한다면
	//sql = "select NVL(max(memno),1000)+1 from member";
	
	//방법 2, 반드시 회원번호 4자리라는 말이 없으면
	//sql = "select NVL(max(memno),0)+1 from member";
	//rs = stmt.executeQuery(sql);


	//빠른방법
	//rs.next();
	//String memno = rs.getString(1);//1010
	
	//정석적인 방법
	/*String memno = "";
	if(rs.next()){
		//memno = rs.getString(1);
		memno = rs.getString("memno");
	}*/
	
	//가입일을 오늘날짜로 자동입력
	//sql = "select to_char(sysdate,'yyyy-mm-dd') from dual";
	//rs = stmt.executeQuery(sql);
	//rs.next();
	//String hiredate = rs.getString(1);
	
	//sql = "select NVL(max(memno),0)+1 as memno, to_char(sysdate,'yyyy-mm-dd') as hirdate from member";
	sql = "select NVL(max(memno),0)+1,";
	sql += " to_char(sysdate,'yyyy-mm-dd')";
	sql += " from member";
	rs = stmt.executeQuery(sql);
	rs.next();
	//String memno = rs.getString(1);
	//String hiredate = rs.getString(2);
	
	%>
	
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		<table>
			<tr>
				<th>회원번호</th>
				<td>
					<%-- <input type="text" name="memno" value="<%=memno%>" size="10" maxlength="4" readonly="readonly">자동입력 --%>
					<input type="text" name="memno" value="<%=rs.getString(1)%>" size="10" maxlength="4" readonly="readonly">자동입력
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
					<%-- <input type="text" name="hiredate" value="<%=hiredate %>" size="10" maxlength="15" readonly="readonly">자동입력 --%>
					<input type="text" name="hiredate" value="<%=rs.getString(2) %>" size="10" maxlength="15" readonly="readonly">자동입력
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
				<td colspan="2" align="center">
					<input type="submit" value="회원등록">
					<input type="submit" value="조회">
				</td>
			</tr>
		</table>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- dbcon.jsp(DB 연결 해제) -->
</body>
</html>