package com.sources;
import java.io.*;
public class Test {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		FileInputStream fis = new FileInputStream("d:/predicates.csv");

		//Construct BufferedReader from InputStreamReader
		BufferedReader br = new BufferedReader(new InputStreamReader(fis));

		String line = null;
		int i=1;
		while ((line = br.readLine()) != null ) {
		System.out.println("V="+line);
		}
	}

}
