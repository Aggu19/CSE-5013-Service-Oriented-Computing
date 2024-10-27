<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supplierDashboard.aspx.cs" Inherits="TechFixWeb.supplierDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Dashboard</title>
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
                <h3 class="mx-auto">Supplier Dashboard</h3>
                <asp:Button ID="btnSignOut" runat="server" Text="Sign Out" CssClass="btn btn-danger" OnClick="btnSignOut_Click" />
            </nav>

            <!-- Lower Navigation Bar -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#viewStock">Product Management</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#viewOrders">Order Management</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#manageContacts">Contact Management</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#manageAddress">Address Management</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <!-- Hero Section -->
        <div class="hero">
            <h1>Welcome to the TechFix Supplier Dashboard</h1>
            <p>Your one-stop solution for managing products and orders efficiently.</p>
        </div>

        <!-- View Stock Section -->
        <div class="section" id="viewStock">
            <h3>View Available Stock</h3>
            <asp:GridView ID="GridViewAvailableStock" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Quantity" HeaderText="Available Quantity" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnUpdate_Click" CssClass="btn btn-warning" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnDelete_Click" CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnRefreshAvailableStock" runat="server" Text="Refresh Available Stock" OnClick="btnRefreshAvailableStock_Click" CssClass="btn btn-primary mt-3" />
        </div>

        <!-- Insert/Update Product Section -->
        <div class="section">
            <h3>Manage Products</h3>
            <div class="form-group">
                <asp:TextBox ID="txtProductID" runat="server" CssClass="form-control" Placeholder="Product ID"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Product Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Description"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" Placeholder="Price"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Placeholder="Quantity"></asp:TextBox>
            </div>
            <asp:Button ID="btnInsertProduct" runat="server" Text="Insert Product" OnClick="btnInsertProduct_Click" CssClass="btn btn-success" />
        </div>

        <!-- View Orders Section -->
        <div class="section" id="viewOrders">
            <h3>View Orders</h3>
            <asp:GridView ID="GridViewOrders" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                    <asp:TemplateField HeaderText="Order Status">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlOrderStatus" runat="server" SelectedValue='<%# Eval("OrderStatus") %>' AutoPostBack="true" OnSelectedIndexChanged="ddlOrderStatus_SelectedIndexChanged">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="Shipped" Value="Shipped"></asp:ListItem>
                                <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                                <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnRefreshOrders" runat="server" Text="Refresh Orders" OnClick="btnRefreshOrders_Click" CssClass="btn btn-primary mt-3" />
        </div>

        <!-- Manage Contact Information Section -->
        <div class="section" id="manageContacts">
            <h3>Manage Contact Information</h3>
            <div class="row">
                <div class="col-md-6">
                    <h4>Add Email Address</h4>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Enter email"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddEmail" runat="server" Text="Add Email" OnClick="btnAddEmail_Click" CssClass="btn btn-primary mt-2" />
                </div>
                <div class="col-md-6">
                    <h4>Add Phone Number</h4>
                    <div class="form-group">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Enter phone number"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddPhone" runat="server" Text="Add Phone" OnClick="btnAddPhone_Click" CssClass="btn btn-primary mt-2" />
                </div>
            </div>

            <hr>

            <h4>Existing Contact Details</h4>
            <asp:GridView ID="GridViewContacts" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone Number" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEditContact" runat="server" Text="Edit" CommandArgument='<%# Eval("ID") %>' OnClick="btnEditContact_Click" CssClass="btn btn-warning btn-sm" />
                            <asp:Button ID="btnDeleteContact" runat="server" Text="Delete" CommandArgument='<%# Eval("ID") %>' OnClick="btnDeleteContact_Click" CssClass="btn btn-danger btn-sm" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Manage Address Section -->
        <div class="section" id="manageAddress">
            <h3>Manage Address</h3>
            <div class="form-group">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" Placeholder="Enter full address"></asp:TextBox>
            </div>
            <asp:Button ID="btnAddAddress" runat="server" Text="Add Address" OnClick="btnAddAddress_Click" CssClass="btn btn-primary" />
            <asp:Button ID="btnUpdateAddress" runat="server" Text="Update Address" OnClick="btnUpdateAddress_Click" CssClass="btn btn-secondary" />
            <asp:Button ID="btnDeleteAddress" runat="server" Text="Delete Address" OnClick="btnDeleteAddress_Click" CssClass="btn btn-danger" />
        </div>

        <!-- Footer -->
        <footer>
            <p>&copy; 2024 TechFix. Developed by Rameez.</p>
        </footer>
    </form>
</body>
</html>
