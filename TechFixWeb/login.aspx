<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="TechFixWeb.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login - TechFix</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <!-- Navigation Bar -->
    <header>
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="index.aspx">
                <img src="images/logo.png" alt="TechFix Logo" style="width: 75px;" /> 
            </a>
            <ul class="navbar-nav ml-auto d-flex flex-row">
                <li class="nav-item px-3">
                    <a class="nav-link" href="#">Contact Us</a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link" href="#">About Us</a>
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link" href="supplierSignup.aspx">SignUp Supplier</a>
                </li>
            </ul>
        </nav>
    </header>

    <form id="form1" runat="server">
        <!-- Login Form -->
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <h2 class="text-center">Login</h2>
                    <p>&nbsp;</p>
                    <asp:Label ID="lblLoginFeedback" runat="server" CssClass="text-danger" Visible="false"></asp:Label> <!-- Feedback Label -->
                    <div class="form-group">
                        <label for="txtUsername">Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password" required></asp:TextBox>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn bg-dark text-white" OnClick="btnLogin_Click" />
                    <div class="text-center">
                        <p class="mt-3">
                            New supplier? <a href="supplierSignup.aspx">signup here</a>
                        </p>
                    </div>
                    <div class="text-center">&nbsp;</div>
                </div>
            </div>
            <div class="row justify-content-center">&nbsp;</div>
        </div>

        <div class="container mt-5">&nbsp;</div>
        <!-- Footer -->
        <footer class="footer mt-auto py-3 bg-light">
            <div class="container text-center">
                <span class="text-muted">&copy; 2024 Arkam Rameez. All rights reserved.</span>
            </div>
        </footer>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
