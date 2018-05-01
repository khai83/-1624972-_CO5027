using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using System.Drawing.Drawing2D;

namespace Montech.admin
{
    public partial class UploadImage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productId = Request.QueryString["productID"];
            string filename = productId + ".jpg";

            uploadedImage.ImageUrl = "~/productImages/" + filename;
        }

        protected void updloadButton_Click(object sender, EventArgs e)
        {
            string productId = Request.QueryString["productID"];

            string filename = productId + ".jpg";
            string saveLocation = Server.MapPath("~/productImages/" + filename);

            /*  https://forums.asp.net/t/1719427.aspx?add+watermark+to+an+image+dynamically+while+uploading+it+and+saving+it+in+a+server+side+folder */

            string csName = "ButtonClickScript";
            Type csType = this.GetType();

            if (FileUploadImage.HasFile)
            {
                try
                {
                    System.Drawing.Image image = System.Drawing.Image.FromStream(FileUploadImage.PostedFile.InputStream);
                    int width = image.Width;
                    int height = image.Height;
                    Bitmap bmp = new Bitmap(width, height);
                    Graphics graphics = Graphics.FromImage(bmp);
                    graphics.InterpolationMode = InterpolationMode.High;
                    graphics.SmoothingMode = SmoothingMode.HighQuality;
                    graphics.Clear(Color.Transparent);
                    graphics.DrawImage(image, 0, 0, width, height);
                    Font font = new Font("Arial", 20, FontStyle.Bold);
                    SolidBrush brush = new SolidBrush(Color.FromArgb(252, 5, 5));
                    graphics.DrawString("Montech Inc", font, brush, 50.0F, 50.0F);
                    System.Drawing.Image newImage = bmp;
                    newImage.Save(saveLocation);
                    graphics.Dispose();
                }

                catch(Exception ex)
                {
                    ClientScript.RegisterClientScriptBlock(csType, csName, "<script>alert('There is an error occured while uploading, please try again')</script>");
                    Response.Write(ex.Message);
                }
            }           
     
        }

    }
}