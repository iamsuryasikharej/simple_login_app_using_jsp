<%@ page import="java.sql.*"%>
<%!
String name;
int mobilenumber;
Connection con;
%>
<%!
boolean checkPresent(String name,int mobile) throws Exception
{
	String query="SELECT * FROM EMPLOYEE_INFO WHERE ENAME=? AND EMOB=? ";
	PreparedStatement pst=con.prepareStatement(query);
	pst.setString(1, name);
	pst.setInt(2,mobile);
	ResultSet rs=pst.executeQuery();
	
	return rs.next();
}
%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/employee";
String user="root";
String pwd="durga";
con=DriverManager.getConnection(url,user,pwd);
name=request.getParameter("ename");
mobilenumber=Integer.parseInt(request.getParameter("enum"));
if(checkPresent(name, mobilenumber))
{	
%>
<%= "ALREADY PRESENT IN OUR DB" %>
<% }
 else{
	 String sqlQuery="INSERT INTO EMPLOYEE_INFO VALUES(ENAME=?,EMOB=?)";
	 PreparedStatement st=con.prepareStatement(sqlQuery);
	 st.setString(1, name);
	 st.setInt(2,mobilenumber);
	 boolean rs= st.execute();
	 out.print(rs);
 }%>
