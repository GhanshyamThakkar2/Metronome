<%@ Page Title="" Language="VB" MasterPageFile="~/Teacher_Mst.master" AutoEventWireup="false" CodeFile="Teacher2.aspx.vb" Inherits="Teacher2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>

    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_Sub" />
        </Triggers>
        <ContentTemplate>
            <!-- main content area start -->
            <div class="main-content">

                <!-- page title area start -->
                <div class="page-title-area">
                    <div class="row align-items-center">
                        <div class="col-sm-6">
                            <div class="breadcrumbs-area clearfix">
                                <h4 class="page-title pull-left">Dashboard</h4>
                                <ul class="breadcrumbs pull-left">
                                    <li><a href="index.html">Home</a></li>
                                    <li><span>Form</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6 clearfix">
                            <div class="user-profile pull-right">
                                <img class="avatar user-thumb" src="assets/images/author/avatar.png" alt="avatar">
                                <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Kumkum Rai <i class="fa fa-angle-down"></i></h4>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Message</a>
                                    <a class="dropdown-item" href="#">Settings</a>
                                    <a class="dropdown-item" href="#">Log Out</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- page title area end -->
                <div class="main-content-inner">
                    <div class="row">
                        <div class="col-lg-6 col-ml-12">
                            <div class="row">
                                <!-- Textual inputs start -->
                                <div class="col-12 mt-5">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="header-title">Teacher</h4>
                                            <%--T Name--%>
                                            <input type="hidden" id="T_ID" runat="server">
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Teacher Name</label>
                                                <asp:TextBox ID="t_name" runat="server" class="form-control"></asp:TextBox>

                                            </div>
                                            <%--T Name ends--%>
                                            <%--Username--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Username</label>
                                                <asp:TextBox ID="uname" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--Username ends--%>

                                            <%--Password--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Password</label>
                                                <asp:TextBox ID="Password" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--Password ends--%>


                                            <asp:Button ID="btn_Sub" runat="server" class="btn btn-dark mb-3" Text="Save" />
                                            <asp:Button ID="btn_Clr" runat="server" class="btn btn-dark mb-3" Text="Clear" />
                                        </div>
                                    </div>
                                </div>
                                <!-- Textual inputs end -->

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <!-- Progress Table start -->
                        <asp:GridView ID="GridView1" class="table table-hover progress-table text-center" runat="server" AutoGenerateColumns="False" DataKeyNames="T_ID" DataSourceID="SqlDataSource1">

                            <Columns>
                                <asp:BoundField DataField="T_ID" HeaderText="T_ID" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="T_ID"></asp:BoundField>
                                <asp:BoundField DataField="T_Name" HeaderText="Teacher Name" SortExpression="T_Name"></asp:BoundField>
                                <asp:BoundField DataField="User_Name" HeaderText="User Name" SortExpression="User_Name"></asp:BoundField>
                                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:Button ID="btnedit" Text="Edit" CommandName="Edit1" CssClass="btn btn-success" OnClick="btnedit_Click" CausesValidation="false" runat="server" />
                                    <asp:Button ID="delete1" runat="server" Text="Delete" CssClass="btn btn-danger" CausesValidation="false" CommandName="delete1" CommandArgument='<%# Eval("T_ID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <!-- Progress Table end -->


                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MetronomeConnectionString %>' DeleteCommand="DELETE FROM [Teacher] WHERE [T_ID] = @T_ID" InsertCommand="INSERT INTO [Teacher] ([T_Name], [User_Name], [Password]) VALUES (@T_Name, @User_Name, @Password)" SelectCommand="SELECT * FROM [Teacher] WHERE [T_ID] = @T_ID" UpdateCommand="UPDATE [Teacher] SET [T_Name] = @T_Name, [User_Name] = @User_Name, [Password] = @Password WHERE [T_ID] = @T_ID">
                            <DeleteParameters>
                                <asp:Parameter Name="T_ID" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="T_Name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="User_Name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="T_Name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="User_Name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                                <asp:Parameter Name="T_ID" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <!-- main content area end -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

