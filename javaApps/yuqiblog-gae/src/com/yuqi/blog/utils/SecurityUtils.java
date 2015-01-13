package com.yuqi.blog.utils;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.StringUtils;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * 加密解密工具类
 * 
 * @author 唐伯琦
 * 
 */
public class SecurityUtils {
	public static final String md5(String s) {
		return DigestUtils.md5Hex(s);
	}

	public static final String encode(String s) {
		byte[] bytes1 = StringUtils.getBytesUtf8(s);
		return Base64.encodeBase64String(bytes1);
	}
	
	public static final String decode(String s) {
		byte[] bytes1 = Base64.decodeBase64(s);
		return StringUtils.newStringUtf8(bytes1);
	}
}
