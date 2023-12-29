<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%


try 
{
	  
	String id=request.getParameter("id");
	String doctor=request.getParameter("doctor");
	String patient=request.getParameter("patient");
	String provider=request.getParameter("provider");
	
	
	ResultSet rs=connection.createStatement().executeQuery("select *from patient_details where patient_name='"+patient+"' and downer='"+provider+"' ");
	while(rs.next())
	{
		String sk=rs.getString(13);
		if(sk.equalsIgnoreCase("No"))
		{
			KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
						Cipher encoder = Cipher.getInstance("RSA");
						KeyPair kp = kg.generateKeyPair();
						Key pubKey = kp.getPublic();
						byte[] pub = pubKey.getEncoded();
						String pk = String.valueOf(pub);
						
	connection.createStatement().executeUpdate("update patient_details set desc_sk='"+pk+"' where patient_name='"+patient+"' and downer='"+provider+"' ");
	
connection.createStatement().executeUpdate("update patient_details_backup set desc_sk='"+pk+"' where patient_name='"+patient+"' and downer='"+provider+"'");

	connection.createStatement().executeUpdate("insert into hkas_transaction (user,patient,provider,doctor,status) values('HKAS', '"+patient+"','"+provider+"', '"+doctor+"' ,'"+pk+"')");
	connection.createStatement().executeUpdate("update key_request set sk='"+pk+"' where id='"+id+"'");
	
		response.sendRedirect("HK_Key_Requests.jsp");

	
		}
		else
		{
			String query1="update key_request set sk='"+sk+"' where id='"+id+"'";
			connection.createStatement().executeUpdate(query1);
			
			connection.createStatement().executeUpdate("insert into hkas_transaction (user,patient,provider,doctor,status) values('HKAS', '"+patient+"','"+provider+"', '"+doctor+"(Doctor)' ,'"+sk+"')");
			
				response.sendRedirect("HK_Key_Requests.jsp");

		}
	}
	
	
	
	connection.close();
}
catch(Exception e)
{
out.println(e);
}

%>
