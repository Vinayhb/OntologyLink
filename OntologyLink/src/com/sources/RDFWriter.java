package com.sources;

import java.io.*;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.vocabulary.VCARD;

public class RDFWriter extends Object {
  public static void main (String args[]) {
  String personURI  = "http://amitKumar";
  String givenName  = "Amit";
  String familyName = "Kumar";
  String fullName = givenName+" "+familyName;

  Model model = ModelFactory.createDefaultModel();

  Resource node = model.createResource(personURI)
 .addProperty(VCARD.FN, fullName)
 .addProperty(VCARD.N,
  model.createResource()
 .addProperty(VCARD.Given, givenName)
 .addProperty(VCARD.Family, familyName));
  try{
  FileOutputStream fout=new FileOutputStream(
  "D:\\OutputRDF\\amitKumar.xml");
  model.write(fout);
  }catch(IOException e){
  System.out.println("Exception caught"+e.getMessage());
  }
  }
}
