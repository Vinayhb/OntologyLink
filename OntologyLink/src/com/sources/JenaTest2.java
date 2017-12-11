package com.sources;

import java.io.*;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;


public class JenaTest2 extends Object {
  public static void main (String args[]) {
  String inputFile="D:\\DB\\authors1.rdf";
  Model model = ModelFactory.createDefaultModel();
 try{
 InputStream in =new  FileInputStream(inputFile);
  if (in == null) {  
  System.out.println("File not found");
 }  
  model.read(in," ");
  model.write(System.out);
 }catch(Exception e){}
  }
}