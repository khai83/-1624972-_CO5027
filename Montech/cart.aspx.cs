using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using PayPal.Api;

namespace Montech
{
    public partial class cart : System.Web.UI.Page
    {

        string s;
        string t;
        string[] a = new string[6];
        int gttl = 0;
        int quanTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable daTab = new DataTable();
            daTab.Columns.AddRange(new DataColumn[5] { new DataColumn("productName"), new DataColumn("productPrice"), new DataColumn("quantity"), new DataColumn("productID"), new DataColumn("id") });

            if (Request.Cookies["aa"] != null)
            {
                s = Convert.ToString(Request.Cookies["aa"].Value);

                string[] strArray = s.Split('|');

                for (int i = 0; i < strArray.Length; i++)
                {
                    t = Convert.ToString(strArray[i].ToString());
                    string[] strArray1 = t.Split(',');
                    for (int j = 0; j < strArray1.Length; j++)
                    {
                        a[j] = strArray1[j].ToString();
                    }

                    daTab.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), i.ToString(), a[3].ToString());

                    gttl = gttl + (Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString()));

                    quanTotal = quanTotal + (Convert.ToInt32(a[2].ToString()));
                }
            }
            dataList1.DataSource = daTab;
            dataList1.DataBind();

            gTotal.Text = "Grand Total: " + string.Format("{0:C}", Convert.ToDecimal(gttl.ToString()));

            Session["GTotal"] = gttl.ToString();
            Session["QTotal"] = quanTotal.ToString();
        }

            protected void payment(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {

                Response.Redirect("login.aspx");
            }
            else
            {

                var config = ConfigManager.Instance.GetProperties();
                var accessToken = new OAuthTokenCredential(config).GetAccessToken();
                var apiContext = new APIContext(accessToken);

                var purchaseItem = new Item();
                purchaseItem.name = "Monitor Screen";
                purchaseItem.currency = "SGD";
                purchaseItem.price = Session["GTotal"].ToString();
                purchaseItem.sku = "LA3320Am18";
                purchaseItem.quantity = "1";
                

                var transactionDetails = new Details();
                transactionDetails.tax = "0";
                transactionDetails.shipping = "0";
                transactionDetails.subtotal = Session["GTotal"].ToString();

                var transactionAmount = new Amount();
                transactionAmount.currency = "SGD";
                transactionAmount.total = Session["GTotal"].ToString();
                transactionAmount.details = transactionDetails;

                var transaction = new Transaction();
                transaction.description = "Purchasing Monitor Screen";
                transaction.invoice_number = Guid.NewGuid().ToString();
                transaction.amount = transactionAmount;
                transaction.item_list = new ItemList
                {
                    items = new List<Item>
                    {
                        purchaseItem
                    }
                };
            
                var payer = new Payer();
                payer.payment_method = "paypal";

                var redirectUrls = new RedirectUrls();
                redirectUrls.cancel_url = "http://1624972.win.studentwebserver.co.uk/CO5027/Default.aspx";
                redirectUrls.return_url = "http://1624972.win.studentwebserver.co.uk/CO5027/deleteCart.aspx";

                var payment = Payment.Create(apiContext, new Payment{
                    intent = "sale",
                    payer = payer,
                    transactions = new List<Transaction>
                    {
                        transaction
                    },
                    redirect_urls = redirectUrls
                });

                Session["paymentId"] = payment.id;

                foreach(var link in payment.links)
                {
                    if (link.rel.ToLower().Trim().Equals("approval_url"))
                    {
                        Response.Redirect(link.href);
                    }
                }
            }
        }
    }
}
