package mail;

import java.security.Security;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class GmailSender implements MailSender {

	public boolean sendMail(Email email){
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// Get a Properties object
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.auth", "true");
		final String username = "tboqi301709";
		final String password = "tbq301709";
		Session session = Session.getDefaultInstance(props,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

		// -- Create a new message --
		Message msg = new MimeMessage(session);

		// -- Set the FROM and TO fields --
		try {
			msg.setFrom(new InternetAddress(email.getFromAddress()));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(
					email.getToAddress(), false));
			msg.setSubject(email.getTitle());
			msg.setText(email.getContent());
			msg.setSentDate(new Date());
			Transport.send(msg);
			System.out.println("Message sent.");
			return true;
		} catch (AddressException e) {
			System.out.println("Message sent. faild");	
			e.printStackTrace();
			return false;
		} catch (MessagingException e) {
			System.out.println("Message sent. faild");	
			e.printStackTrace();
			return false;
		}
		

		
	}
}