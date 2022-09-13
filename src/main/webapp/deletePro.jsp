<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 중요 : DB 연결 파일 포함 -->
<%@ include file = "db_connect.jsp" %>
<!-- include file = ""; 컴파일 전에 소스 그래도 복사하여 포함시킴(인라인) -->

<%
	try{
		String memno = request.getParameter("memno");
		sql = "delete from member where memno = '" + memno + "'";
		
		sql = "delete from member where memno = ?";
		ps = con.prepareStatement(sql);
		
		//sql문을 매개값으로 PrepareStatement 객체 생성
		ps = con.prepareStatement(sql);
		ps.executeUpdate();
		%>
			<script type="text/javascript">
				alert("삭제가 완료되었습니다");
				location.href = "selectMember.jsp";//주의, 반드시 문제 확인 필요
			</script>
		
		<%
		}catch(Exception e) {//실패 : 예외객체가 생성되어 이것을 잡아서 처리
		//실패 알림창
		%>
		<script type="text/javascript">
			alert("회원삭제가 실패하였습니다");
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
















