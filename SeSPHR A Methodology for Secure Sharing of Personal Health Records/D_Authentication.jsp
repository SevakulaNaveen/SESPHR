
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<%
	String name = request.getParameter("userid");
	String pass = request.getParameter("pass");
			application.setAttribute("docname",name);
	String wait="Waiting";
try {
		String sql = "SELECT * FROM doctor where name='"+name+"' and pass='"+pass+"'";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next())
		{
			String role=rs.getString(13);
				application.setAttribute("role",role);
				
			String sql1 = "SELECT * FROM doctor where name='" + name+ "' and pass='" + pass + "' and status='Authorized' ";
			ResultSet rs1 = stmt.executeQuery(sql1);
			if (rs1.next())
			{
			
				response.sendRedirect("D_Main.jsp");
			}
			else
			{
				
				response.sendRedirect("D_autho.jsp");
			}		
		}	
		else
		{
			response.sendRedirect("wronglogin.html");
		}
	}
	catch (Exception e)
	{
		out.print(e);
		e.printStackTrace();
	}%>

