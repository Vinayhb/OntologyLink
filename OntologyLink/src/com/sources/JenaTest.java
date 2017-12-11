package com.sources;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.LinkedList;

import org.apache.jena.query.DatasetAccessor;
import org.apache.jena.query.DatasetAccessorFactory;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.query.ResultSetFormatter;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.RDFNode;



public class JenaTest {

	public static void uploadRDF(File rdf, String serviceURI)
			throws IOException {

		// parse the file
		Model m = ModelFactory.createDefaultModel();
		try (FileInputStream in = new FileInputStream(rdf)) {
			m.read(in, null, "RDF/XML");
		}

		// upload the resulting model
		DatasetAccessor accessor = DatasetAccessorFactory
				.createHTTP(serviceURI);
		accessor.putModel(m);
	}

	public static LinkedList<String> execSelectAndPrint(String serviceURI, String query) throws FileNotFoundException {
		LinkedList<String> l=new LinkedList<String>();
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
		ResultSet results = q.execSelect();
		OutputStream output = new FileOutputStream("d:/subjects.csv");
		ResultSetFormatter.outputAsCSV(output, results);
		//ResultSetFormatter.out(System.out,results);
		//String str=ResultSetFormatter.asText(results);
		/*while (results.hasNext()) {
			QuerySolution soln = results.nextSolution();
			
			RDFNode x = soln.get("x");
			//System.out.println("Val="+soln.get("x"));
			//System.out.println(x);
			System.out.println(results.next());
			l.add(""+results.next());
		}*/
		//ResultSetFormatter.outputAsCSV(output, results);
		//System.out.println("Out="+str);
		/*for(String s:l)
		{
			System.out.println(s);
		}*/
		return l;
	}
	public static LinkedList<String> execSelectAndPrint1(String serviceURI, String query) throws FileNotFoundException {
		LinkedList<String> l=new LinkedList<String>();
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
		ResultSet results = q.execSelect();
		OutputStream output = new FileOutputStream("d:/predicates.csv");
		ResultSetFormatter.outputAsCSV(output, results);
		//ResultSetFormatter.out(System.out,results);
		//String str=ResultSetFormatter.asText(results);
		/*while (results.hasNext()) {
			QuerySolution soln = results.nextSolution();
			
			RDFNode x = soln.get("x");
			//System.out.println("Val="+soln.get("x"));
			//System.out.println(x);
			System.out.println(results.next());
			l.add(""+results.next());
		}*/
		//ResultSetFormatter.outputAsCSV(output, results);
		//System.out.println("Out="+str);
		/*for(String s:l)
		{
			System.out.println(s);
		}*/
		return l;
	}
	public static LinkedList<String> execSelectAndPrint2(String serviceURI, String query,String fn) throws FileNotFoundException {
		
		LinkedList<String> l=new LinkedList<String>();
		try
		{
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
		ResultSet results = q.execSelect();
		OutputStream output = new FileOutputStream(fn);
		ResultSetFormatter.outputAsCSV(output, results);
		//ResultSetFormatter.out(System.out,results);
		//String str=ResultSetFormatter.asText(results);
		/*while (results.hasNext()) {
			QuerySolution soln = results.nextSolution();
			
			RDFNode x = soln.get("x");
			//System.out.println("Val="+soln.get("x"));
			//System.out.println(x);
			System.out.println(results.next());
			l.add(""+results.next());
		}*/
		//ResultSetFormatter.outputAsCSV(output, results);
		//System.out.println("Out="+str);
		/*for(String s:l)
		{
			System.out.println(s);
		}*/
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		return l;
	}
	public static LinkedList<String> execSelectAndPrint3(String serviceURI, String query) throws FileNotFoundException {
		LinkedList<String> l=new LinkedList<String>();
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,query);
		ResultSet results = q.execSelect();
		OutputStream output = new FileOutputStream("d:/triples.csv");
		ResultSetFormatter.outputAsCSV(output, results);
		//ResultSetFormatter.out(System.out,results);
		//String str=ResultSetFormatter.asText(results);
		/*while (results.hasNext()) {
			QuerySolution soln = results.nextSolution();
			
			RDFNode x = soln.get("x");
			//System.out.println("Val="+soln.get("x"));
			//System.out.println(x);
			System.out.println(results.next());
			l.add(""+results.next());
		}*/
		//ResultSetFormatter.outputAsCSV(output, results);
		//System.out.println("Out="+str);
		/*for(String s:l)
		{
			System.out.println(s);
		}*/
		return l;
	}
	public static void execSelectAndProcess(String serviceURI, String query) {
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,
				query);
		ResultSet results = q.execSelect();

		while (results.hasNext()) {
			QuerySolution soln = results.nextSolution();
			// assumes that you have an "?x" in your query
			RDFNode x = soln.get("x");
			//System.out.println(x);
		}
	}
public static void Search(String skey) throws FileNotFoundException
{
	LinkedList<String> l1=(LinkedList<String>)execSelectAndPrint1("http://localhost:3030/personaldb","prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
			"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
			"prefix owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
			"\r\n" + 
			"SELECT distinct ?predicate \r\n" + 
			"WHERE {\r\n" + 
			"  <http://dbpedia.org/resource/"+skey+"> ?predicate ?object\r\n" + 
			"}\r\n" + 
			"limit 25");
	
}
public static void Search2(String skey,String pred,String fn) throws FileNotFoundException
{
	LinkedList<String> l2=(LinkedList<String>)execSelectAndPrint2("http://localhost:3030/personaldb","prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
			"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
			"prefix owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
			"\r\n" + 
			"SELECT distinct ?object \r\n" + 
			"WHERE {\r\n" + 
			"  <http://dbpedia.org/resource/"+skey+"> 	\r\n" +"<"+pred+">"+
			" ?object\r\n" + 
			"}\r\n" + 
			"limit 25",fn);
	
}
public static void Search3(String skey) throws FileNotFoundException
{
	LinkedList<String> l1=(LinkedList<String>)execSelectAndPrint3("http://localhost:3030/personaldb","select ?predicate ?object where {<http://dbpedia.org/resource/"+skey+"> ?predicate ?object}");
	
}
public static void Search4(String skey) throws FileNotFoundException
{
	LinkedList<String> l1=(LinkedList<String>)execSelectAndPrint3("http://localhost:3030/citydb","select ?predicate ?object where {<http://dbpedia.org/resource/"+skey+"> ?predicate ?object}");
	
}
	public JenaTest() throws IOException {
		// uploadRDF(new File("test.rdf"), );
		/*LinkedList<String> l=(LinkedList<String>)execSelectAndPrint("http://localhost:3030/personaldb","prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
				"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
				"prefix owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
				"\r\n" + 
				"SELECT distinct ?predicate \r\n" + 
				"WHERE {\r\n" + 
				"  <http://dbpedia.org/resource/Betty_Hamilton> ?predicate ?object\r\n" + 
				"}\r\n" + 
				"limit 25");*/
		LinkedList<String> l1=(LinkedList<String>)execSelectAndPrint1("http://localhost:3030/personaldb","prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
				"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
				"prefix owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
				"\r\n" + 
				"SELECT distinct ?predicate \r\n" + 
				"WHERE {\r\n" + 
				"  <http://dbpedia.org/resource/Betty_Hamilton> ?predicate ?object\r\n" + 
				"}\r\n" + 
				"limit 25");
		
		LinkedList<String> l2=(LinkedList<String>)execSelectAndPrint2("http://localhost:3030/personaldb","prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>\r\n" + 
				"prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>\r\n" + 
				"prefix owl: <http://www.w3.org/2002/07/owl#>\r\n" + 
				"\r\n" + 
				"SELECT distinct ?object \r\n" + 
				"WHERE {\r\n" + 
				"  <http://dbpedia.org/resource/Betty_Hamilton> 	\r\n" + 
				"<http://purl.org/dc/elements/1.1/description> ?object\r\n" + 
				"}\r\n" + 
				"limit 25","d:/objects.csv");
		
		/*for(String s:l)
		{
			System.out.println(s);
		}*/

	}
	public static void main(String args[]) throws IOException
	{
		new JenaTest();
	}
}