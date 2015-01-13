package mail;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public interface MailSender {

  public boolean sendMail(Email email) throws AddressException, MessagingException;
}