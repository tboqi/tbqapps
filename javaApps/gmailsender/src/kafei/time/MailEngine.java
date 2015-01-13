package kafei.time;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class MailEngine {
	protected static final Log log = LogFactory.getLog(MailEngine.class);

	private FreeMarkerConfigurer freeMarkerConfigurer;
	// private VelocityEngine velocityEngine;
	private JavaMailSender mailSender;

	public void setFreeMarkerConfigurer(
			FreeMarkerConfigurer freeMarkerConfigurer) {
		this.freeMarkerConfigurer = freeMarkerConfigurer;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	// public void setVelocityEngine(VelocityEngine velocityEngine) {
	// this.velocityEngine = velocityEngine;
	// }

	/**
	 * 通过模板产生邮件正文
	 * 
	 * @param templateName
	 *            邮件模板名称
	 * @param map
	 *            模板中要填充的对象
	 * @return 邮件正文（HTML）
	 * @throws IOException
	 * @throws TemplateException 
	 */
	public String generateEmailContent(String templateName, Map map)
			throws IOException, TemplateException {
//		Configuration cfg = new Configuration();
//		cfg.setDirectoryForTemplateLoading(new File("D:/ftl"));
//		cfg.setObjectWrapper(new DefaultObjectWrapper());  
//		// Create the root hash
//		Map root = new HashMap();
//		// Put string ``user'' into the root
//		root.put("user", "Big Joe");
//		// Create the hash for ``latestProduct''
//		Map latest = new HashMap();
//		// and put it into the root
//		root.put("latestProduct", latest);
//		// put ``url'' and ``name'' into latest
//		latest.put("url", "products/greenmouse.html");
//		latest.put("name", "green mouse"); 
//		Template temp = cfg.getTemplate("test.ftl"); 
//		Writer out = new OutputStreamWriter(System.out);
//		temp.process(root, out);
//		out.flush();  
		// 使用FreeMaker模板
//		 try {
		 Configuration configuration =
		 freeMarkerConfigurer.getConfiguration();
		 configuration.setDirectoryForTemplateLoading(new File("D:/ftl"));
		 Template t = configuration.getTemplate(templateName);
		 return FreeMarkerTemplateUtils.processTemplateIntoString(t, map);
		// } catch (TemplateException e) {
		// log.error("Error while processing FreeMarker template ", e);
		// } catch (FileNotFoundException e) {
		// e.printStackTrace();
		// // log.error("Error while open template file ", e);
		// } catch (IOException e) {
		// log.error("Error while generate Email Content ", e);
		// }

		// 使用Vilocity模板
		// try {
		// return VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,
		// templateName, map);
		// } catch (VelocityException e) {
		// log.error("Error while processing Vilocity template ", e);
//		// }
//
//		return null;
	}

	/**
	 * 发送邮件
	 * 
	 * @param emailAddress
	 *            收件人Email地址的数组
	 * @param fromEmail
	 *            寄件人Email地址, null为默认寄件人web@vnvtrip.com
	 * @param bodyText
	 *            邮件正文
	 * @param subject
	 *            邮件主题
	 * @param attachmentName
	 *            附件名
	 * @param resource
	 *            附件
	 * @throws MessagingException
	 */
	public void sendMessage(String[] emailAddresses, String fromEmail,
			String bodyText, String subject, String attachmentName,
			ClassPathResource resource) throws MessagingException {
		MimeMessage message = ((JavaMailSenderImpl) mailSender)
				.createMimeMessage();

		// use the true flag to indicate you need a multipart message
		MimeMessageHelper helper = new MimeMessageHelper(message, true);

		helper.setTo(emailAddresses);
		if (fromEmail != null) {
			helper.setFrom(fromEmail);
		}
		helper.setText(bodyText, true);
		helper.setSubject(subject);

		if (attachmentName != null && resource != null)
			helper.addAttachment(attachmentName, resource);

		((JavaMailSenderImpl) mailSender).send(message);
	}

	/**
	 * 发送简单邮件
	 * 
	 * @param msg
	 */
	public void send(SimpleMailMessage msg) {
		try {
			((JavaMailSenderImpl) mailSender).send(msg);
		} catch (MailException ex) {
			// log it and go on
			log.error(ex.getMessage());
		}
	}
	public static void main(String[] args) throws MessagingException, IOException, TemplateException {
		Resource rs = new FileSystemResource(
				"D:/tbq/workspace/wtp/gmailsender/src/gmailsender.xml");
		BeanFactory factory = new XmlBeanFactory(rs);
		MailEngine engine = (MailEngine) factory.getBean("mailEngine");
		MimeMessage me = engine.getMailSender().createMimeMessage();
		MimeMessageHelper message = new MimeMessageHelper(me, true, "utf-8");
		message.setTo("tboqi1@gmail.com");
		message.setSubject("test");
		message.setFrom("tboqi301709@gmail.com");

		Map<String, String> model = new HashMap<String, String>();
		model.put("name", "name");
		model.put("password", "password");
		String content = engine.generateEmailContent("NotifyUser.ftl",
				model);
		message.setText(content, true);
		engine.getMailSender().send(me);
		// Vilocity模板
		// engine.send(message, "notifyUser.vm", model);
		// FreeMaker模板
		// engine.send(message, "NotifyUser.ftl", model);
	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}
}
