<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Request Key</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-quicksand.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style20 {
	color: #FF0000;
	font-size: 16;
}
.style23 {color: #666666; font-weight: bold;}
.style24 {font-size: 14px}
.style17 {font-size: 14; }
.style28 {font-size: 16px;
	font-weight: bold;
}
.style3 {font-size: 12px}
.style31 {font-size: 18px}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
       <h1><a href="index.html" class="style2">SeSPHR A Methodology for <br />
          Secure Sharing of Personal <br />
        Health Records in the cloud</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="D_Main.jsp"><span>Home</span></a></li>
          <li><a href="D_Login.jsp"><span>Logout</span></a></li>		 
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="935" height="293" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="935" height="293" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="935" height="293" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Request Key </span><span class="style38 style20"></span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="clr"></div>
          <div >
            <p align="justify">&nbsp;</p>
            <p>
              <%
try
	{
	
		String provider = request.getParameter("t142");
		String patient = request.getParameter("t14");
		String doc=(String)application.getAttribute("docname");
		String sk="";
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;
		
		
		String query1="select * from patient_details  where patient_name='"+patient+"' and downer='"+provider+"' "; 
		Statement st1=connection.createStatement();
		ResultSet rs1=st1.executeQuery(query1);
		if ( rs1.next())
		{
		
			String query="select * from key_request  where doctor='"+doc+"' and patient_name='"+patient+"' and provider='"+provider+"' "; 
			Statement st=connection.createStatement();
			ResultSet rs=st.executeQuery(query);
			if ( rs.next()==true)
			{
			
				sk=rs.getString(5);
				if(sk.equalsIgnoreCase("Requested"))
				{
					%>
			</p>
					<h3 class="style31">Request Already Sent To PHR Owner!</h3>
					<p class="style28">&nbsp;</p>
					<%
				}
				else
				{
					%>
					<h3 class="style31">Request Already Sent To PHR Owner!</h3>
					<p class="style28">&nbsp;</p>
					<%
				}		
			}
			else
			{
				String query4="insert into key_request(doctor,patient_name,provider,sk) values('"+doc+"','"+patient+"','"+provider+"','Requested')";
				connection.createStatement().executeUpdate(query4); 
				%>
				<h3 class="style31">Request Sent To PHR Owner!</h3>
				<p class="style28">&nbsp;</p>
				<p class="style28">
				<%
				
				connection.createStatement().executeUpdate("insert into hkas_transaction (user,patient,provider,doctor,status) values('"+doc+"(Doctor)', '"+patient+"','"+provider+"', 'HKAS' ,'Requested Key')");
			
			}
		}
		else
		{
			 
			%>
			<h3 class="style31">Patient Records Not Found !</h3>
			<p>&nbsp;</p>
			<p>
			<%
		
		}
		
		
		
		connection.close();
	} 
catch(Exception e)
{
out.println(e.getMessage());
}
	%></p>
            <p align="right"><a href="D_Main.jsp">Back</a></p>
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="D_Main.jsp">&raquo; Home </a></li>
            <li><a href="D_Login.jsp">&raquo; Logout </a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <p class="rf">&nbsp;</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
