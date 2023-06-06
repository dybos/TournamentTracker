using System;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Configuration;

namespace TrackerLibrary
{
    public static class EmailLogic
    {

        public static void SendEmail(string to, string subject, string body)
        {
            SendEmail(new List<string> { to }, new List<string>(), subject, body);
        }
        public static void SendEmail(List<string> to,List<string> bcc, string subject, string body)
        {
            MailAddress fromMailAddress = new MailAddress(GlobalConfig.AppKeyLookup("senderEmail"), GlobalConfig.AppKeyLookup("senderDisplayName"));

            MailMessage mail = new MailMessage();

            foreach (string email in to)
            {
                mail.To.Add(email); 
            }
            foreach (string email in bcc)
            {
                mail.Bcc.Add(email);
            }

            mail.From = fromMailAddress;
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            
            //TODO Discuss, is this a good way to stay this code out of this method

            //SmtpClient client = new SmtpClient();
            //client.Host = ConfigurationManager.AppSettings["smtpHost"];
            //client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
            //client.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpEnableSsl"]);
            //client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["smtpUserName"], ConfigurationManager.AppSettings["smtpPassword"]);

            SmtpClient client = CreateSmtpCLient();
            client.Send(mail);
        }

        private static SmtpClient CreateSmtpCLient()
        {

            //TODO Discuss, should i Create a separate method for every single action in code below? To follow TDD, if I could implement a method for single action (e.g. GetSmtpHost(), GetSmtpPort() etc.), 
            // unit Testing would be very easy to write.
            SmtpClient client = new SmtpClient();
            client.Host = ConfigurationManager.AppSettings["smtpHost"];
            client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["smtpPort"]);
            client.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["smtpEnableSsl"]);
            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["smtpUserName"], ConfigurationManager.AppSettings["smtpPassword"]);

            return client;
        }



    }
    
}
