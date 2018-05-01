using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Montech
{
    public partial class deleteCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = SQL2016.FSE.Network; Initial Catalog = db_1624972_co5027_asg; Persist Security Info=True;User ID = user_db_1624972_co5027_asg; Password=abc@1234");
        string s;
        string t;
        string[] a = new string[6];
        int id;
        string productName, productPrice, quantity;
        int count = 0;
        int productId, q;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());

            DataTable dat = new DataTable();
            dat.Rows.Clear();

            dat.Columns.AddRange(new DataColumn[5] { new DataColumn("productName"), new DataColumn("productPrice"), new DataColumn("quantity"), new DataColumn("productID"), new DataColumn("id") });

            if(Request.Cookies["aa"] != null)
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

                    dat.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), i.ToString(), a[3].ToString());
                }
            }

            count = 0;
            foreach (DataRow datR in dat.Rows)
            {
                if(count == id)
                {
                    productId = Convert.ToInt32(datR["id"].ToString());
                    q = Convert.ToInt32(datR["quantity"].ToString());
                }
                count = count + 1;
            }


            count = 0;

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "update tblproduct set quantity=quantity+" + q + "where productID=" + productId;
            cmd.ExecuteNonQuery();
            con.Close();


            dat.Rows.RemoveAt(id);

            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);

            foreach(DataRow drow in dat.Rows)
            {
                productName = drow["productName"].ToString();
                productPrice = drow["productPrice"].ToString();
                quantity = drow["quantity"].ToString();
                productId = Convert.ToInt32(drow["id"].ToString());

                count = count + 1;

                if (count == 1)
                {
                    Response.Cookies["aa"].Value = productName.ToString() + "," + productPrice.ToString() + "," + quantity.ToString() + "," + productId.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);                   
                }
                else
                {
                    Response.Cookies["aa"].Value = Request.Cookies["aa"].Value + "|" + productName.ToString() + "," + productPrice.ToString() + "," + quantity.ToString() + "," + productId.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);

                }
            }

            Response.Redirect("cart.aspx");

        }
    }
}