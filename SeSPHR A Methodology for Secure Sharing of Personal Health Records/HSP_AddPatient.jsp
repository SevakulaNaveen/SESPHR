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
<title>PHR Owner</title>
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
	font-size: 16px;
	color: #FF0000;
}
.style21 {color: #3399FF}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
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
          <li class="active"><a href="HSP_Main.jsp"><span>Home</span></a></li>
          <li><a href="HSP_Login.jsp"><span>Logout</span></a></li>		 
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
          <h2><span>Add Patient   </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div>
		                <p>&nbsp;</p>
						<h3>
						  <%
	int j=0;		
	String provider_name=(String)application.getAttribute("pname");
	ResultSet rs=connection.createStatement().executeQuery("select * from hkas_key_req where provider='"+provider_name+"' and patient_name='No' ");

	if(rs.next())
	{
			String patient_name=rs.getString("patient_name");
			String en_key=rs.getString("en_key");
			String key_permission=rs.getString("key_permission");
			
			if(en_key.equalsIgnoreCase("Requested"))
			{
				%>
				<h3>  <span class="style20">Wait for (Cloud) Public Key to generate <br />
				     encryption public key</span> !! <br />
				<br /><br /><br /><br /><br /></h3>
				<a href="HSP_Main.jsp">back</a><br/>
				<%
			}
			else if(key_permission.equalsIgnoreCase("No"))
			{
				%>
				<h3>  <span class="style20">Wait for (Cloud) Public Key to Permitt <br />
				     encryption public key</span> !! <br />
				<br /><br /><br /><br /><br /></h3>
				<a href="HSP_Main.jsp">back</a><br/>
				<%
			}
			else if(key_permission.equalsIgnoreCase("Requested"))
			{
				%>
				<h3>  <span class="style20">Wait for (Cloud)Public Key to Permitt <br />
				     encryption public key</span> !! <br />
				<br /><br /><br /><br /><br /></h3>
				<a href="HSP_Main.jsp">back</a><br/>
				<%
			}
			else if(patient_name.equalsIgnoreCase("No"))
			{ 
				%>
				<form action="HSP_AddPatient0.jsp" method="post" id="" >
				<label for="name"><br />
				</label>
				<table width="407" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
				<td width="182" scope="row"><div align="left">Select Hospital  : </div></td>
				<td width="334"><label><%ResultSet r=connection.createStatement().executeQuery("select * from doctor");
				ArrayList hos=new ArrayList();
				while (r.next())
				{
					String hospital=r.getString(14);
					hos.add(hospital);
				}
				%>
				<input type="hidden" name="keys" value="<%=en_key%>" />
				<select name="hospital">
				<option>-Select-</option>
				<%for(int i=0;i<hos.size();i++)
				{
					%>
					<option><%=hos.get(i)%></option>
					<%
				}
				%>
				</select>
				</label></td>
				</tr>
				<tr>
				<td height="48" scope="row">&nbsp;</td>
				<td><p>&nbsp; </p>
				<p>
				<input name="submit" type="submit" value="Save &amp; Continue" />
				</p></td>
				</tr>
				</table>
				<p align="right"><a href="HSP_Main.jsp">Back</a></p>
				</form>
				<%
			}
			else
			{
				%>
				<span class="style20">You Dont Have Encryption Public Key </span> !!</h3>
				        <br />
				<form action="HSP_EncryptRequest.jsp" method="get"><input name="" type="submit"  value="Request For Encryption Key"/></form>
				<br/>
				<br/>
				<br/>
				<br/>
				<a href="HSP_Main.jsp">back</a><br/>
				<%
			}
	}
	else
	{
			%>
			<span class="style20">You Dont Have Encryption Public Key </span> !!</h3>
			<br />
			<form action="HSP_EncryptRequest.jsp" method="get"><input name="" type="submit"  value="Request For Encryption Key"/></form>
			<br/>
			<br/>
			<br/>
			<br/>
			<a href="HSP_Main.jsp">back</a><br/>
			<%
	}
%>
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
            <li><a href="HSP_Main.jsp">&raquo; Home </a></li>
            <li><a href="HSP_Login.jsp">&raquo; Logout </a></li>
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
