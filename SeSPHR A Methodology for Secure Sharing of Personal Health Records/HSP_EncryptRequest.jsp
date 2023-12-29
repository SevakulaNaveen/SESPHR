<%@ include file="connect.jsp" %>
<%

try
{
	String provider=(String)application.getAttribute("pname");
	Statement st=connection.createStatement();
	String query1="insert into  hkas_key_req (provider,patient_name,en_key,key_permission) values ('"+provider+"','No','Requested','No')";
	st.executeUpdate(query1);
		response.sendRedirect("HSP_AddPatient.jsp");

	connection.close();
}
catch(Exception e)
{
out.println(e);
}

%>
