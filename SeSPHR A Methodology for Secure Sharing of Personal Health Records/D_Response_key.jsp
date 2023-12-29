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
<title>Key Response</title>
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
.style17 {font-size: 14; }
.style25 {
	font-size: 15px;
	color: #FF0000;
}
.style27 {color: #FFFF00; font-weight: bold; }
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
          <h2><span> Key </span><span class="style38 style20"></span>Response</h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div class="clr"></div>
          <div >
            <p>&nbsp;</p>
            <form action="D_Response_key1.jsp" method="post" id="leavereply">
              <div align="center">
                <table width="523" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th height="48" bgcolor="#FF0000" scope="row"><div align="center" class="style27"><span class="style17">Enter Provider Name :&nbsp;</span></div></th>
                    <td><div align="left"><span class="style17">
                      <input name="provider" type="text" size="30" />
                    </span></div></td>
                  </tr>
                  <tr>
                    <th height="35" bgcolor="#FF0000" scope="row"><div align="center" class="style27"><span class="style17"> Enter Patient Name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></div></th>
                    <td><div align="left"><span class="style17">
                      <input name="patient" type="text" size="30" />
                    </span></div></td>
                  </tr>
                </table>
                <p align="left" class="style17">&nbsp;</p>
                <p align="center" class="style17">
                  <input type="submit" name="Submit" value="View Response" />
                </p>
                <p align="center" class="style17"><%String msg=(String)application.getAttribute("msg");
			  if(msg!=(null))
			  {%>
          <p align="center" class="style4 style25"><strong> Status : <%=msg%>&nbsp;</strong></p>
          <p>
            <%application.removeAttribute("msg");
			  }%>
           </p>
              </div>
            </form>
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
