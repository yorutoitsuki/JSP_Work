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
		/* 방법 2, type = "submit", type = "button"인 경우*/
		/* if(!f.memno.value){//JavaScript "" '' 둘다 문자열 취급
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
			f.submit();
			//return true;//type = "submit" 또는 "reset"인 경우 true값을 리턴하면 데이터 전송됨
			//즉, 리턴값을 false로 주면 데이터 전송이 안되고 true를 줘야 전송됨
		} */
	
	
		/* 방법 2, type = "submit", type = "button"인 경우*/
		if(!f.memno.value){//JavaScript "" '' 둘다 문자열 취급
			alert("회원번호를 입력해주세요");//알림창
			return f.memno.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.name.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("회원이름을 입력해주세요");//알림창
			return f.name.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.address.value == ""){//JavaScript "" '' 둘다 문자열 취급
			alert("주소를 입력해주세요");//알림창
			return f.address.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.gender[0].checked == false && f.gender[1].checked){//JavaScript "" '' 둘다 문자열 취급
			alert("성별을 입력해주세요");//알림창
			//f.gender.focus();
			return false;//false로 주면 데이터 전송이 안됨
		}
		if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요");
			return f.tel1.focus();
		}
		if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요");
			return f.tel2.focus();//false로 주면 데이터 전송이 안됨
		}
		if(f.tel3.value == ""){
			alert("전화번호를 입력해주세요");
			return f.tel3.focus();
		}
		f.submit();
		//return true;//type = "submit" 또는 "reset"인 경우 true값을 리턴하면 데이터 전송됨
		//즉, 리턴값을 false로 주면 데이터 전송이 안되고 true를 줘야 전송됨
	}//check()끝
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
	/* sql = "select NVL(max(memno),0)+1,";
	sql += " to_char(sysdate,'yyyy-mm-dd')";
	sql += " from member";
	rs = stmt.executeQuery(sql);
	rs.next(); */
	//String memno = rs.getString(1);
	//String hiredate = rs.getString(2);
	
	sql = "select NVL(max(memno),0)+1, to_char(sysdate,'yyyy-mm-dd') from member";
	rs = stmt.executeQuery(sql);
	rs.next();
	
	
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
						<label><input type="radio" name="gender" value="M">남자</label>
						<label><input type="radio" name="gender" value="F">여자</label>
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
						<!-- submit 과 button 차이점 
						1. submit은 서버로 바로 전송하는 기능이 있고, action을 찾아감.
						또한 일반적으로 스크립트를 사용하지 않고 전송함
						
						2. button은 전송하는 기능 이 없으므로 자바스크립트의 이용하여 전송
						이용하는 함수는 submit()
						-->
						
						<!-- 방법2 type = "submit"인 경우 : 회원등록 클릭하면 insertPro.jsp 로 입력하면
						이때, return값을 false로 주면 전송이 안되고 true를 줘야 전송됨 --> 
						
						<!-- 통합 -->
					<!--<input type="submit" value="3.회원등록" onclick="check(); return false;">
						<input type="button" value="6.회원등록" onclick="check(); return false;"> -->
						
						<!-- 1 차이점 : 유효성 체크없이 바로 전송함 -->
						<input type="submit" value="1.회원등록">
						<!-- 2 차이점 : 유효성체크는 하되, 유효성 결과와 상관없이 전송 함 -->
						<input type="submit" value="2.회원등록" onclick="check();">
						<!-- 3 유효성 체크는 하되, 마지막에 리턴 폴스를 주어서 전송 못 하게 막음, JSP에서 별도로 전송을 행함-->
						<input type="submit" value="3.회원등록" onclick="check(); return false;">
						
						<!-- 1 차이점 : 유효성 체크도 없고, 전송도 안됨 
							-->
						<input type="button" value="4.회원등록">
						<!-- 2 차이점 : 유효성체크는 하되, 전송 기능은 없음
							고로 전송을 위해서는 반드시 자바스크립트의 함수를 이용해야함
							(예)check(){f.submit()} -->
						<input type="button" value="5.회원등록" onclick="check();">
						<!-- 3 -->
						<input type="button" value="6.회원등록" onclick="check(); return false;">
						
						<button>7.회원등록</button>
						<!-- 기본 타입 submit -->
						
						<input type="reset" value="1.초기화">
						<button type="reset">2.초기화</button>
						
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 