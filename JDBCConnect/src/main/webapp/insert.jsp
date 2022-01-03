<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
  Connection conn=null;
  PreparedStatement pstmt=null;
  // insert 할땐 resultset 이 필요없음, statement도 preparedStatement 로 써야함  
  
  String url="jdbc:oracle:thin:@localhost:1521:orcl";
  //1521 DB서버로 접속 이 url이 무조건 있어야함 **
  String userid="ora_user";
  String passcode="human123";
  String sql="insert into student values('John',33,100)";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{
   Class.forName("oracle.jdbc.driver.OracleDriver"); // driver (ojdbc6.jar)
   conn=DriverManager.getConnection(url,userid,passcode); // db접속에 실패하면 null이 나옴
   pstmt=conn.prepareStatement(sql);
   pstmt.executeUpdate();  // insert 할때 필요한 실행코드
} catch(Exception e){
   e.printStackTrace();
} finally {
   if(pstmt!=null) pstmt.close();
   if(conn!=null) conn.close();
   request.getRequestDispatcher("new_student.jsp").forward(request,response);
}
%>
</body>
</html>