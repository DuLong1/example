package com.adultexample.utils;

public class Snippet {
	 //����Ϊ���Դ��룬��������֤��
	    private static int newcode;
	    public static int getNewcode() {
	        return newcode;
	    }
	    public static void setNewcode(){
	        newcode = (int)(Math.random()*9999)+100;  //ÿ�ε������һλ��λ��������
	    }
	    public static String newCode(){
	    	setNewcode();
	    	return Integer.toString(newcode);
	    }
	
}

