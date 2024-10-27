using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TechFixWeb
{
    public partial class supplierDashboard : System.Web.UI.Page
    {
        SupplierServiceReference.SupplierWebServiceSoapClient obj = new SupplierServiceReference.SupplierWebServiceSoapClient();
        AdminServiceReference.AdminServiceSoapClient objj = new AdminServiceReference.AdminServiceSoapClient();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOrders();
            }
        }
        private void BindOrders()
        {
            // Populate the GridView with your data source
          //  GridViewOrders.DataSource = GetOrderData(); // Assume GetOrderData() fetches your orders from the database
            GridViewOrders.DataBind();
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

        protected void btnInsertProduct_Click(object sender, EventArgs e)
        {
            try
            {

                string productName = txtProductName.Text;
                string supplierName = txtSupplierName.Text;
                string description = txtDescription.Text;
                decimal price = decimal.Parse(txtPrice.Text);
                int quantity = int.Parse(txtQuantity.Text);


                SupplierServiceReference.SupplierWebServiceSoapClient obj = new SupplierServiceReference.SupplierWebServiceSoapClient();
                string result = obj.InsertProduct(productName, supplierName, description, price, quantity);





                if (result == "")
                {

                    txtProductName.Text = "";
                    txtSupplierName.Text =
                    txtDescription.Text = "";
                    txtPrice.Text = "";
                    txtQuantity.Text = "";
                }
            }
            catch (Exception ex)
            {


            }
        }

        protected void btnDeleteProduct_Click(object sender, EventArgs e)
        {
            try
            {

                int productId = int.Parse(txtDeleteProductId.Text);


                SupplierServiceReference.SupplierWebServiceSoapClient obj = new SupplierServiceReference.SupplierWebServiceSoapClient();
                string result = obj.DeleteProduct(productId);





                if (result == "")
                {
                    txtDeleteProductId.Text = "";
                }
            }
            catch (Exception ex)
            {


            }
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            try
            {

                int productId = int.Parse(txtUpdateProductId.Text);
                string productName = txtUpdateProductName.Text;
                string supplierName = txtUpdateSupplierName.Text;
                string description = txtUpdateDescription.Text;


                decimal price = decimal.Parse(txtUpdatePrice.Text);
                int quantity = int.Parse(txtUpdateQuantity.Text);


                SupplierServiceReference.SupplierWebServiceSoapClient obj = new SupplierServiceReference.SupplierWebServiceSoapClient();
                string result = obj.UpdateProduct(productId, productName,supplierName, description, price, quantity);




                if (result == "")
                {
                    txtUpdateProductId.Text = "";
                    txtUpdateProductName.Text = "";
                    txtUpdateDescription.Text = "";
                    txtUpdatePrice.Text = "";
                    txtUpdateQuantity.Text = "";
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

                DataTable quotationsTable = objj.ViewQuotations();


                GridViewOrders.DataSource = quotationsTable;
                GridViewOrders.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnRefreshOrders_Click(object sender, EventArgs e)
        {
            
        }

        
    }
}