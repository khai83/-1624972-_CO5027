using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Montech
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton(object sender, EventArgs e)
        {
            // Sends email using a mail server that requires login credentials and a secure connection, e.g. gmail

            //create mail client and message with to and from address, and set message subject and body
            SmtpClient smtpClient = new SmtpClient();
            MailMessage msg = new MailMessage("kudo916@gmail.com", "kudo916@gmail.com");
            msg.Subject = txtSubject.Text;
            msg.Body = txtBody.Text;

            //settings sepcific to the mail service, e.g. server location, port number and that ssl is required
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;

            //create credentials - e.g. username and password for the account
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("kudo916@gmail.com", "06010611");
            smtpClient.Credentials = credentials;

            try
            {
                smtpClient.Send(msg);
                litResult.Text = "Your message is successfully sent. We will get back to you soon. Thank you";
            }
            catch (Exception ex)
            {
                //display the full error to the user
                litResult.Text = "Message failed to send. Do try again later. " + ex.Message + ":" + ex.InnerException + "</p>";
            }
        }
    }
}


   
