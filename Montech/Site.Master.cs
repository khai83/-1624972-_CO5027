using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Montech
{
    public partial class SiteMaster : MasterPage
    {

        string s;
        string t;
        string[] a = new string[6];
        int gttl = 0;
        int totalCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
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

                    gttl = gttl + (Convert.ToInt32(a[1].ToString()) * Convert.ToInt32(a[2].ToString()));
                    totalCount = totalCount + 1;

                    cartCount.Text = totalCount.ToString();
                    cartPrice.Text = string.Format("{0:C}", Convert.ToDecimal(gttl.ToString()));
                    
                }
                                
            }
            
        }
    }
}