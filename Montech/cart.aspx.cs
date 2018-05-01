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
                }
            }
            dataList1.DataSource = daTab;
            dataList1.DataBind();

            gTotal.Text = "Grand Total: " + string.Format("{0:C}", Convert.ToDecimal(gttl.ToString()));
        }

        protected void payment(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {

                Response.Redirect("login.aspx");
            }
            else
            {

                Response.Redirect("default.aspx");
                /*var config = ConfigManager.Instance.GetProperties();
                var accessToken = new OAuthTokenCredential(config).GetAccessToken();
                var apiContext = new APIContext(accessToken);
                */
            }
        }
    }
}
