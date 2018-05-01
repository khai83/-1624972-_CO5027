using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;


namespace Montech
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void logButton_Click(object sender, EventArgs e)
        {

            var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(logUserNBox.Text, logPassBox.Text);
            if (user != null)
            {
                LogUserIn(userManager, user);
            }

            else
            {
                errorLoginLiteral.Text = "Invalid username or password";
            }
        }


        private void LogUserIn(UserManager<IdentityUser> userManager, IdentityUser user)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = userManager.CreateIdentity(
                user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

            if (Request.QueryString["ReturnUrl"] != null)
            {
                Response.Redirect(Request.QueryString["ReturnUrl"]);

            }
            else
            {
                String userRoles = userManager.GetRoles(user.Id).FirstOrDefault();

                if(userRoles.Equals("Admin"))
                {
                    Session["user"] = logUserNBox.Text;
                    Response.Redirect("~/admin/index.aspx");
                }
                else
                {
                    Session["user"] = logUserNBox.Text;
                    Response.Redirect("~/default.aspx");
                }
            }
        }
        
        protected void reg_click(object sender, EventArgs e)
        {
            var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            var roleStore = new RoleStore<IdentityRole>(identityDbContext);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);

            IdentityRole adminRole = new IdentityRole("RegisteredUser");
            roleManager.Create(adminRole);

            var user = new IdentityUser()
            {
                UserName = RegUName.Text,
                Email = RegPassw.Text
            };

            IdentityResult result = manager.Create(user, RegPassw.Text);
            if (result.Succeeded)
            {
                manager.AddToRole(user.Id, "RegisteredUser");
                manager.Update(user);
                errorRegLiteral.Text = "Registration Successful";
            }
            else
            {
                errorRegLiteral.Text = "An error has occured: Please try again or use different username" + result.Errors.FirstOrDefault();
            }
        }
    }
}