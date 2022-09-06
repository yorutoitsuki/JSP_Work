<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 관리 프로그램</title>
</head>

<script type="text/javascript">
	//유효성 검사 - 값이 비었는지
	function check() { //function = 함수 = 메서드
		/* 방법 2, type = "submit"인 경우*/
		if(f.memno.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("회원번호를 입력해주세요");//알림창
			f.memno.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.name.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("회원이름을 입력해주세요");//알림창
			f.name.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.address.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("주소를 입력해주세요");//알림창
			f.address.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.gender[0].checked == false && f.gender[1].checked){//JavaScript "" '' 둘다 문자열 취급
			alert("성별을 입력해주세요");//알림창
			//f.gender.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요");
			f.tel1.focus();
			return false;
		}
		else if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요");
			f.tel2.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		else if(f.tel3.value == ""){
			alert("전화번호를 입력해주세요");
			f.tel3.focus();
			return false;
		}
		else {
			//f.submit(); 생략가능
			return true;//type = "submit" 또는 "reset"인 경우 true값을 리턴하면 데이터 전송됨
			//즉, 리턴값을 false로 주면 데이터 전송이 안되고 true를 줘야 전송됨
		}
	}
</script>

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
		<form action="insertPro.jsp" name="f" method="post">
			<table width="500px">
				<tr>
					<th>회원번호</th>
					<td>
						<%-- <input type="text" name="memno" value="<%=memno%>" size="10" maxlength="4" readonly="readonly">자동입력 --%>
						<input type="text" name="memno" value="<%=rs.getString(1)%>"
						size="10" maxlength="4" readonly="readonly">자동입력
					</td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="name" value="" size="15"
						maxlength="30"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="" size="40"
						maxlength="100"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						<%-- <input type="text" name="hiredate" value="<%=hiredate %>" size="10" maxlength="15" readonly="readonly">자동입력 --%>
						<input type="text" name="hiredate" value="<%=rs.getString(2)%>"
						size="10" maxlength="15" readonly="readonly">자동입력
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="M"size="10" maxlength="">남자</label>
						<label><input type="radio" name="gender" value="F" size="10" maxlength="">여자</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel1" value="" size="10"
						maxlength="">- <input type="text" name="tel2" value=""
						size="10" maxlength="">- <input type="text" name="tel3"
						value="" size="10" maxlength=""></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<!-- 방법2 type = "submit"인 경우 : 회원등록 클릭하면 insertPro.jsp 로 입력하면
						이때, return값을 false로 주면 전송이 안되고 true를 줘야 전송됨
						그래서 function check()에서 f.submit();가 없어도 전송됨 --> 
						<input type="submit" value="회원등록" onclick="check();">
						<!-- submit 타입에서는 f.submit() 같이 하지 않아도 됨 -->
						<input type="button" value="조회" onclick="location.href=">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
	<!-- dbcon.jsp(DB 연결 해제) -->
</body>
</html>