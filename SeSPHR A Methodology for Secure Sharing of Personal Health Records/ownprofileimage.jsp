<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Owner Profile</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("imgid"));
	String type=request.getParameter("type");
  	try{
	       
			Statement st=connection.createStatement();
			String strQuery = "select imagess from doctor where id="+id ;
			ResultSet rs = st.executeQuery(strQuery);
	
    	String imgLen="";
    	if(rs.next())
		{
      		imgLen = rs.getString(1);
     	}  
    	rs = st.executeQuery(strQuery);
    	if(rs.next())
		{
      		int len = imgLen.length();
		  	byte [] rb = new byte[len];
		  	InputStream readImg = rs.getBinaryStream(1);
		 	int index=readImg.read(rb, 0, len);  
		  	st.close();
		  	response.reset();
		  	response.getOutputStream().write(rb,0,len); 
		  	response.getOutputStream().flush();        
		}
  	}
  	catch (Exception e){
    	e.printStackTrace();
  	}
%>

</body>
</html>