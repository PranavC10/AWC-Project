package com.helper;

import java.awt.AWTException;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.Socket;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
//import java.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

 
/*
 */
public class StringHelper {
	public static void main(String[] args) throws AWTException {
//		StringBuffer sv= readFileContent("C:\\Users\\technowings-pc\\Desktop\\a.html");
//		System.out.println(sv);

		System.out.println(readURLContent("https://www.google.com"));
		
	}
	public static String n2s(String d){ 
		String dual="";
		if(d==null){
			dual =  "";
		}
		else
			dual=d.toString().trim();
		
		return dual;
	}
	public static boolean  n2b(Object d){
		boolean  dual=false;
		if(d==null){  
			dual =  false;
		}
		else
			dual=new Boolean(d.toString()).booleanValue();
		
		return dual;
	}
	public static String n2s(Object d){
		String dual="";
		if(d==null){
			dual =  "";
		}
		else
			dual=d.toString().trim();
		
		return dual;
	}
	public static float  nullObjectToFloatEmpty(Object d){
		float i=0;
		if(d!=null){
			String dual=d.toString().trim();
			try{
				i=new Float(dual).floatValue();
			}catch (Exception e) {
				System.out.println("Unable to find integer value");	
			}
		}
		return i;
	}
        public static double round(double value, int places) {
if (places < 0)
throw new IllegalArgumentException();

BigDecimal bd = new BigDecimal(value);
bd = bd.setScale(places, RoundingMode.HALF_UP);
return bd.doubleValue();
}
        
        
	public static double  n2d(Object d){
		double i=0;
		if(d!=null){
			String dual=d.toString().trim();
			try{
				i=new Double(dual).doubleValue();
			}catch (Exception e) {
				System.out.println("Unable to find integer value");	
			}
		}
		return i;
	}
	public static float  n2f(Object d){  
		float i=0;
		if(d!=null){
			String dual=d.toString().trim();
			try{
				i=new Float(dual).floatValue();
			}catch (Exception e) {
				System.out.println("Unable to find integer value");	
			}
		}
		return i;
	}
	public static int n2i(Object d){
		int i=0;
		if(d!=null){
			String dual=d.toString().trim();
			try{
				i=new Integer(dual).intValue();
			}catch (Exception e) {
				System.out.println("Unable to find integer value");	
			}
		}
		return i;
	}
	public static StringBuffer readURLContent(String url) {
		System.out.println("URL " + url);
		StringBuffer json = new StringBuffer();
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(new URL(url).openStream()));
			String line;
			while ((line = in.readLine()) != null) {
				json.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}
	public static StringBuffer readFileContent(String filepath) {
	      
	      InputStream is = null;
	      int i;
	      char c;
	      StringBuffer sb=new StringBuffer();
	      try{
	         // new input stream created
	         is = new FileInputStream(filepath);
	         
	         System.out.println("Characters printed:");
	         byte[] b=new byte[1024];
	         // reads till the end of the stream
	         while((i=is.read(b))!=-1)
	         {
	            // converts integer to character
	            
	            String s=new String(b);
	            sb.append(s.trim());
	         }
	      }catch(Exception e){
	         
	         // if any I/O error occurs
	         e.printStackTrace();
	      }finally{
	         
	         // releases system resources associated with this stream
	         if(is!=null)
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	      }
	      return sb;
	   }
//	  public static HashMap sortByValues(HashMap map) { 
//	       List list = new LinkedList(map.entrySet());
//	       // Defined Custom Comparator here
//	       Collections.sort(list, new Comparator() {
//	            public int compare(Object o1, Object o2) {
//	               return ((Comparable) ((Map.Entry) (o2)).getValue())
//	                  .compareTo(((Map.Entry) (o1)).getValue());
//	            }
//
//           });
//
//	       // Here I am copying the sorted list in HashMap
//	       // using LinkedHashMap to preserve the insertion order
//	       HashMap sortedHashMap = new LinkedHashMap();
//	       for (Iterator it = list.iterator(); it.hasNext();) {
//	              Map.Entry entry = (Map.Entry) it.next();
//	              sortedHashMap.put(entry.getKey(), entry.getValue());
//	       } 
//	       return sortedHashMap;
//	  }
		public static String getIpAddress(String ipString){
			String IPADDRESS_PATTERN = 
			        "(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)";

			Pattern pattern = Pattern.compile(IPADDRESS_PATTERN);
			Matcher matcher = pattern.matcher(ipString);
			        if (matcher.find()) {
			            return matcher.group();
			        }
			        else{
			            return "0.0.0.0";
			        }
		}
}


