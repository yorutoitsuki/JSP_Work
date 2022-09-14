<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="DB_conn.jsp" %>
<%
	try{
		sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("custno"));
		ps.setString(2, request.getParameter("custname"));
		ps.setString(3, request.getParameter("phone"));
		ps.setString(4, request.getParameter("address"));
		ps.setString(5, request.getParameter("joindate"));
		ps.setString(6, request.getParameter("grade"));
		ps.setString(7, request.getParameter("city"));
		
		ps.executeUpdate();
		
		%>
		<script type="text/javascript">
			alert("회원등록이 완료되었습니다");
			location.href='Select.jsp';
		</script>
		<%
	}catch(Exception e){
		%>
		<script type="text/javascript">
			alert("회원등록이 실패하였습니다");
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



































