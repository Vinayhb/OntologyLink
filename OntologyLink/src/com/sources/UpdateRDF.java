package com.sources;

import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.vocabulary.VCARD;

/**
 * Servlet implementation class UpdateRDF
 */
@WebServlet("/UpdateRDF")
public class UpdateRDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRDF() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String personURI  = "http://dbpedia.org/resources/";
		 
		 String givenName=String.valueOf(request.getParameter("givenName"));
		 String deathDate=String.valueOf(request.getParameter("deathDate"));
		 String name=String.valueOf(request.getParameter("name"));
		 String birthDate=String.valueOf(request.getParameter("birthDate"));
		 String surname=String.valueOf(request.getParameter("surname"));
		 String description=String.valueOf(request.getParameter("description"));
		 String birthPlace=String.valueOf(request.getParameter("birthPlace"));
		 String deathPlace=String.valueOf(request.getParameter("deathPlace"));
		 String fullName = givenName+" "+name;
		 Model model = ModelFactory.createDefaultModel();

		  Resource node = model.createResource(personURI)
		 .addProperty(VCARD.FN, fullName)
		 .addProperty(VCARD.BDAY, birthDate)
		 .addProperty(VCARD.NAME, name)
		 .addProperty(VCARD.NAME, surname)
		 .addProperty(VCARD.BDAY, deathDate)
		 .addProperty(VCARD.CLASS, description)
		 .addProperty(VCARD.CLASS, birthPlace)
		 .addProperty(VCARD.CLASS, deathPlace)
		 .addProperty(VCARD.N,
		  model.createResource()
		 .addProperty(VCARD.Given, givenName)
		 .addProperty(VCARD.Family, name));
		  try{
		  FileOutputStream fout=new FileOutputStream(
		  "D:\\OutputRDF\\UpdateRDF.xml");
		  model.write(fout);
		  }catch(IOException e){
		  System.out.println("Exception caught"+e.getMessage());
		  }
		  response.sendRedirect("Search.jsp");
	}

}
