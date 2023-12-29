<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud Server</title>
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
.style9 {font-size: 14px}
.style24 {color: #FFFF00}
.style25 {
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
            <h2><span>View Access Control Requests </span></h2>
            <p class="infopost">&nbsp;</p>
            <div class="clr"></div>
            <div >
              <p align="justify">&nbsp;</p>
              <table width="635" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
                <tr>
                  <td width="25" height="41" bgcolor="#FF0000"><div align="center" class="style9 style24"><strong> ID </strong></div></td>
                  <td width="86" bgcolor="#FF0000"><div align="center" class="style25"> Provider  Name </div></td>
                  <td width="82" bgcolor="#FF0000"><div align="center" class="style25"> Patient Name </div></td>
                  <td width="59" bgcolor="#FF0000"><div align="center" class="style25">Doctor</div></td>
                  <td width="125" bgcolor="#FF0000"><div align="center" class="style25"> Document Permission </div></td>
                  <td width="110" bgcolor="#FF0000"><div align="center" class="style25"> Details Permission </div></td>
                  <%	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
    try 
	{
      	   String query="select *from hs_access_req"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while( rs.next() )
	   {
		
		i=rs.getInt(1);
		s2=rs.getString(2);
		s4=rs.getString(3);
		s3=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
		
		%>
                </tr>
                <tr>
                  <td height="28"><div align="center"><%=i%></div></td>
                  <td><div align="center"><%=s2%></div></td>
                  <td><div align="center"><%=s4%></div></td>
                  <td><div align="center"><%=s3%></div></td>
                
                  <%
			  if(s5.equalsIgnoreCase("Requested"))
			{
				%>
                  <td width="125" height="28"><div align="center"><a href="HS_Provide_Access_DocPer.jsp?id=<%=i%>">Provide Permission</a></div></td>
                  <%
			}
			else
			{
				%>
                  <td width="110" height="28"><div align="center"><%=s5%></div></td>
                  <%
		}
		if(s6.equalsIgnoreCase("Requested"))
			{
				%>
                  <td width="64" height="28"><div align="center"><a href="HS_Provide_Access_DetailsPer.jsp?id=<%=i%>">Provide Permission</a></div></td>
                  <%
			}
			else
			{
				%>
                  <td width="66" height="28"><div align="center"><%=s6%></div></td>
                  <%
		}
	  }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
                </tr>
              </table>
              <p align="justify">&nbsp;</p>
              <p align="right"><a href="HS_Main.jsp">Back</a></p>
            </div>
            <div class="clr"></div>
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
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>
