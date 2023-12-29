<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>PHR User Register</title>
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
.style1 {
	color: #FFFF00;
	font-weight: bold;
}
.style2 {color: #FFFF00}
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
          <li><a href="index.html"><span>Home </span></a></li>
          <li><a href="HS_Login.jsp"><span>Cloud Server </span></a></li>
          <li><a href="HSP_Login.jsp"><span>PHR Owner  </span></a></li>
          <li class="active"><a href="D_Login.jsp"><span>PHR User </span></a></li>
         
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
          <h2><span>Doctor / Nurse  Register </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div>
            <p align="justify"><img src="images/register.gif" width="480" height="122" /></p>
            <form action="D_RegisterAuthentication.jsp" method="post" id="" enctype="multipart/form-data">
              <label for="name"> </label>
              <table width="590" height="611" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="259" bgcolor="#FF0000" scope="row"><div align="left" class="style1"> Name (required) : </div></td>
                  <td width="343"><input id="name" name="userid" class="text" /></td>
                </tr>
                <tr>
                  <td height="45" bgcolor="#FF0000" ><div align="left" class="style2"><strong>Password (required) : </strong></div></td>
                  <td><input type="password" id="password" name="pass" class="text" /></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><div align="left" class="style2"><strong>Select Role  (required) : </strong></div></td>
                  <td><label>
                    <select name="role">
                      <option>-Select-</option>
                      <option>Doctor</option>
                      <option>Nurse</option>
                    </select>
                  </label></td>
                </tr>
                <tr>
                  <td height="47" bgcolor="#FF0000" scope="row"><div align="left" class="style2"><strong>Enter Hospital  (required) : </strong></div></td>
                  <td><input id="hospital" name="hospital" class="text" /></td>
                </tr>
                <tr>
                  <td height="45" bgcolor="#FF0000" scope="row"><div align="left" class="style2"><strong>Email Address (required) : </strong></div></td>
                  <td><input id="email" name="email" class="text" /></td>
                </tr>
                <tr>
                  <td height="38" bgcolor="#FF0000" scope="row"><div align="left" class="style2"><strong>Mobile Number (required) : </strong></div></td>
                  <td><input id="mobile" name="mobile" class="text" /></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><span class="style2"><strong>
                      <label for="label"> </label>
                    <label for="label">
                    </strong>
                    </span>
                    <div align="left" class="style2"><strong>Your Address : </strong></div>
                    <span class="style2"><strong>
                    </label>
                    </strong></span></td>
                  <td><textarea name="address" cols="45" id="address"></textarea></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><span class="style2"><strong>
                      <label for="label"> </label>
                    <label for="label">
                    </strong>
                    </span>
                    <div align="left" class="style2"><strong>Date of Birth (required) : </strong></div>
                    <span class="style2"><strong>
                    </label>
                    </strong></span></td>
                  <td><input id="dob" name="dob" class="text" /></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><div align="left" class="style2"><strong>Select Gender (required) : </strong></div></td>
                  <td><select id="s1" name="gender" class="text">
                      <option>-Select-</option>
                      <option>Male</option>
                      <option>Female</option>
                  </select></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><span class="style2"><strong>
                      <label for="label"> </label>
                    <label for="label">
                    </strong>
                    </span>
                    <div align="left" class="style2"><strong>Enter Pincode (required) : </strong></div>
                    <span class="style2"><strong>
                    </label>
                    </strong></span></td>
                  <td><input id="pincode" name="pincode" class="text" /></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><span class="style2"><strong>
                      <label for="location"> </label>
                    <label for="location">
                    </strong>
                    </span>
                    <div align="left" class="style2"><strong>Enter Location (required) : </strong></div>
                    <span class="style2"><strong>
                    </label>
                    </strong></span></td>
                  <td><input id="loc" name="location" class="text" /></td>
                </tr>
                <tr>
                  <td bgcolor="#FF0000" scope="row"><span class="style2"><strong>
                      <label for="label"> </label>
                    <label for="label">
                    </strong>
                    </span>
                    <div align="left" class="style2"><strong>Select Profile Picture (required) : </strong></div>
                    <span class="style2"><strong>
                    </label>
                    </strong></span></td>
                  <td><input type="file" id="pic" name="pic" class="text" /></td>
                </tr>
                <tr>
                  <td height="79" scope="row">&nbsp;</td>
                  <td><input name="submit" type="submit" value="REGISTER" /></td>
                </tr>
              </table>
              <p align="right"><a href="P_Login.jsp">Back</a></p>
            </form>
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
            <li><a href="HK_Login.jsp">&raquo; HKAS </a></li>
            <li><a href="D_Login.jsp">&raquo; Doctor / Nurse </a></li>
            <li><a href="HS_Login.jsp">&raquo; Healthcare Server </a></li>
            <li><a href="HSP_Login.jsp">&raquo; Healthcare Service Provider</a></li>
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
