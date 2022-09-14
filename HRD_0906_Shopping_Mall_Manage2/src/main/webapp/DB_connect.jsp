<%@ page import="javax.naming.spi.DirStateFactory.Result"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"  %>

<%  
	request.setCharacterEncoding("UTF-8");
	try{
		Class.forName("Oracle.jdbc.OracleDriver");//대문자 소문자 구분
	}catch(Exception e){
		Class.forName("oracle.jdbc.OracleDriver");
	}
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	Statement stmt = con.createStatement();
	
	PreparedStatement ps = null;
	ResultSet rs = null;
%>