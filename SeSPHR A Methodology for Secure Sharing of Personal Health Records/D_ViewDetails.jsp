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
<title>Doctor</title>
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
.style24 {font-size: 14px}
.style25 {font-size: 16px}
.style28 {color: #FF0000}
.style29 {color: #FFFF00}
.style30 {
	font-size: 14px;
	color: #FFFF00;
	font-weight: bold;
}
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
          <h2><span>View Patient Details </span><span class="style38 style20"></span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="clr"></div>
          <div >
            <p align="justify">&nbsp;</p>
            <table width="612" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
			 <tr>
                <td width="36" height="30" bgcolor="#FF0000"><div align="center" class="style24 style29"><strong> ID </strong></div></td>
                <td width="120" bgcolor="#FF0000"><div align="center" class="style30">Patient Name </div></td>
                <td width="122" bgcolor="#FF0000"><div align="center" class="style30">Provider Name </div></td>
                <td width="134" bgcolor="#FF0000"><div align="center" class="style30">Hospital</div></td>
                <td width="95" bgcolor="#FF0000"><div align="center" class="style30">Doctor</div></td>
                <td width="91" bgcolor="#FF0000"><div align="center" class="style30">View  </div></td>
              </tr>
              <%	  
			  
			  String doctor=(String)application.getAttribute("docname");
			  ArrayList al=new ArrayList();
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		String strr="select * from hs_access_req where (doc_per='Permitted' || details_per='Permitted') and doctor='"+doctor+"'";
		Statement stt=connection.createStatement();
		ResultSet r=stt.executeQuery(strr);
		while(r.next())
		{
			String pati=r.getString(3);
			String provid=r.getString(4);
			String doc_per=r.getString(5);
			String details_per=r.getString(6);
			
			al.add(pati);
		
				%>
             
              <%

				String query="Select *from patient_details where patient_name='"+pati+"' and downer='"+provid+"'  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(17);
					s4=rs.getString(18);
					s5=rs.getString(11);
					s6=rs.getString(15);
					
					%>
                  <form id="form1" name="form1" method="post" action="D_ViewDetails1.jsp">
              <tr>
                <td height="28"><div align="center"><%=i%></div></td>
                <td><div align="center"><%=s2%></div></td>
                <td><div align="center"><%=s6%></div></td>
                <td><div align="center"><%=s3%></div></td>
                <td><div align="center"><%=s4%></div></td>
                <td><div align="center">
					<input type="hidden" name="doc_per" value="<%=doc_per%>" />
					<input type="hidden" name="id" value="<%=i%>" />
					<input type="hidden" name="details_per" value="<%=details_per%>" />
					<input type="hidden" name="fname" value="<%=s2%>" />
					<input type="submit" name="Submit" value="View" />
                </div></td>
              </tr>
                  </form>
              
                <%
			  
				}

		}	
		if(al.isEmpty())
		{
			%>
               <h3><span class="style25">No Patient Records Found , Request For Access Control <br /><br />
                   <span class="style28">(OR)</span><br />
                   <br /> Wait For Healthcare Server To Provide Access Control  </span></h3>
            <%
		}
		
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>            </table>
              <p align="right">&nbsp;</p>
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
