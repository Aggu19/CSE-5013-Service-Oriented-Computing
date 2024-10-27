<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDashboard.aspx.cs" Inherits="TechFixWeb.adminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .dashboard-container { margin: 30px auto; max-width: 1000px; }
        footer { background-color: #f8f9fa; padding: 20px; text-align: center; }
        h1, h3 { text-align: center; margin-bottom: 20px; }
        .section { margin-top: 40px; }
        .form-group { margin-bottom: 20px; }
        .hero { background-color: #e9ecef; padding: 30px; text-align: center; }
        .navbar-nav { flex-direction: row; }
        .nav-item { margin-left: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header>
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand" href="index.aspx">
                    <img src="images/logo.png" alt="TechFix Logo" style="width: 75px;" />
                </a>
                <h3 class="mx-auto">Admin Dashboard</h3>
                <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" CssClass="btn btn-danger" OnClick="btnSignOut_Click" />
            </nav>

            <!-- Lower Navigation Bar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#viewStock">View Stock</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#createQuotation">Create Quotation</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#viewQuotations">View Quotations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#viewOrders">View Orders</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Hero Section -->
        <div class="hero">
            <h1>Welcome to the TechFix Admin Dashboard</h1>
            <p>Your centralized hub for managing stock, quotations, and customer orders.</p>
        </div>

        <!-- View Stock Section -->
        <div class="section" id="viewStock">
            <h3>View Stock</h3>
            <asp:GridView ID="GridViewStock" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnRefreshStock" runat="server" Text="Refresh Stock" OnClick="btnRefreshStock_Click" CssClass="btn btn-primary mt-3" />
        </div>

        <!-- Create Quotation Section -->
        <div class="section" id="createQuotation">
            <h3>Create Quotation</h3>
            <div class="form-group">
                <asp:TextBox ID="txtQuotationProductID" runat="server" CssClass="form-control" Placeholder="Product ID"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtQuotationSupplierName" runat="server" CssClass="form-control" Placeholder="Supplier Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtQuotationAmount" runat="server" CssClass="form-control" Placeholder="Amount"></asp:TextBox>
            </div>
            <asp:Button ID="btnCreateQuotation" runat="server" Text="Create Quotation" OnClick="btnCreateQuotation_Click" CssClass="btn btn-success" />
        </div>

        <!-- View Created Quotations Section -->
        <div class="section" id="viewQuotations">
            <h3>View Created Quotations</h3>
            <asp:GridView ID="GridViewQuotations" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="QuotationID" HeaderText="Quotation ID" />
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" />
                    <asp:BoundField DataField="CreatedAt" HeaderText="Created At" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnRefreshQuotations" runat="server" Text="Refresh Quotations" OnClick="btnRefreshQuotations_Click" CssClass="btn btn-primary mt-3" />
        </div>

        <!-- View Orders Section -->
        <div class="section" id="viewOrders">
            <h3>View Orders Received from Customers</h3>
            <asp:GridView ID="GridViewOrders" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" />
                    <asp:BoundField DataField="OrderDate" HeaderText="Order Date" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnRefreshOrders" runat="server" Text="Refresh Orders" OnClick="btnRefreshOrders_Click" CssClass="btn btn-primary mt-3" />
        </div>

        <!-- Footer -->
        <footer>
            <div class="container">
                <span>&copy; 2024 Arkam Rameez. All rights reserved.</span>
            </div>
        </footer>
    </form>
</body>
</html>
