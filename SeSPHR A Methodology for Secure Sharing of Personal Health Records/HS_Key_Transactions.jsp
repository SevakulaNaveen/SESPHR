<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Key Transactions</title>
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
.style22 {font-size: 14px; font-weight: bold; }
.style23 {color: #FFFF00}
.style24 {font-size: 14px; font-weight: bold; color: #FFFF00; }
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
          <li class="active"><a href="HS_Main.jsp"><span>Home</span></a></li>
          <li><a href="HS_Login.jsp"><span>Logout</span></a></li>		 
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
        <div class="mainbar">
          <div class="article">
            <h2><span> Key Transactions </span></h2>
            <p class="infopost">&nbsp;</p>
            <div class="clr"></div>
            <div>
              <p align="justify">&nbsp;</p>
              <table width="597" border="1" cellpadding="0" style="border-collapse:collapse" cellspacing="0" align="center">
                <tr>
                  <td width="23" height="31" bgcolor="#FF0000"><div align="center" class="style22 style23"> ID </div></td>
                  <td width="95" bgcolor="#FF0000"><div align="center" class="style24">Requestor</div></td>
                  <td width="110" bgcolor="#FF0000"><div align="center" class="style24">Patient Name </div></td>
                  <td width="122" bgcolor="#FF0000"><div align="center" class="style24">Provider Name </div></td>
                  <td width="97" bgcolor="#FF0000"><div align="center" class="style24">Requestee</div></td>
                  <td width="136" bgcolor="#FF0000"><div align="center" class="style24">Status</div></td>
                </tr>
                <%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=1,j=0,k=0;

      	try 
	{
		ResultSet r=connection.createStatement().executeQuery("select * from hkas_key_req where patient_name!='No'");
		while(r.next())
		{
			String patient=r.getString(2);
			String provider=r.getString(3);
			String keys=r.getString(4);
			String status1=r.getString(5);
			
			
		%>
                <tr>
                  <td height="31"><div align="center"><%=i%></div></td>
                  <td><div align="center"><%=patient%></div></td>
                  <td><div align="center"><%=provider%></div></td>
                  <td><div align="center">Encryption Key Request</div></td>
                  <td><div align="center">HKAS</div></td>
                  <td><div align="center"><%=keys%></div></td>
                </tr>
                <%i++;
		}
        	
      		String query="select * from hkas_transaction "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
	
		%>
                <tr>
                  <td height="31"><div align="center"><%=i%></div></td>
                  <td><div align="center"><%=s2%></div></td>
                  <td><div align="center"><%=s3%></div></td>
                  <td><div align="center"><%=s4%></div></td>
                  <td><div align="center"><%=s5%></div></td>
                  <td><div align="center"><%=s6%></div></td>
                </tr>
                <%i++;
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
              </table>
              <p>&nbsp;</p>
              <p align="right"><a href="HS_Main.jsp">Back</a></p>
            </div>
          </div>
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
            <li><a href="HS_Main.jsp">&raquo; Home </a></li>
            <li><a href="HS_Login.jsp">&raquo; Logout </a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
