<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,com.sources.*,java.util.*"%>
    
    <!DOCTYPE HTML>
<!--
	Retrospect by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Ontology Link</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="index.jsp">Ontology Link</a></h1>
				<a href="#nav">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="nav">
				<ul class="links">
					<li><a href="index.jsp">Logout</a></li>
					
				</ul>
			</nav>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">
					<header class="major special">
						<h2>City Based Web Form</h2>
					
					</header>

					<!-- Text -->
						<section>
					<center>
<table cellpadding="5" cellspacing="5">
<%
JenaTest.Search4(request.getParameter("skey"));
LinkedHashSet<String> adup=new LinkedHashSet<String>();
LinkedList<String> kv=new LinkedList<String>();
LinkedList<String> kv1=new LinkedList<String>();
try
{
	Thread.sleep(1000);
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
FileInputStream fis = new FileInputStream("d:/triples.csv");

//Construct BufferedReader from InputStreamReader
BufferedReader br = new BufferedReader(new InputStreamReader(fis));
String line = null;
int i=1;
while ((line = br.readLine()) != null ) {
	//out.println(line+"<br>");
	String s[]=line.split(",");
	if(i!=1)
	{
		String url =s[0];
		url=url.replaceAll("http://","");
		String u[]=url.split("/");
		String val=s[1].replaceAll("http://dbpedia.org/resource/", "");
		String lbl=u[u.length-1];
		if(!lbl.contains("type"))
		{
			adup.add(lbl);
			kv.add(lbl+"~"+val);
			kv1.add(lbl);
		%>
		 <%-- <tr><td><b><%=lbl %>:</b></td><td><%if(val.length()<=12){ %><input type="text" value="<%=val %>"/><%}else{ %><textarea row="5" cols="25"><%=val %></textarea><%} %></td></tr> --%> 
		<%
		}
	}
	i++;
}
LinkedList<String> spv=new LinkedList<String>();
for(String s:adup)
{
	//out.println(""+s+Collections.frequency(kv1,s)+"<br>");
	 spv.add(s+"~"+Collections.frequency(kv1,s));
}
LinkedList<String> frm=new LinkedList<String>();
for(String s:spv)
{
	String sv[]=s.split("~");
	String val="";
	if(Integer.parseInt(sv[1])==1)
	{
		for(String k:kv)
		{
			String s1[]=k.split("~");
		if(sv[0].equalsIgnoreCase(s1[0]))
		{
			val=s1[1];
		}
		}
		if(sv[0].equalsIgnoreCase("gender"))
		{
			if(val.equals("male"))
			{
			frm.add(""+sv[0]+"~"+"<input type='radio' name='gndr' value='male' checked/>Male <input type='radio' name='gndr' value='female'/>Female");
			}
			else
			{
				frm.add(""+sv[0]+"~"+"<input type='radio' name='gndr' value='male'/>Male <input type='radio' name='gndr' value='female' checked/>Female");	
			}
		}
		else if(val.length()<=15)
		{
		frm.add(""+sv[0]+"~"+"<input type='text' value='"+val+"'/>");
		}
		
		else
		{
			frm.add(""+sv[0]+"~"+"<textarea rows='5' cols='25'>"+val+"</textarea>");	
		}
	}
		
	else
	{
		for(String k:kv)
		{
			String s1[]=k.split("~");
		if(sv[0].equalsIgnoreCase(s1[0]))
		{
			val+=s1[1]+"~";
		}
		}
		String outp="";
		String sp[]=val.split("~");
		for(String ss:sp)
		{
			if(!ss.equals("\""))
			{
			outp+="<option value='"+ss+"'>"+ss.replaceAll("\"","")+"</option>";
			}
		}
		frm.add(""+sv[0]+"~"+"<select name='"+sp[0]+"'>"+outp+"</select>");
	}
}
for(String s:frm)
{
	//out.println(s+"<br>");
	String s1[]=s.split("~");
%>
<tr><td><%=s1[0] %></td><td><%=s1[1] %></td></tr>
<%
}
/*BufferedReader br1 = new BufferedReader(new InputStreamReader(fis));
String line1 = null;
int i1=1;
while ((line1 = br1.readLine()) != null ) {
	//out.println(line+"<br>");
	String s[]=line1.split(",");
	if(i1!=1)
	{
		String url =s[0];
		url=url.replaceAll("http://","");
		String u[]=url.split("/");
		String val=s[1].replaceAll("http://dbpedia.org/resource/", "");
		String lbl=u[u.length-1];
		if(!lbl.contains("type"))
		{
		%>
		 <tr><td><b><%=lbl %>:</b></td><td><%if(val.length()<=12){ %><input type="text" value="<%=val %>"/><%}else{ %><textarea row="5" cols="25"><%=val %></textarea><%} %></td></tr> 
		<%
		}
	}
	i1++;
}*/
%>
<tr align="center"><td colspan="2"><input type="submit" value="Update RDF"/></td></tr>
</table>
</center>
						</section>

					

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>



