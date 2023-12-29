<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@ include file="connect.jsp"%>


<%
try
{

ResultSet rs=connection.createStatement().executeQuery("select disease,count(disease) from patient_details group by disease");
%><html>
<head>
<title>Transaction Results</title>
<script type="text/javascript" src="sources/jscharts.js"></script>
</head>
<body>
<div id="graph">Loading graph...</div>
<script type="text/javascript">
var myData=new Array();
var colors=[];

<%
	int i=0,s2=0;
	
	String s1=null;
	
	while(rs.next())
	{
	
	 s1=rs.getString(1);
	 s2=rs.getInt(2);
	 
		String keys = "ef50a0ef2c3e3a5f";
		byte[] keyValue = keys.getBytes();
		Key key = new SecretKeySpec(keyValue, "AES");
		Cipher c = Cipher.getInstance("AES");
		c.init(Cipher.DECRYPT_MODE, key);
		String Decrypted = new String(Base64.decode(s1.getBytes()));		
	
	%>
	
	myData["<%=i%>"]=["<%=Decrypted%>",<%=s2%>];
        
	<%
	i++;}
	%>
	
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.setBarColor('#42aBdB');
	myChart.setBarOpacity(0.8);
	myChart.setBarBorderColor('#D9EDF7');
	myChart.setBarValues(true);
	myChart.setTitleColor('#8C8383');
	myChart.setAxisColor('#777E89');
	myChart.setAxisValuesColor('#777E81');
	myChart.draw();
	
</script>

</body>
</html>
<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>

