package com.cc.cw.util;

import java.util.Date;

public class ValidateUtil {
	public static boolean checkEmail(String email) {

		if (email == null || email.trim().equals("")) {
			return false;
		}
		email = email.toLowerCase();
		return email.matches("^[_a-z0-9.]+@([_a-z0-9]+\\.)+[a-z0-9]{2,3}$");
	}

	public static boolean checkPassword(String s1, String s2) {
		boolean flag = false;
		if (s1 == null || s1.trim().equals("") || s2.trim().equals("")
				|| s2 == null) {
			return flag;
		}
		if (s1.equals(s2)) {
			flag = true;
		}
		return flag;
	}

	public static boolean checkString(String str) {
		return !(str == null || str.trim().equals(""));
	}

	/** 检查是否小于当前时间 */
	public static boolean checkDate(String date) {
		return date.equals("") || new Date().getTime() > DateTimeUtil.parseStringToDate(date).getTime();
	}
	
	/**
	 *  检查是否是数字 
	 * @param num
	 * @param giveDefault 如果字符串有可能为空，是否设置默认值
	 * @return
	 */
	public static boolean isNumber(String num,boolean giveDefault){
		if(giveDefault)
			if(num == null || num.equals(""))
				num = "0";
		try{
			Integer.parseInt(num.replaceAll(" ", ""));
		}catch(NumberFormatException nfe){
			return false;
		}
		return true;
	}
	
	public static void main(String[] args){

	}
}
