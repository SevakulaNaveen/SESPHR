<%@ include file="connect.jsp" %>
<%


   		try {
	   	   Random rr = new Random();
		   String str="";
		
						str = 	String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf((char)(rr.nextInt(26)+'a'))
								+ String.valueOf(rr.nextInt(10))
								+ String.valueOf((char)(rr.nextInt(26)+'a'));
								
	  
	  
	String id=request.getParameter("id");
	
	Statement st=connection.createStatement();
	String query1="update hkas_key_req set en_key='"+str+"', key_permission='Requested' where id='"+id+"'";
	st.executeUpdate(query1);
	

	connection.close();
	out.print(str);
	response.sendRedirect("HK_En_Key_Requests.jsp");
}
catch(Exception e)
{
out.println(e);
}

%>
