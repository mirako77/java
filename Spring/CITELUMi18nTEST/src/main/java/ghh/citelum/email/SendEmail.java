package ghh.citelum.email;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendEmail {
	private static String USER_NAME = "citelum.app";  // GMail user name (just the part before "@gmail.com")
    private static String PASSWORD = "citelum123"; // GMail password
    private static String RECIPIENT = "noreply@citelum.com";


    private static void sendMail(String[] args) {
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = { RECIPIENT }; // list of recipient email addresses
        String subject = "Java send mail example";
        String body = "Welcome to JavaMail!";

        sendFromGMail(from, pass, to, subject, body);
    }

    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
//    	System.out.println("i'm in senMailFromGmail()");
        Properties props = System.getProperties();
//        String host = "smtp.gmail.com";
        String host = "mail.citelum.net";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
//        props.put("mail.smtp.user", from);
//        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "25"); // 587
        props.put("mail.smtp.auth", "false");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
//        	System.out.println("i'm in try block senMailFromGmail()");
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setContent(body, "text/html");
//            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
//            System.out.println("i'm in END OF try block senMailFromGmail()");
        }
        catch (AddressException ae) {
//        	System.out.println("i'm in catch1 block senMailFromGmail()");
            ae.printStackTrace();
        }
        catch (MessagingException me) {
//        	System.out.println("i'm in catch2 block senMailFromGmail()");
            me.printStackTrace();
        }
    }

	public static void sendMail(List<String> toList, String subject, String body) {
		String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = toList.toArray(new String[0]);
//        String[] to = { RECIPIENT }; // list of recipient email addresses
//        System.out.println("i'm in senMail()");


        sendFromGMail(from, pass, to, subject, body);

	}

	public static void sendMail(String[] to, String subject, String body) {
		String from = USER_NAME;
		String pass = PASSWORD;
		sendFromGMail(from, pass, to, subject, body);
	}

};
