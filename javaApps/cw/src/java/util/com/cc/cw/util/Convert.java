package com.cc.cw.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Convert Utilities.
 * 
 * @author Xiatian
 * @version 1.0
 */
public class Convert {
	/**
	 * convert string to integer
	 * 
	 * @param src
	 * @param defaultValue
	 * @return
	 */
	public static int strToInt(String src, int defaultValue) {
		int rtn = defaultValue;

		try {
			rtn = Integer.parseInt(src);
		} catch (Exception e) {
		}

		return rtn;
	}

	/**
	 * convert string to long
	 * 
	 * @param src
	 * @param defaultValue
	 * @return
	 */
	public static long strToLong(String src, long defaultValue) {
		long rtn = defaultValue;

		try {
			rtn = Long.parseLong(src);
		} catch (Exception e) {
		}

		return rtn;
	}

	public static String htmlSpecialChars(String s) {
		String rtn = s;
		if (s == null || s.length() == 0) {
			return "";
		}
		rtn = rtn.replaceAll("<", "&lt;");
		rtn = rtn.replaceAll(">", "&gt;");
		rtn = rtn.replaceAll("\n", "<br>");
		rtn = rtn.replaceAll("\"", "'");
		return rtn;
	}

	public static String htmlSpecialCharsEx(String s) {
		if (s == null || s.length() == 0) {
			return "";
		}
		String rtn = s;
		rtn = rtn.replaceAll("\n", "<br>");
		rtn = rtn.replaceAll("\"", "'");
		return rtn;
	}

	public static String charsToHtml(String s) {
		if (s == null || s.length() == 0) {
			return "";
		}
		String rtn = s;
		rtn = rtn.replaceAll("<br>", "\n");
		rtn = rtn.replaceAll("<BR>", "\n");
		rtn = rtn.replaceAll("'", "\"");
		return rtn;
	}

	public static Date fomateDate(String s, String f) {
		Date rtn = null;
		SimpleDateFormat formatter = new SimpleDateFormat(f);
		try {
			rtn = formatter.parse(s);
		} catch (Exception e) {
		}
		return rtn;
	}

	public static String formatDate(Date d) {
		return formatDate(d, "E,yyyy-MM-dd HH:mm:ss");
	}

	public static String formatDate(Date d, String formatStr) {
		SimpleDateFormat formatter = new SimpleDateFormat(formatStr);

		if (d == null) {
			return formatter.format(new Date());
		} else {
			return formatter.format(d);
		}
	}

	/**
	 * ȡ�����
	 * 
	 * @return
	 */
	public static String randString() {
		return Math.random() + "";
	}

	/**
	 * ȡ�����,ʹ�����µĳ�ֵ���������ϣ�ȡ6λ
	 * 
	 * @return
	 */
	public static String randStringNew() {
		String s = java.lang.Math.random() + "";
		s = s.substring(3, 9);
		return s;
	}

	/**
	 * �õ���ǰ�ĺ�����
	 */
	public static long getTime() {
		java.util.Date c = new java.util.Date();
		long time = c.getTime();
		return time;
	}

	public static String getHtmlRealText(String str) {
		if (str == null || str.trim().equals("")) {
			return str;
		}
		if (!str.contains("<")) {
			return str;
		}
		str = str.replaceAll("<script.*</script>", "");
		str = str.replaceAll("<SCRIPT.*</SCRIPT>", "");
		str = str.replaceAll("<style.*</style>", "");
		str = str.replaceAll("<STYLE.*</STYLE>", "");
		str = str.replaceAll("</?[^>]+>", ""); // 剔出了<html>的标签
		str = str.replace("&nbsp;", "");
		str = str.replace(".", "");
		str = str.replace("\"", "‘");
		str = str.replace("'", "‘");

		Map<String, String> ESCMap = new HashMap<String, String>();
		ESCMap.put("&ldquo;", "“");
		ESCMap.put("&rdquo;", "”");
		ESCMap.put("&nbsp;", " ");
		ESCMap.put("&quot;", "\"");

		Set<String> keySet = ESCMap.keySet();
		for (String key : keySet) {
			if (str.contains(key)) {
				str = str.replaceAll(key, ESCMap.get(key));
			}
		}
		return str;
	}

	/**
	 * ������Ҫ�ĳ���
	 * 
	 * @param s
	 *            ԭ�ַ�
	 * @param length
	 *            ��Ҫ�ĳ���
	 * @param str
	 *            ��Ҫ������ַ�
	 * @return
	 */
	public static String getLengString(String s, int length, String appstr) {
		String str = s;
		if (str == null) {
			str = "";
		}

		str = str.trim();
		for (int i = str.length(); i < length; i++) {
			str = appstr + str;
		}
		return str;
	}

	public static String getStringShow(String s, int length) {
		if (s.length() <= length) {
			return s;
		} else {
			s = s.substring(0, length) + "����";
			return s;
		}

	}

	/**
	 * @param s
	 *            ��ת���� java �ַ�.
	 * @param cod
	 *            Ҫ���õı����ַ����
	 * @return ����ָ���ַ������ַ�.
	 */
	public static String transCode(String s, String cod) {
		try {
			if (cod == null)
				return s;
			byte[] bs = s.getBytes();
			return new String(bs, cod);
		} catch (Exception e) {
			return (null);
		}
	}

	/**
	 * ���ַ�����UNICODE�����ʽ�ַ�.
	 * 
	 * @param s
	 *            ԭ�ַ�.
	 * @return �������ַ�.
	 */
	public static String encode(String s) {
		if (s == null || s.length() == 0)
			return "";
		char[] charA = s.toCharArray();
		String t = "";
		String tt = "";
		for (int i = 0; i < charA.length; i++) {
			tt = Integer.toHexString((int) charA[i]);
			if (tt.length() == 2)
				tt = "%" + tt;
			else if (tt.length() == 3)
				tt = "%u0" + tt;
			else
				tt = "%u" + tt;
			t += tt;
		}
		return t;
	}

	public static String string2show(String s) {
		if (s != null)
			s = s.trim();
		if (s == null || s.length() == 0)
			return "&nbsp;";
		else
			return "&nbsp;" + s + "&nbsp;";
	}

	/**
	 * ���ַ�ת��Ϊ�༭��ʽ.
	 * <p>
	 * ����ַ�Ϊ null, ���Զ�ת��Ϊ�ַ� "" �������.
	 * 
	 * @param s
	 *            Ҫ�༭���ַ�.
	 * @return ת��Ϊ�༭��ʽ���ַ�.
	 * @see mis.System.Dt#string2show(java.lang.String)
	 */
	public static String string2edit(String s) {
		return s = Convert.string2edit2(s).trim();
	}

	public static String string2edit2(String s) {
		if (s == null || s.length() == 0)
			return "";
		return s;
	}

	public static int getDateMonth(Date d) {
		DateFormat df = new SimpleDateFormat("MM");

		return Integer.parseInt(df.format(d));
	}

	/*
	 * ���ƴ������ú���ƴ��
	 */

	// public static String getVoice(String str){
	// String mabiao = FileUtil.getStringFromFile("mabiao.txt");
	// int i = 0, len = 0;
	// len = str.length();
	// String outstr = "";
	// for(i=0;i<len;i++){
	// String t = str.substring(i,i+1);
	// int idx = mabiao.indexOf(t);
	// if(idx%12==0)outstr = outstr + mabiao.substring(idx+6,idx+12).trim();
	// else outstr = outstr + t;
	// }
	// return outstr;
	// }

	public static void main(String[] argv) {

	}

	public static String getText(String str) {
		Map<String, String> ESCMap = new HashMap<String, String>();
		ESCMap.put("&ldquo;", "“");
		ESCMap.put("&rdquo;", "”");
		ESCMap.put("&nbsp;", " ");
		ESCMap.put("&quot;", "\"");
		ESCMap.put("&lsquo;", "‘");
		ESCMap.put("&rsquo;", "’");
		String text = getHtmlRealText(str);
		Set<String> keySet = ESCMap.keySet();
		for (String key : keySet) {
			if (text.contains(key)) {
				text = text.replaceAll(key, ESCMap.get(key));
			}
		}
		return text;
	}
}
