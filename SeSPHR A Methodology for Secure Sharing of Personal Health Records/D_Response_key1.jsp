<title>Search Token Request</title>
<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>
<%
   	String doctor=(String)application.getAttribute("docname");
	String provider=(String)request.getParameter("provider");
	String patient=(String)request.getParameter("patient");
	
	String msg="";
	try
	{
		ResultSet r=connection.createStatement().executeQuery("select * from patient_details where downer='"+provider+"' and patient_name='"+patient+"'");
		if(r.next())
		{
			String sql = "SELECT * FROM key_request where doctor='"+doctor+"' and provider='"+provider+"' and patient_name='"+patient+"' ";
			Statement stmt = connection.createStatement();
			ResultSet rs1 = stmt.executeQuery(sql);
			if (rs1.next())
			{
				 msg=rs1.getString(5);
				if (msg.equalsIgnoreCase("Requested"))
				{
					msg="Please Wait For HKAS To Generate Key !!";
					application.setAttribute("msg",msg);
					response.sendRedirect("D_Response_key.jsp");
				}			
				else 
				{
					response.sendRedirect("D_Response_key.jsp");
					application.setAttribute("msg",msg);
				}
			
			
			}
			else
			{
						msg="You Have Not Requested For Key !!";
						response.sendRedirect("D_Response_key.jsp");
						application.setAttribute("msg",msg);
			}
		}
		else
		{
					msg="File Does not Exists !!";
					response.sendRedirect("D_Response_key.jsp");
					application.setAttribute("msg",msg);
		}	
	}
	catch(Exception e)
	{
	out.print(e);
	}
%>