using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechFixWeb
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Check if username or password fields are empty
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblLoginFeedback.Text = "Please fill out both fields.";
                lblLoginFeedback.CssClass = "text-danger";  // Style the error message
                lblLoginFeedback.Visible = true;
                return;
            }

            // Retrieve the entered username and password
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Hardcoded credentials for admin and supplier
            string adminUsername = "admin";
            string adminPassword = "admin123";

            string supplierUsername = "supplier";
            string supplierPassword = "supplier123";

            // Validation for admin login
            if (username == adminUsername && password == adminPassword)
            {
                Response.Redirect("adminDashboard.aspx"); // Redirect to Admin Dashboard
            }
            // Validation for supplier login
            else if (username == supplierUsername && password == supplierPassword)
            {
                Response.Redirect("supplierDashboard.aspx"); // Redirect to Supplier Dashboard
            }
            // If credentials are incorrect
            else
            {
                lblLoginFeedback.Text = "Invalid username or password.";
                lblLoginFeedback.CssClass = "text-danger";  // Style the error message
                lblLoginFeedback.Visible = true;
            }
        }
    }
}