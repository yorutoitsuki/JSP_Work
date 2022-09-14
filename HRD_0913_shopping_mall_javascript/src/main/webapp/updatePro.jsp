<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 중요 : DB 연결 파일 포함 -->
<%@ include file = "db_connect.jsp" %>
<!-- include file = ""; 컴파일 전에 소스 그래도 복사하여 포함시킴(인라인) -->

<%
	try{
		sql = "update member set name = ?, address = ?, hiredate = ?, gender = ?, tel1 = ?, tel2 = ?, tel3 = ? where memno = ?";
		
		//sql문을 매개값으로 PrepareStatement 객체 생성
		ps = con.prepareStatement(sql);
		
		//회원 번호는 제일 끝(8)으로 변경됨
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("address"));
		ps.setString(3, request.getParameter("hiredate"));
		ps.setString(4, request.getParameter("gender"));
		ps.setString(5, request.getParameter("tel1"));
		ps.setString(6, request.getParameter("tel2"));
		ps.setString(7, request.getParameter("tel3"));
		ps.setString(8, request.getParameter("memno"));
		
		ps.executeUpdate();//업데이트 성공하면 1 리턴받음, 실패하면 예외객체 생성
		%>
			<script type="text/javascript">
				alert("회원수정이 완료되었습니다");
				location.href = "selectMember.jsp";//주의, 반드시 문제 확인 필요
			</script>
		
		<%
		}catch(Exception e) {//실패 : 예외객체가 생성되어 이것을 잡아서 처리
		//실패 알림창
		%>
		<script type="text/javascript">
			alert("회원수정이 실패하였습니다");
			//location = "insert.jsp"; 도 가능함
			//location.href = "insert.jsp";
			history.back();//뒤로가기, //history.go(-1), 한칸뒤로, history.go(1) 한칸 앞으로
		</script>
	
		<%
		
		} finally{//예외 발생여부에 관계없이 무조건 실행(DB연결 해제)
		//footer.jsp에서 복사
			try{
				if(con != null){
					con.close();
				}
				if(stmt != null){
					stmt.close();
				}
				if(ps != null){
					ps.close();
				}
				if(rs != null){
					rs.close();
				}
			}
			catch(Exception e){
				
			}
		}
	%>
















