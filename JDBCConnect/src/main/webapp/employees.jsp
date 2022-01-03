<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;

String url="jdbc:oracle:thin:@localhost:1521:orcl";
String userid="ora_user";
String passcode="human123";
String sql=
			"select a.department_id as did,a.department_name as dname,"+
			"nvl(b.emp_name,'없오') as mname,nvl(c.department_name,'없오') as ddname"+
			" from employees b,departments a,departments c"+
			" where a.manager_id=b.employee_id(+) and "+
			"c.department_id(+)=a.parent_id order by a.department_id";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employees</title>
</head>
<body>
<style>
table {border-collapse:collapse;}
td {border:1px solid white; color:white; background-color:black;}
</style>
<table>
<tr><th>부서아이디</th><th>부서명</th><th>부서매니저이름</th><th>상위부서</th></tr>
<%
try{
	Class.forName("oracle.jdbc.driver.OracleDriver"); //driver (ojdbc6.jar)
	conn=DriverManager.getConnection(url,userid,passcode); // null if connection failed
	stmt=conn.createStatement(); //SQL문을 넣을 곳을 만들어라
	rs=stmt.executeQuery(sql); // SQL문 실행 결과를 rs에 담아라
	while(rs.next()){
		
// 		int eid=rs.getInt("employee_id");
// 		String ename=rs.getString("emp_name");
// 		int salary=rs.getInt("salary");
// 		int mid=rs.getInt("manager_id");
// 		int did=rs.getInt("department_id");
// 		String jobid=rs.getString("job_id");y

		int did=rs.getInt("did");
		String dname=rs.getString("dname");
		String mname=rs.getString("mname");
		String ddname=rs.getString("ddname");
%>
		<tr>
			<td><%=did%></td>
			<td><%=dname %></td>
			<td><%=mname %></td>
			<td><%=ddname%></td>
		</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(rs!=null) rs.close();
	if(stmt!=null) stmt.close();
	if(conn!=null) conn.close();
}
%>
</table>
</body>
</html>