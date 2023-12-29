<%@ include file="connect.jsp" %>
<%


   		try {
	   	  
								
	  
	  
	String id=request.getParameter("id");
	
	Statement st=connection.createStatement();
	String query1="update hkas_key_req set  key_permission='Permitted' where id='"+id+"'";
	st.executeUpdate(query1);
	
	
	
	connection.close();
	response.sendRedirect("HK_En_Key_Requests.jsp");
}
catch(Exception e)
{
out.println(e);
}

%>
