using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechFixWeb
{
    public partial class adminDashboard : System.Web.UI.Page
    {
        
        AdminServiceReference.AdminServiceSoapClient obj = new AdminServiceReference.AdminServiceSoapClient();

        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            // Clear the current session
            Session.Clear();

            // Optionally abandon the session to avoid reuse
            Session.Abandon();

            // Redirect to the login page after signing out
            Response.Redirect("login.aspx");
        }

        protected void btnRefreshStock_Click(object sender, EventArgs e)
        {
            try
            {

                SupplierServiceReference.SupplierWebServiceSoapClient obj = new SupplierServiceReference.SupplierWebServiceSoapClient();
                

                DataTable productTable = obj.ViewItems();


                GridViewStock.DataSource = productTable;
                GridViewStock.DataBind();
            }
            catch (Exception ex)
            {


            }
        }

        protected void btnCreateQuotation_Click(object sender, EventArgs e)
        {
            try
            {

                int productId = int.Parse(txtQuotationProductID.Text);
                decimal amount = decimal.Parse(txtQuotationAmount.Text);


                bool result = obj.CreateQuotation(productId, amount);

                if (result)
                {




                    btnRefreshQuotations_Click(sender, e);
                }
                else
                {

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnRefreshQuotations_Click(object sender, EventArgs e)
        {
            try
            {

                DataTable quotationsTable = obj.ViewQuotations();


                GridViewQuotations.DataSource = quotationsTable;
                GridViewQuotations.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
       protected void btnUpdateQuotation_Click(object sender, EventArgs e)
        {
            try
            {

                int quotationId = int.Parse(txtUpdateQuotationID.Text);
                decimal newAmount = decimal.Parse(txtUpdateAmount.Text);


                bool result = obj.UpdateQuotation(quotationId, newAmount);

                if (result)
                {




                    btnRefreshQuotations_Click(sender, e);
                }
                else
                {

                }
            }
            catch (Exception ex)
            {


            }
        }
       protected void btnDeleteQuotation_Click(object sender, EventArgs e)
        {
            try
            {

                int quotationId = int.Parse(txtDeleteQuotationID.Text);


                bool result = obj.DeleteQuotation(quotationId);

                if (result)
                {



                    btnRefreshQuotations_Click(sender, e);
                }
                else
                {

                }
            }
            catch (Exception ex)
            {


            }
        }
    }
}