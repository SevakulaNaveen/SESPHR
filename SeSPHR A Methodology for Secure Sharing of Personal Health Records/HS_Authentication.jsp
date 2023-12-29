<title>Authentication Page</title>


<%@ include file="connect.jsp"%>

<%
	
try {
		
		String name = request.getParameter("userid");
	String pass = request.getParameter("pass");
	
		String sql = "SELECT * FROM healthcare_server where name='" + name+ "' and pass='" + pass + "' ";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()==true)
		{
			response.sendRedirect("HS_Main.jsp");
		}
		 else 
		{
			response.sendRedirect("wronglogin.html");
		}
	}
	catch (Exception e)
	{
		//out.print(e);
	}%>

