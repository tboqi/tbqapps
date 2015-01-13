package com.cc.cw.service;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailService {
    protected static final Log log = LogFactory.getLog(MailService.class);

    private JavaMailSenderImpl mailSender;
    public void setMailSender(JavaMailSenderImpl mailSender) {
        this.mailSender = mailSender;
    }
    
    public void setVelocityEngine(VelocityEngine velocityEngine) {
    }

//    public void sendEmail(String email) throws Exception{
//    	MimeMessage message = ((JavaMailSenderImpl)mailSender).createMimeMessage();
//    	MimeMessageHelper messageHelper = new MimeMessageHelper(message,"GBK");
//    	messageHelper.setTo(email);
//		messageHelper.setFrom("duzeh@126.com");
//		messageHelper.setSubject("test");
//		messageHelper.setText("<html><head></head><body><a href='http://www.xiaoshuo.com'><h1>小说网<h1></a></body></html>",true);
//		((JavaMailSenderImpl)mailSender).send(message);
//    }
    
    @SuppressWarnings("unchecked")
	public void sendEmail(String email,Map model) throws Exception{
    	MimeMessage message = mailSender.createMimeMessage();
    	MimeMessageHelper messageHelper = new MimeMessageHelper(message,"gb2312");
    	messageHelper.setTo(email);
		messageHelper.setFrom("mail.rumour@gmail.com");
		messageHelper.setSubject("确认信");
		String result = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
				"<html xmlns=\"http://www.w3.org/1999/xhtml\">" +
				"<head>" +
				"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />" +
				"<title>确认信</title>" +
				"</head>" +
				"<body><p>亲爱的"+ model.get("userName") +"：</p>" +
				"<p>您好！</p>" +
				"<p>您用此信箱在传闻网(<a href=\"http://www.chuanwen.com.cn\">http://www.chuanwen.com.cn/</a>)注册了一个帐户，这是一封确认信。" +
				"<p>您的帐户信息如下 ：<br />" +
				"&nbsp;&nbsp;&nbsp;&nbsp;用户名：    "+ model.get("userName") +"<br />" +
				"<p>您需要点击下面链接进行确认，确认以后您就可以使用传闻网为您提供的的服务：<br/>" +
				"激活:<a href=\"http://www.chuanwen.com.cn/affirm.action?uuid="+model.get("uuid")+"&userName="+model.get("encodeName")+"\">http://www.chuanwen.com.cn/affirm.action?uuid="+model.get("uuid")+"&userName="+model.get("encodeName")+"</a></p>" +
				"<p>如果您的email程序不支持链接点击，请将上面的地址拷贝至您的浏览器(如IE)的地址栏进入传闻网。</p>" +
				"<p>如果您没有在我们的网站注册，请您不要理会这封EMAIL，给您造成的麻烦，我们表示歉意!</p>" +
				"</body></html>";
       /* try {
              result = VelocityEngineUtils.mergeTemplateIntoString(
                      velocityEngine, "accountCreated.vm", model);
        } catch (VelocityException e) {
              e.printStackTrace();
        }*/
		messageHelper.setText(result,true);
		mailSender.send(message);
    }
    
    /**
     * 发送密码
     * @param email
     * @param content
     */
    public void sendEmail(String email,String userName,String password) throws Exception {
    	MimeMessage message = mailSender.createMimeMessage();
    	MimeMessageHelper messageHelper = new MimeMessageHelper(message,"gb2312");
    	messageHelper.setTo(email);
		messageHelper.setFrom("mail.rumour@gmail.com");
		messageHelper.setSubject("传闻网");
		String result ="<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">" +
		"<html xmlns=\"http://www.w3.org/1999/xhtml\">" +
		"<head>" +
		"<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />" +
		"<title>找回密码</title>" +
		"</head>" +
		"<body><p>"+userName +"您好，您在传闻网的密码为 :" + password+
		"欢迎登录<a href=\"http://www.chuanwen.com.cn/\">传闻网</a>"+
		"</body></html>";
		messageHelper.setText(result,true);
		mailSender.send(message);
    }
}