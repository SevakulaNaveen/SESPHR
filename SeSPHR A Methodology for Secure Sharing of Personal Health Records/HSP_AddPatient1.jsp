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
.style20 {font-size: 18px}
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
          <h2><span>Add Patient   </span> Status </h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div>
            <p>&nbsp;</p>
            <p align="justify">&nbsp;</p>
            <%
					ArrayList list = new ArrayList();
					ServletContext context = getServletContext();
					String dirName =context.getRealPath("Gallery\\");
					String paramname=null;
					String file=null;
					String a=null,b=null,d=null,image=null;
					String ee[]=null;
					String checkBok=" ";
					int ff=0;
					String bin = "";
					String p_name=null;     
        			String bloodgroup=null;
					String hospital=null;
					String doctor=null;
					String disease=null;
					String age=null;
					String p_address=null;
					String p_dob=null;
				    String p_gender=null;
					String p_email=null;
					String p_mobile=null;
					String keys=null;
					String p_desc_fn=request.getParameter("p_desc_fn");
					String p_desc_cont=null;
					String provider_name=(String)application.getAttribute("pname");
				
					FileInputStream fs=null;
					File file1 = null;	
				try {
						MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB
						Enumeration params = multi.getParameterNames();
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							if(paramname.equalsIgnoreCase("p_name"))
							{
								p_name=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("bloodgroup"))
							{
								bloodgroup=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("hospital"))
							{
								hospital=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("doctor"))
							{
								doctor=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("disease"))
							{
								disease=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("age"))
							{
								age=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("p_address"))
							{
								p_address=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("p_dob"))
							{
								p_dob=multi.getParameter(paramname);
							} 
							if(paramname.equalsIgnoreCase("p_gender"))
							{
								p_gender=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("p_email"))
							{
								p_email=multi.getParameter(paramname);
							}
							
							if(paramname.equalsIgnoreCase("p_mobile"))
							{
								p_mobile=multi.getParameter(paramname);
							}
									
							if(paramname.equalsIgnoreCase("p_desc_fn"))
							{
								p_desc_fn=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("p_desc_cont"))
							{
								p_desc_cont=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("keys"))
							{
								keys=multi.getParameter(paramname);
							}
						
						}
						
						
						byte[] keyValue = keys.getBytes();
						Key key = new SecretKeySpec(keyValue, "AES");
						Cipher c = Cipher.getInstance("AES");
						c.init(Cipher.ENCRYPT_MODE, key);
						String encryptedValue = new String(Base64.encode(p_desc_cont.getBytes()));
						String bloodgroup1 = new String(Base64.encode(bloodgroup.getBytes()));
						String disease1 = new String(Base64.encode(disease.getBytes()));
						String p_address1 = new String(Base64.encode(p_address.getBytes()));
						String p_dob1 = new String(Base64.encode(p_dob.getBytes()));
						String p_email1 = new String(Base64.encode(p_email.getBytes()));
						String p_mobile1 = new String(Base64.encode(p_mobile.getBytes()));
						
						
			String namefile=request.getRealPath("p_desc_fn");
      		PrintStream p = new PrintStream(new FileOutputStream(namefile+"/"));
			p.print(new String(p_desc_cont));
      		String h1="";
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(namefile+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
						
						
						
						
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
						}
						FileInputStream fs1 = null;
						int lyke=0;
						
						SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;
						
						String query1="select * from patient_details  where patient_name='"+p_name+"'"; 
						Statement st1=connection.createStatement();
						ResultSet rs1=st1.executeQuery(query1);
						if ( rs1.next() )
						{
							%>
							<h3 class="style20"><span class="style3">Patient Name Already Exits</span> !! </h3>
							<p><a href="HSP_Main.jsp">Back</a></p>
							<%
						}
						else
						{
							PreparedStatement ps=connection.prepareStatement("insert into patient_details(patient_name,blood_group,disease,age,dob,gender,email,mobile,address,p_desc,desc_trap,desc_sk,dt,downer,des_rank,hospital,doctor,en_key) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							ps.setString(1,p_name);
							ps.setString(2,bloodgroup1);
							ps.setString(3,disease1);	
							ps.setString(4,age);
							ps.setString(5,p_dob1);
							ps.setString(6,p_gender);
							ps.setString(7,p_email1);
							ps.setString(8,p_mobile1);
							ps.setString(9,p_address1);
							ps.setString(10,encryptedValue);
							ps.setString(11,h1);
							ps.setString(12,"No");
							ps.setString(13,dt);
							ps.setString(14,provider_name);
							ps.setString(15,"0");
							ps.setString(16,hospital);
							ps.setString(17,doctor);
							ps.setString(18,keys);
							
							PreparedStatement ps1=connection.prepareStatement("insert into patient_details_backup(patient_name,blood_group,disease,age,dob,gender,email,mobile,address,p_desc,desc_trap,desc_sk,dt,downer,hospital,doctor,en_key) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
							ps1.setString(1,p_name);
							ps1.setString(2,bloodgroup1);
							ps1.setString(3,disease1);	
							ps1.setString(4,age);
							ps1.setString(5,p_dob1);
							ps1.setString(6,p_gender);
							ps1.setString(7,p_email1);
							ps1.setString(8,p_mobile1);
							ps1.setString(9,p_address);
							ps1.setString(10,encryptedValue);
							ps1.setString(11,h1);
							ps1.setString(12,"No");
							ps1.setString(13,dt);
							ps1.setString(14,provider_name);
							ps1.setString(15,hospital);
							ps1.setString(16,doctor);
							ps1.setString(17,keys);
							
							ps1.executeUpdate();
							int x=ps.executeUpdate();
							if(x>0)
							{
							
								connection.createStatement().executeUpdate ("insert into transaction(user,fname,task,dt) values('"+provider_name+"','"+p_name+"','Upload','"+dt+"')");
								
								connection.createStatement().executeUpdate ("update hkas_key_req set patient_name='"+p_name+"' where provider='"+provider_name+"' and key_permission='Permitted' and patient_name='No' ");
								%>
								<h3 class="style20"> <span class="style3">Patient Details Added Sucessfully</span> !! </h3>
								<p><a href="HSP_Main.jsp">Back</a></p>
								<%
							}
						}
					
				} 
				catch (Exception e) 
				{
					out.println(e.getMessage());
					e.printStackTrace();
				}
				%>
<p>&nbsp;</p>
            <p>&nbsp;</p>
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
