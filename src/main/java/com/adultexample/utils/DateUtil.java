package com.adultexample.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	 public static final SimpleDateFormat DATE_FORMAT =  new SimpleDateFormat("yyyy-MM-dd");
	
	 public static String getTodayDate() {
	        return DATE_FORMAT.format(new Date());  
	    }
	 
	 public static String getWeekDate(){
		 Calendar cal =Calendar.getInstance();
		 cal.setTime(new Date());
		 cal.add(Calendar.DATE, -7);
		 Date d=cal.getTime();
		 return DATE_FORMAT.format(d);
	 }
	 
	 public static void main(String[] args) {
		System.out.println(getTodayDate());
	}
}
