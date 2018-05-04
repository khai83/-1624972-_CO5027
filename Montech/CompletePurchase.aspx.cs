using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PayPal.Api;

namespace Montech
{
    public partial class CompletePurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            var apiContext = new APIContext(accessToken);

            var paymentId = Session["paymentId"].ToString();

            if (!String.IsNullOrEmpty(paymentId))
            {
                var payment = new Payment() { id = paymentId };

                var payerId = Request.QueryString["PayerID"].ToString();

                var paymentExecution = new PaymentExecution()
                {
                    payer_id = payerId
                };
                var executePayment = payment.Execute(apiContext, paymentExecution);

                litInformation.Text = "<p>Your order has been completed</p>";
             
            }
        }

    }
}