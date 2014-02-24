<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    
    
    <title>Query Application</title>
    

	
  </head>
  <body>
<% 
	String sentence = request.getParameter("sentence");
	//String noun = request.getParameter("Noun").toString();
	//String verb = request.getParameter("Verb").toString();
	  String verbon = request.getParameter("colour");
        String nounon = request.getParameter("nounon_name");
        String conditionon = request.getParameter("condition_name");
        		String funcID = request.getParameter("funcID");


%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		out.println("can't load mysql driver");
		out.println(e.toString());
	}
%>




<% 	
	try {
	
	
	    String url="jdbc:mysql://url";
	    String id="something";
        String pwd="something";
        Connection con= DriverManager.getConnection(url,id,pwd);
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		
		String temp_verb=(String)session.getAttribute("verb_full"); 
        String temp_noun=(String)session.getAttribute("noun_full"); 

	
	    session.setAttribute("verb",verbon);
	    session.setAttribute( "noun",nounon);
	    
	    

        stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
    
        out.print("<b>Verb :</b>");
        out.print("<form method=\"post\" action=\"nounfulltest.jsp\" name=\"productForm\">");
         out.print("<select name=\"colour\" onchange=\"document.productForm.submit();\">");
         if(verbon != null)
         {
        
                out.print("\t<option>" + verbon + "</option>\n");  
                //test nounon
                
                //   

         }
        else
        {
         out.print("<option value=\"dropdown\">Pls select one");
        }
        //moved from top 
            String sql="SELECT distinct verb FROM service";
        rs=stmt.executeQuery(sql);

             while(rs.next())
             {
        
                  out.print("\t<option>" + rs.getString("verb") + "</option>\n");     

                 
             }
             
                out.print("</select>");
              out.print("<input type=\"hidden\" name=\"dropdown\" id=\"dropdown\">");
             out.print("<form>");
             

		rs.close();
		
		
		
		
		//noun
		
		if(verbon == null)
		{
		String sqlone="SELECT distinct noun FROM service";
        rs=stmt.executeQuery(sqlone);
              out.print("<b>Noun :</b>");
        out.print("<form method=\"post\" action=\"nounfulltest.jsp\" name=\"productForm\">");
         out.print("<select name=\"nounon_name\" onchange=\"document.productForm.submit();\">");

         out.print("<option value=\"dropdown\">Pls select one");
        

             while(rs.next())
             {
        
                  out.print("\t<option>" + rs.getString("noun") + "</option>\n");     

                 
             }
             
                out.print("</select>");
              out.print("<input type=\"hidden\" name=\"dropdown\" id=\"dropdown\">");
             out.print("<form>");
             		rs.close();

		
		}
		else
		{
		    String sqlone="SELECT distinct noun FROM service where verb = " + "'" + verbon + "'";
        rs=stmt.executeQuery(sqlone);
             out.print("<b>Noun :</b>"); 

        out.print("<form method=\"post\" action=\"nounfulltest.jsp\" name=\"productForm\">");
         out.print("<select name=\"nounon_name\" onchange=\"document.productForm.submit();\">");
         if(nounon != null && verbon.equals(temp_verb))
         {
        
                out.print("\t<option>" + nounon + "</option>\n");     
         }
        else
        {
         out.print("<option value=\"dropdown\">Pls select one");

        }

             while(rs.next())
             {
        
                  out.print("\t<option>" + rs.getString("noun") + "</option>\n");     

                 
             }
             
                out.print("</select>");
              out.print("<input type=\"hidden\" name=\"dropdown\" id=\"dropdown\">");
             out.print("<form>");
             		rs.close();

		
		}
		
		
		
		//condtions

		
		
		
		if(nounon == null)
		{
		String sqltwo="SELECT distinct service.condition FROM service";
        rs=stmt.executeQuery(sqltwo);
         out.print("<b>Condition :</b>"); 
        out.print("<form method=\"post\" action=\"nounfulltest.jsp\" name=\"productForm\">");
         out.print("<select name=\"condition_name\" onchange=\"document.productForm.submit();\">");

         out.print("<option value=\"dropdown\">Pls select one");
        

             while(rs.next())
             {
        
                  out.print("\t<option>" + rs.getString("condition") + "</option>\n");     

                 
             }
             
                out.print("</select>");
              out.print("<input type=\"hidden\" name=\"dropdown\" id=\"dropdown\">");
             out.print("<form>");
             		rs.close();

		
		}
		else
		{
		    String sqltwo="SELECT distinct service.condition FROM service where verb = " + "'" + verbon + "'" + " and noun = " + "'" + nounon + "'";
        rs=stmt.executeQuery(sqltwo);
                 out.print("<b>Condition :</b>"); 

        out.print("<form method=\"post\" action=\"nounfulltest.jsp\" name=\"productForm\">");
         out.print("<select name=\"condition_name\" onchange=\"document.productForm.submit();\">");
         if(conditionon != null && temp_noun.equals(nounon) && temp_verb.equals(verbon))
         {
        
                        out.print("\t<option>" + conditionon + "</option>\n");     

                

         }
        else
        {
         out.print("<option value=\"dropdown\">Pls select one");
        }

             while(rs.next())
             {
        
                  out.print("\t<option>" + rs.getString("condition") + "</option>\n");     

                 
             }
             
                out.print("</select>");
              out.print("<input type=\"hidden\" name=\"dropdown\" id=\"dropdown\">");
             out.print("<form>");
             		rs.close();

		
		}
		

		
				stmt.close();

		
        
		con.close();
	}
	catch(Exception e)
	{
			out.println(e.toString());
	} 	

	
	
 %>
 
 
 
  <form method="post">
    		<input name="funcID" type="hidden" value="1">
    		<input type="submit" value="GO!"/>
</form>

<%

 	if(funcID != null && conditionon != null)
 	
 	{
	try 
	{
	    String url="jdbc:mysql://128.195.204.85:3306/project1";
	    String id="project";
        String pwd="eecs118";
        Connection con= DriverManager.getConnection(url,id,pwd);
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
        int func=Integer.valueOf(funcID);
        
        
            stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
             String sql="SELECT * FROM service where verb = " + "'" + verbon + "'" + " and noun = " + "'" + nounon + "'" + " and service.condition =" + "'" + conditionon + "'";


            String short_sql = "SELECT * FROM service where verb = " + "'" + verbon + "'" + " and noun = " + "'" + nounon + "'";
            
            if(conditionon.equals("dropdown") || conditionon.equals("null") || conditionon == null || conditionon.equals(""))
            {
                    rs=stmt.executeQuery(short_sql);

            }
            else
            {
                rs=stmt.executeQuery(sql);

            }
             while(rs.next()){
             
             out.println("| Verb: " + rs.getString("verb")+"          "+ "| Noun: " + rs.getString("noun")+"          "+ "| Service Name: " + rs.getString("name") + "          " +
             "| Condition: " + rs.getString("condition")+"          "+ "| URL Link: " + rs.getString("url"));
             out.println("<br>");
             }
            rs.close();
            stmt.close();

        

   

		con.close();
	}
	catch(Exception e)
	{
			out.println("Please enter Query in the format shown or press go");
	} 	
}
	
	
 

%>
 


  
  </body>
</html>
