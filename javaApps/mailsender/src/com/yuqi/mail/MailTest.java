package com.yuqi.mail;

import javax.mail.MessagingException;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

public class MailTest { 
    public static void main(String[] args) throws MessagingException { 
        Resource rs = 
            new FileSystemResource("E:/workspace/jee351/mailsender/src/gmailsender1.xml"); 
        Resource rs2 = 
            new FileSystemResource("E:/workspace/jee351/mailsender/src/gmailsender.xml"); 
        BeanFactory factory = 
            new XmlBeanFactory(rs); 
        BeanFactory factory2 = 
            new XmlBeanFactory(rs2); 
        
        MailService mailservice = 
            (MailService) factory.getBean("mailService"); 
        mailservice.send();
        MailEngine me = (MailEngine)factory2.getBean("mailEngine");
        //me.s
    } 
}