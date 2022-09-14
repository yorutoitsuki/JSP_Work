<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리 프로그램</title>
</head>

<script type="text/javascript" src="check.js">
	function reWrite() {
		var x = confirm("다시 작성 하시겠습니까?");
		if(x == true) {
			f.reset();
			f.name.select();
		}
		//f.name.focus();
		
		//f.reset();
		//f.name.focus();//글자는 그대로 있고 커서가 깜빡거림
		//f.name.select();//글자에 블럭이 설정되어 입력하면 바로 덮어씌워짐
	}
</script>

<body>
	<!-- dbcon.jsp(DB 연결) -->
	<%@ include file="header.jsp" %> 
	<%
	String memno = request.getParameter("memno");
	sql = "select memno, name, address, ";
	sql += "to_char(hiredate,'yyyy-mm-dd') as hiredate, ";
	sql += "gender, ";
	sql += " tel1 , tel2 , tel3 ";
	/*NVL(tel1,'') null로 출력됨*/
	sql += "from MEMBER ";
	sql += "where memno = '" + memno + "'";
	
	rs = stmt.executeQuery(sql);
	String name = "";
	String address = "";
	String gender = "";
	String hiredate = "";
	String tel1 = "";
	String tel2 = "";
	String tel3 = "";
	
	if(rs.next()) {
		name = rs.getString("name");
		address = rs.getString("address");
		gender = rs.getString("gender");
		hiredate = rs.getString("hiredate");
		tel1 = rs.getString("tel1");
		//JAVA로 Null 처리
		if(tel1 == null){
			tel1 = "";
		}
		tel2 = rs.getString("tel2");
		if(tel2 == null){
			tel2 = "";
		}
		tel3 = rs.getString("tel3");
		if(tel3 == null){
			tel3 = "";
		}
	}
	%>
	
	<section>
		<div>
			<h2>회원수정</h2>
		</div>
		<form action="updatePro.jsp" name="f" method="post">
			<table width="500px">
				<tr>
					<th>회원번호</th>
					<td>
						<%-- <input type="text" name="memno" value="<%=memno%>" size="10" maxlength="4" readonly="readonly">자동입력 --%>
						<input type="text" name="memno" value="<%=memno%>"
						size="10" maxlength="4" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="name" value="<%=name%>" size="15"
						maxlength="30"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address%>" size="40"
						maxlength="100"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<%-- <input type="text" name="hiredate" value="<%=hiredate %>" size="10" maxlength="15" readonly="readonly">자동입력 --%>
						<input type="text" name="hiredate" value="<%=hiredate%>"
						size="10" maxlength="15" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="M" 
						<%if(gender!= null && gender.equals("M")){out.print("checked='checked'");} %>>남자</label>
						
						<%-- <label><input type="radio" name="gender" value="F" 
						<%if(gender!= null && gender.equals("F")){out.print("checked");} %>>여자</label> --%>
						
						<%-- <label><input type="radio" name="gender" value="F" 
						<%=gender!=null && gender.equals("F")?"checked":""%>>여자</label> --%>
						
						<!-- jsp 파일 -> 서블릿(=java파일)으로 변경 -> class로 -->
						<label><input type="radio" name="gender" value="F" 
						<%out.print(gender!=null && gender.equals("F")?"checked":"");%>>여자</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="tel1" value="<%=tel1%>" size="10" maxlength="">- 
						<input type="text" name="tel2" value="<%=tel2%>" size="10" maxlength="">- 
						<input type="text" name="tel3" value="<%=tel3%>" size="10" maxlength="">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원수정" onclick="check(); return false;">
						<input type="reset" value="다시쓰기1">
						<input type="button" value="다시쓰기2" onclick="reWrite();">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- dbcon.jsp(DB 연결 해제) -->
</body>
</html>

<!-- 
	button 태그 : HTML4.0 표준부터 지원
	button과 input의 차이점
	
	1. button, 기본 : type = "submit"
	2. button type = "button"
	3. button type = "reset"
	
	<button>과 <input>의 차이점
	1.<input type = "reset" value = "1-초기화">
	
	2.<button type = "reset">
		<img src = "button.png"/> 
		<span>자식 태그<span>
	  </button>
 -->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 