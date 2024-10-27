<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierSignup.aspx.cs" Inherits="TechFixWeb.SupplierSignup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supplier Signup - TechFix</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .signup-container { margin-top: 50px; }
        .footer { margin-top: 50px; background-color: #f8f9fa; padding: 20px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <header>
            <nav class="navbar navbar-light bg-light">
                <a class="navbar-brand" href="index.aspx">
                    <img src="images/logo.png" alt="TechFix Logo" style="width: 75px;" />
                </a>
            </nav>
        </header>

        <!-- Supplier Signup Form -->
        <div class="container signup-container">
            <h2 class="text-center">Supplier Signup</h2>
            <div class="form-group">
                <label for="txtSupplierName">Supplier Name:</label>
                <asp:TextBox ID="txtSupplierName" runat="server" CssClass="form-control" placeholder="Enter supplier name" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter email" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPhone">Phone Number:</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter phone number" required="required"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAddress">Address:</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter address" required="required"></asp:TextBox>
            </div>
            <!-- Default password set as Supplier123 -->
            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success" Visible="false"></asp:Label>
        </div>

        <!-- Footer -->
        <footer class="footer text-center">
            <div class="container">
                <span class="text-muted">&copy; 2024 Arkam Rameez. All rights reserved.</span>
            </div>
        </footer>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
