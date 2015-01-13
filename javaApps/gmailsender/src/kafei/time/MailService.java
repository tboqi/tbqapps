package kafei.time;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailService  {
    private JavaMailSender mailSender;

    public MailService() {}

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void send() throws MessagingException {
        //创建一个多媒体的邮件
        MimeMessage me=mailSender.createMimeMessage();
        MimeMessageHelper message=new MimeMessageHelper(me,true);

        message.setTo("tboqi1@gmail.com");
        message.setSubject("test");
        message.setText("这是一个测试");
        FileSystemResource img=new FileSystemResource(
                          new File("D:\\tbq\\4691f9350b0469797847679a.jpg"));
        message.addInline("png", img);
        //message.addAttachment("png",img); //将文件作为附件发送
        mailSender.send(me);
        System.out.println("邮件发送成功");

    }

}