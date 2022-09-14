<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="DB_conn.jsp" %>
<%
	try{
		sql  = "update MEMBER_TBL_02";
		sql += " set custname = ?,";
		sql += " phone = ?,";
		sql += " address = ?,";
		sql += " grade = ?,";
		sql += " city = ?";
		sql += " where custno = ?";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("custname"));
		ps.setString(2, request.getParameter("phone"));
		ps.setString(3, request.getParameter("address"));
		ps.setString(4, request.getParameter("grade"));
		ps.setString(5, request.getParameter("city"));
		ps.setString(6, request.getParameter("custno"));
		
		ps.executeUpdate();
		
		%>
		<script type="text/javascript">
			alert("회원수정이 완료되었습니다");
			location.href = 'Select.jsp';
		</script>
		<%
	}catch(Exception e){
		%>
		<script type="text/javascript">
			alert("회원수정이 실패하였습니다");
			history.back();
		</script>
		<%
	} finally {
		try{
			if(con != null) con.close();
			if(stmt != null) ps.close();
			if(ps != null) stmt.close();
			if(rs != null) rs.close();
		}catch(Exception e){
			
		}
	}
%>



































