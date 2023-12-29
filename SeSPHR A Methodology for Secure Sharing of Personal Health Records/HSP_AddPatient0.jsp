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
.style20 {font-size: 16px}
.style22 {
	color: #FF0000;
	font-weight: bold;
}
.style27 {color: #FF0000}
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
            <h3>
              <%String hospital=request.getParameter("hospital");
		  		String keys=request.getParameter("keys");
		  if(hospital.equalsIgnoreCase("-Select-"))
		  {
		  	%>
            </h3>
            <h3><span class="style20"><br /><br /><br />Please Select Hospital To Continue .. !</span><br /><br /></h3>
            <a href="HSP_AddPatient.jsp">Back</a>
            <%
		  
		  }
		  else
		  { 
		  
		  
		  %> 
            <span class="style22"> Encryption Key  : <%=keys%></span>
            <form action="HSP_AddPatient1.jsp" method="post" id="" enctype="multipart/form-data">
              <label for="name"><br />
			 <input type="hidden" name="keys" value="<%=keys%>" />
              </label>
              <table width="590" height="851" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="259" height="35" bgcolor="#FFFFFF" scope="row"><div align="left" class="style22 style27">Patient Name  : </div></td>
                  <td width="343"><input id="name" name="p_name" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" ><div align="left" class="style22">Blood Group   : </div></td>
                  <td><input  id="bloodgroup" name="bloodgroup" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><div align="left" class="style22"> Hospital  : </div></td>
                  <td>
                    <input readonly="readonly" id="hospital" name="hospital" value="<%=hospital%>">                 </td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><div align="left" class="style22">Select Doctor  : </div></td>
                  <td><label>
                    <%ResultSet r=connection.createStatement().executeQuery("select name from doctor where hospital='"+hospital+"'");
				  ArrayList doc=new ArrayList();
				  while (r.next())
				  {
				  	String doctor=r.getString(1);
					doc.add(doctor);
				  }
				  %>
                    <select name="doctor">
                      <option>-Select-</option>
                      <%for(int i=0;i<doc.size();i++){%>
                      <option><%=doc.get(i)%></option>
                      <%}%>
                    </select>
                  </label></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><div align="left" class="style22">Disease : </div></td>
                  <td><input id="disease" name="disease" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><div align="left" class="style22">Age : </div></td>
                  <td><input id="age" name="age" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><span class="style27"><span class="style24">
                    <label for="label"> </label>
                      <label for="label">
                      </span>
                    </span><div align="left" class="style22">Patient Address : </div>
                    <span class="style22">
                    </label>
                  </span></td>
                  <td><textarea name="p_address" cols="45" id="address"></textarea></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><span class="style27"><span class="style24">
                    <label for="label"> </label>
                      <label for="label">
                      </span>
                    </span><div align="left" class="style22">Date of Birth  : </div>
                    <span class="style22">
                    </label>
                  </span></td>
                  <td><input id="dob" name="p_dob" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><div align="left" class="style22"> Gender : </div></td>
                  <td><select id="s1" name="p_gender" class="text">
                      <option>-Select-</option>
                      <option>Male</option>
                      <option>Female</option>
                  </select></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><span class="style27"><span class="style24">
                    <label for="label"> </label>
                      <label for="label">
                      </span>
                    </span><div align="left" class="style22">E-mail : </div>
                    <span class="style22">
                    </label>
                  </span></td>
                  <td><input id="email" name="p_email" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF" scope="row"><span class="style27"><span class="style24">
                    <label > </label>
                      <label >
                      </span>
                    </span><div align="left" class="style22">Mobile : </div>
                    <span class="style22">
                    </label>
                  </span></td>
                  <td><input id="p_mobile" name="p_mobile" class="text" /></td>
                </tr>
                <tr>
                  <td height="35" bgcolor="#FFFFFF"><span class="style22">Select File(Patient Description) :-</span></td>
                  <td><input required="required" type="file" name="p_desc_fn" id="file"  onchange="loadFileAsText()" /></td>
                </tr>
                <tr>
                  <td height="264" bgcolor="#FFFFFF"><span class="style22">Patient Description : </span></td>
                  <td><textarea name="p_desc_cont" id="textarea" cols="50" rows="15"></textarea></td>
                </tr>
                <tr>
                  <td height="60" scope="row">&nbsp;</td>
                  <td><input name="submit" type="submit" value="Encrypt & Upload Details" /></td>
                </tr>
              </table>
              <p align="right"><a href="HSP_Main.jsp">Back</a></p>
            </form><%}%>
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
