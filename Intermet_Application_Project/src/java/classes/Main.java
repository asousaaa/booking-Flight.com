package classes;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public final class Main
{
    private String from ="adeweb0@gmail.com";
    private String to ="aya.m2016@gmail.com" ;
    private String subject ="try";
    private String message="hello" ;
    private String login = "adeweb0@gmail.com";
    private String password = "adeweb00";

    /**
     * @return the from
     */
    public String getFrom() {
        return from;
    }

    /**
     * @param from the from to set
     */
    public void setFrom(String from) {
        this.from = from;
    }

    /**
     * @return the to
     */
    public String getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(String to) {
        this.to = to;
    }

    /**
     * @return the subject
     */
    public String getSubject() {
        return subject;
    }

    /**
     * @param subject the subject to set
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    
    private class SMTPAuthenticator extends Authenticator
    {
        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password)
        {
             authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication()
        {
             return authentication;
        }
    }

    public void mail()
    {
        try
        {
            

            Properties props = new Properties();
            props.setProperty("mail.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");

            Authenticator auth = new SMTPAuthenticator(login, password);
            Session session = Session.getInstance(props, auth);
            MimeMessage msg = new MimeMessage(session);

           try
           {
                msg.setText(getMessage());
                msg.setSubject(getSubject());
                msg.setFrom(new InternetAddress(getFrom()));
                msg.addRecipient(Message.RecipientType.TO,
                new InternetAddress(getTo()));
                Transport.send(msg);
           }
           catch (MessagingException ex)
           {
                Logger.getLogger(Main.class.getName()).
                log(Level.SEVERE, null, ex);
           }
          
        }
         catch(Exception e)
           {
               
           }
    }
}
