package com.cc.cw.web.output;

import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork.ActionSupport;

/**
 * ActionSupport的基本继承类，可以在该类中实现特定方法，方便子类处理
 *
 * @author <a href="mailto:xiat@ruc.edu.cn">Gavin XIA</a>
 * @version 1.0
 * @date 2006-7-6 10:54:56
 */
@SuppressWarnings("serial")
public class BaseActionSupport extends ActionSupport {
	protected transient Log log = LogFactory.getLog(getClass());
	/**
	 * 获取地区信息，实现i18n功能, 暂时继承于AcctionSupport，以后可以根据需要从数据库
	 * 或者用户配置信息中设置该值
	 */
	@Override
	public Locale getLocale(){
		return super.getLocale();
	}
}
