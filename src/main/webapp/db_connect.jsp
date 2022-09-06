<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  한글 처리가 제대로 되기 위해서는 "클라이언드(브라우저) 문자처리방식 과 서버에서 문자처리 방식이 동일해야함
톰켓 서버 (기본 : UTF-8)로 전송되는 한글 파라미터 값이 제대로 처리되기 위해 인코딩 방식을 UTF-8로 지정 -->


<%@ page import = "java.sql.*" %>

<%
	//post 방식의 한글 깨짐 방지를 위해(get 방식은 안해도 됨)
	request.setCharacterEncoding("UTF-8");

	//1. 오라클 드라이버 로딩 
	Class.forName("oracle.jdbc.OracleDriver");
	//throws ClassNotFoundException 예외발생 가능성 있으므로 해줘야 함, 실기에서는 생략
	
	//2. Connection 객체 생성 : rt.jar(java.sql.*)안에 아래 클래스 파일들이 있음
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
	
	
	//------------------------옵션(싱글톤)----------------------------------------
	/*
	Statement 객체 는 메모리에 동적 생성
	- 서버 에서 DB로 넘겨주는 SQL문은 단순 문자열 이기 때문에 DMBS가 그 "SQL 문자열"을 쿼리문으로 컴파일 하느라 오래 걸림
	- select(조회)일 때 사용하면 개발자 입장에서 편리
	*/
	
	/*
	PreparedStatement 객체 는 메모리에 상주(static)
	-SQL문자열을 컴파일된 채로 DBMS에게 넘겨주기 때문에 Statement보다 속도가 빠르다.
	-insert(추가), update(수정), delete(삭제) 일 때 사용하면 편리
	*/
	
	//3. 구문 객체 생성
	Statement stmt = con.createStatement();//SQL문이 없는 빈 구문객체 생성
	PreparedStatement ps = null;//참조하는 객체 없다. SQL문이 있어야 생성이 가능함, PreparedStatement는 SQL문이 있어야 객체 생성 가능
	
	//4. 결과셋 선언 : select(조회) 결과로 ResultSet 리턴 받음
	ResultSet rs = null;
	
	String sql = "";
%>
