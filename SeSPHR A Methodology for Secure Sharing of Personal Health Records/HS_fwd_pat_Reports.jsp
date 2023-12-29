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
	
	String query1="update patient_reports set status='Forwarded' where id='"+id+"'";
	connection.createStatement().executeUpdate(query1);
	
	response.sendRedirect("HS_Clinical_Reports.jsp");


	connection.close();
}
catch(Exception e)
{
out.println(e);
}

%>
