<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Login - srtdash</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/themify-icons.css" />
    <link rel="stylesheet" href="assets/css/metisMenu.css" />
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="assets/css/slicknav.min.css" />
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="assets/css/typography.css" />
    <link rel="stylesheet" href="assets/css/default-css.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
    <link rel="stylesheet" href="assets/css/responsive.css" />
    <!-- modernizr css -->
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->


    <!-- login area start -->
    <div class="login-area">
        <div class="container">
            <div class="login-box ptb--100">
                <form id="form1" runat="server">
                    <div class="login-form-head">
                        <h4>Sign In</h4>
                        <p>Hello there, Sign in and Keep your Attandence</p>
                    </div>
                    <div class="login-form-body">
                        <%-- user role --%>
                         <label for="exampleInputEmail1">Role</label>
                        <div class="form-gp">
                           
                            <asp:DropDownList class="form-control" ID="DropDownList1" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Selected="True" Text="select" Value="" ></asp:ListItem>
                                <asp:ListItem>Faculty</asp:ListItem>
                                <asp:ListItem>Student</asp:ListItem>
                                
                            </asp:DropDownList>


                        </div>
                        <%-- user role ends --%>
                        <%-- username --%>
                        <div class="form-gp">
                            <label for="exampleInputPassword1">Username</label>
                            <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>

                            <i class="ti-lock"></i>
                        </div>
                        <%-- username ends--%>
                        <%-- password --%>
                        <div class="form-gp">
                            <label for="exampleInputPassword1">Password</label>
                            <asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>

                            <i class="ti-lock"></i>
                        </div>
                        <%-- password ends --%>
                        <div class="submit-btn-area">
                            <asp:Button ID="Button1" runat="server" class="btn btn-rounded btn-info mb-3" Text="Login"></asp:Button>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>


                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- login area end -->


    <!-- jquery latest version -->
    <script src="assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.carousel.min.js"></script>
    <script src="assets/js/metisMenu.min.js"></script>
    <script src="assets/js/jquery.slimscroll.min.js"></script>
    <script src="assets/js/jquery.slicknav.min.js"></script>

    <!-- others plugins -->
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/scripts.js"></script>
</body>
</html>
