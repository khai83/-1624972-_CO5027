using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Montech
{
    public partial class Product : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source = SQL2016.FSE.Network; Initial Catalog = db_1624972_co5027_asg; Persist Security Info=True;User ID = user_db_1624972_co5027_asg; Password=abc@1234");
        int id;
        int q;
        string productName, productPrice, quantity;


        protected void Page_Load(object sender, EventArgs e)
        {
           
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }

            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblproduct where productID=" + id + "";
            cmd.ExecuteNonQuery();
            DataTable dataTab = new DataTable();
            SqlDataAdapter dat = new SqlDataAdapter(cmd);
            dat.Fill(dataTab);
            foreach (DataRow datR in dataTab.Rows)
            {
                productName = datR["productName"].ToString();
                productPrice = datR["productPrice"].ToString();
                quantity = datR["quantity"].ToString();
            }
            

            if (Convert.ToInt32(TextBox1.Text) > Convert.ToInt32(quantity))
            {
                retryQuantity.Text = "Please enter with lower quantity and try again";
            }
            else
            {

                if (Request.Cookies["aa"] == null)
                {
                    Response.Cookies["aa"].Value = productName.ToString() + "," + productPrice.ToString() + "," + TextBox1.Text + "," + id.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);

                }
                else
                {
                    Response.Cookies["aa"].Value = Request.Cookies["aa"].Value + "|" + productName.ToString() + "," + productPrice.ToString() + "," + TextBox1.Text + "," + id.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }

                SqlCommand cmd1 = con.CreateCommand();
                cmd1.CommandType = CommandType.Text;
                cmd1.CommandText = "update tblproduct set quantity=quantity-" + TextBox1.Text + "where productID=" + id;
                cmd1.ExecuteNonQuery();
                Response.Redirect("product.aspx?id=" + id.ToString());
            }
            con.Close();

            q = getQuantity(id);

            if (q == 0)
            {
                lprod.Visible = false;
                TextBox1.Visible = false;
                Button1.Visible = false;
                retryQuantity.Text = "This product is out of stock";
            }
        }

        public int getQuantity(int id)
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblproduct where productID=" + id;
            cmd.ExecuteNonQuery();
            DataTable dataTab = new DataTable();
            SqlDataAdapter dat = new SqlDataAdapter(cmd);
            dat.Fill(dataTab);
            foreach (DataRow datR in dataTab.Rows)
            {
                q = Convert.ToInt32(datR["quantity"].ToString());
            }

            return q;
        }
    }
}

        