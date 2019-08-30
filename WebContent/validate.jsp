
<%@ page import="java.sql.*" %>
<%!


String username;
int mobilenumber;
%>
<%
Class.forName("com.mysql.jdbc.Driver");
username=request.getParameter("uname");
mobilenumber=Integer.parseInt(request.getParameter("umob"));
%>
<%
String url="jdbc:mysql://localhost:3306/employee";
String user="root";
String password="durga";
Connection con=DriverManager.getConnection(url,user,password);

String url1="SELECT * FROM EMPLOYEE_INFO WHERE ENAME=? AND EMOB=?";
PreparedStatement st=con.prepareStatement(url1);
st.setString(1, username);
st.setInt(2, mobilenumber);
ResultSet rs=st.executeQuery();
if(rs.next())
{
	session.setAttribute("state", "success");
	RequestDispatcher reqdis=request.getRequestDispatcher("/success.jsp");
	reqdis.forward(request, response);
	%>

<% }
 else 
{
	 session.setAttribute("state", "failure");
		RequestDispatcher reqdis=request.getRequestDispatcher("/failure.jsp");
		reqdis.forward(request, response);

	}
	%>


