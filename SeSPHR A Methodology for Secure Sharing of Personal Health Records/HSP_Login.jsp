<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style4 {color: #FF0000; font-weight: bold; }
.style5 {color: #FFFFFF}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
         <h1><a href="index.html" class="style5">SeSPHR A Methodology for <br />
          Secure Sharing of Personal <br />
        Health Records in the cloud</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li><a href="index.html"><span>Home </span></a></li>
          <li><a href="HS_Login.jsp"><span>Cloud Server </span></a></li>
          <li class="active"><a href="HSP_Login.jsp"><span>PHR Owner </span></a></li>
          <li><a href="D_Login.jsp"><span>PHR User </span></a></li>
          
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
          <h2><span>PHR Owner   Login </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div>
            <p align="center"><img src="images/Login.jpg" width="190" height="131" /></p>
            <form action="HSP_Authentication.jsp" method="post" id="leavereply">
              <label for="name"> <br />
                <span class="style4">Name (required)&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; </span></label>
              <span class="style4">
              <input name="userid" type="text" class="box" id="name" value="" />
              <label for="email"><br />
              <br />
              Password (required)</label>
              </span>
              <strong>
              <label for="email"></label>
              </strong>
              <label for="email"> &nbsp; </label>
              <input type="password" id="pass" name="pass" class="box" />
              <p>&nbsp;</p>
              <p>
                <input name="imageField" type="submit"  class="LOGIN" id="imageField" value="Login" />
                <input type="reset" name="imageField" id="imageField"  class="RESET" />
              </p>
              <p>New User? click here to <a href="HSP_Register.jsp"> Register</a><br />
              </p>
            </form>
            <p align="right"><a href="index.html">Back</a></p>
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
            
            <li><a href="D_Login.jsp">&raquo; PHR User </a></li>
            <li><a href="HS_Login.jsp">&raquo; Cloud Server </a></li>
            <li><a href="HSP_Login.jsp">&raquo;PHR Owner </a></li>
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
