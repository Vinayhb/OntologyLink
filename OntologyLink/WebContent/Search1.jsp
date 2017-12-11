<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*,com.sources.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ontology Link</title>
</head>
<body>
<center>
<h1> Ontology Link</h1>
<table cellpadding="5" cellspacing="5">
<%
JenaTest.Search(request.getParameter("skey"));
try
{
	Thread.sleep(100);

FileInputStream fis = new FileInputStream("d:/predicates.csv");

//Construct BufferedReader from InputStreamReader
BufferedReader br = new BufferedReader(new InputStreamReader(fis));

String line = null;
int i=1;
while ((line = br.readLine()) != null ) {
	if(!line.equalsIgnoreCase(" "))
	{
	if(i!=1)
	{ 
	//out.println(line+"<br>");
	if(line.contains("http://xmlns.com/foaf/0.1/name"))
	{
		JenaTest.Search2(request.getParameter("skey"),line,"d:/objects1.csv");
		Thread.sleep(100);
		String val="";
		FileInputStream fis1 = new FileInputStream("d:/objects1.csv");

		//Construct BufferedReader from InputStreamReader
		BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

		String line1 = null;
		int i1=1;
		while ((line1 = br1.readLine()) != null) {
			if(i1!=1)
			{
		val+=line1;
			}
		i1++;
		}
	%>
	<tr><td>name</td><td><input type="text" value="<%=val%>"/></td></tr>
	<%
	try{

		File file = new File("d:/objects1.csv");

		if(file.delete()){
			System.out.println(file.getName() + " is deleted!");
		}else{
			System.out.println("Delete operation is failed.");
		}

	}catch(Exception e){

		e.printStackTrace();

	}

	}
	if(line.contains("surname"))
	{
		JenaTest.Search2(request.getParameter("skey"),line,"d:/objects2.csv");
		Thread.sleep(100);
		String val="";
		FileInputStream fis1 = new FileInputStream("d:/objects2.csv");

		//Construct BufferedReader from InputStreamReader
		BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

		String line1 = null;
		int i1=1;
		while ((line1 = br1.readLine()) != null) {
			if(i1!=1)
			{
		val+=line1;
			}
		i1++;
		}
	%>
	<tr><td>surname</td><td><input type="text" value="<%=val%>"/></td></tr>
	<%
	try{

		File file = new File("d:/objects2.csv");

		if(file.delete()){
			System.out.println(file.getName() + " is deleted!");
		}else{
			System.out.println("Delete operation is failed.");
		}

	}catch(Exception e){

		e.printStackTrace();

	}
	}
	if(line.contains("deathPlace"))
	{ 
		JenaTest.Search2(request.getParameter("skey"),line,"d:/objects3.csv");
		Thread.sleep(100);
		String val="";
		FileInputStream fis1 = new FileInputStream("d:/objects3.csv");

		//Construct BufferedReader from InputStreamReader
		BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

		String line1 = null;
		int i1=1;
		while ((line1 = br1.readLine()) != null) {
			if(i1!=1)
			{
		val+=line1;
			}
		i1++;
		}
	%>
<tr><td>deathPlace</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects3.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("deathDate"))
	{ 
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects4.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects4.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+=line1;
		}
	i1++;
	}
	%>
<tr><td>deathDate</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects4.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("birthPlace"))
	{ 
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects5.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects5.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+="<option value='"+line1.replaceAll("http://dbpedia.org/resource/","")+"'>"+line1.replaceAll("http://dbpedia.org/resource/","")+"</option>";
		}
	i1++;
	}
	%>
<tr><td>birthPlace</td><td><select>
<%=val %>
</select></td></tr>
<%
try{

	File file = new File("d:/objects5.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("birthDate"))
	{
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects6.csv");
	Thread.sleep(100);
		String val="";
		FileInputStream fis1 = new FileInputStream("d:/objects6.csv");

		//Construct BufferedReader from InputStreamReader
		BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

		String line1 = null;
		int i1=1;
		while ((line1 = br1.readLine()) != null) {
			if(i1!=1)
			{
		val+=line1;
			}
		i1++;
		}
		%>
<tr><td>birthDate</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects6.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("gender"))
	{
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects8.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects8.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+=line1;
		}
	i1++;
	}
	%>
<tr><td>gender</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects8.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("nativeLang"))
	{ 
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects9.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects9.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+=line1;
		}
	i1++;
	}
	%>
<tr><td>nativeLang</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects9.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("nativeLang1Name"))
	{ 
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects10.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects10.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+=line1;
		}
	i1++;
	}
	%>
<tr><td>nativeLang1Name</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects10.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("nativeLang2Name"))
	{ 
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects10.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects11.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+=line1;
		}
	i1++;
	}
	%>
<tr><td>nativeLang2Name</td><td><input type="text" value="<%=val%>"/></td></tr>
<%
try{

	File file = new File("d:/objects11.csv");

	if(file.delete()){
		System.out.println(file.getName() + " is deleted!");
	}else{
		System.out.println("Delete operation is failed.");
	}

}catch(Exception e){

	e.printStackTrace();

}
	}if(line.contains("years"))
	{
	JenaTest.Search2(request.getParameter("skey"),line,"d:/objects12.csv");
	Thread.sleep(100);
	String val="";
	FileInputStream fis1 = new FileInputStream("d:/objects12.csv");

	//Construct BufferedReader from InputStreamReader
	BufferedReader br1 = new BufferedReader(new InputStreamReader(fis1));

	String line1 = null;
	int i1=1;
	while ((line1 = br1.readLine()) != null) {
		if(i1!=1)
		{
	val+=line1;
		}
	i1++;
	}
	%>
<tr><td>years</td><td><input type="text" value="<%=val%>"/></td></tr>
	
		<%
		try{

			File file = new File("d:/objects12.csv");

			if(file.delete()){
				System.out.println(file.getName() + " is deleted!");
			}else{
				System.out.println("Delete operation is failed.");
			}

		}catch(Exception e){

			e.printStackTrace();

		}	
	}
	}
	}
	i++;
}

br.close();
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
%>
</table> 
<!-- 

-->
</center>
</body>
</html>