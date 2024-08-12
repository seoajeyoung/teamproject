package com.itwillbs.service;

import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    private static final String SENDER_EMAIL = "nopuedovivirsinti0726@gmail.com";
    private static final String SENDER_PASSWORD = "ekki fshu wlvk ygud";

    public void sendEmail(String receiver, String title, String content) throws Exception {
        Properties properties = System.getProperties();
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");

        Authenticator auth = new GoogleSMTPAuthenticator();
        Session mailSession = Session.getDefaultInstance(properties, auth);
        Message mailMessage = new MimeMessage(mailSession);

        Address sender_addr = new InternetAddress(SENDER_EMAIL, "아이티윌");
        Address receiver_addr = new InternetAddress(receiver);

        mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
        mailMessage.setFrom(sender_addr);
        mailMessage.addRecipient(RecipientType.TO, receiver_addr);
        mailMessage.setSubject(title);
        mailMessage.setContent(content, "text/html; charset=UTF-8");
        mailMessage.setSentDate(new Date());

        Transport.send(mailMessage);
    }

    private class GoogleSMTPAuthenticator extends Authenticator {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
        }
    }
}