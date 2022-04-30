package online_movie_tickets;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class forgot{
	public static void sendmail(String recepient) {
		System.out.println("prepareing message sent");
		Properties pro = new Properties();
		System.out.println("1");
		pro.put("mail.smtp.auth", "true");
		System.out.println("2");
		pro.put("mail.smtp.starttls.enable", "true");
		System.out.println("3");
		pro.put("mail.smtp.host", "smtp.gmail.com");
		System.out.println("4");
		pro.put("mail.smtp.port", "587");
		System.out.println("5");
		String myaccount="devarshmistry21@gnu.ac.in";
		System.out.println("6");
		String password="dev@rsh26";
		System.out.println("7");
		
		Session session = Session.getInstance(pro,new Authenticator() {
		 @Override
		protected PasswordAuthentication getPasswordAuthentication() {
			 System.out.println("8");
			return new PasswordAuthentication(myaccount, password);
		 }
			});
		 System.out.println("9");
		Message message =preparedMessage(session,myaccount,recepient);
		 System.out.println("10");

		try {
			 System.out.println("11");
			Transport.send(message);
			System.out.println("message sent");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static Message preparedMessage(Session session, String myaccount, String recepient) {
		Message message = new MimeMessage(session);
		try {
			Random num = new Random();
			 System.out.println("12");
			message.setFrom(new InternetAddress(myaccount));
			 System.out.println("13");
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			 System.out.println("14");
			message.setSubject("Login verification");
			 System.out.println("15");
			  message.setText("this msg is one time password,not shere code 3223");

			  Random num1 = new Random();
		      int res;
		      for ( int i = 1; i <= 5; i++ ) {
		         res = 1 + num1.next( 10 );
		         System.out.printf( "%d ", res );
		       
		      }

			 System.out.println("16");
			return message; 
			
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}	
}