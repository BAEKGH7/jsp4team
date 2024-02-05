package com.teamfour.util;

public class Util {
	//string to int
	public static int str2Int(String str) {
		str = str.replaceAll("[^0-9]", "");
		
		return Integer.parseInt(str);
	}
}
