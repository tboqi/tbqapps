package kafei.time;

import javax.mail.MessagingException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

public class MailTest { 
    public static void main(String[] args) throws MessagingException { 
        Resource rs = 
            new FileSystemResource("D:/tbq/workspace/wtp/gmailsender/src/gmailsender.xml"); 
        BeanFactory factory = 
            new XmlBeanFactory(rs); 
        
        kafei.time.MailService mailservice = 
            (MailService) factory.getBean("mailService"); 
        mailservice.send();
    } 
}