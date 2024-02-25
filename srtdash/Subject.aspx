<%@ Page Title="" Language="VB" MasterPageFile="~/Teacher_Mst.master" AutoEventWireup="false" CodeFile="Subject.aspx.vb" Inherits="Subject" %>

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
                                            <h4 class="header-title">Subject</h4>
                                            <%--sub name--%>
                                            <input type="hidden" id="Sub_ID" runat="server">
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Subject Name</label>
                                                <asp:TextBox ID="subname" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--sub name ends--%>
                                            <%--subcode--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Subject Code</label>
                                                <asp:TextBox ID="Sub_Code" class="form-control" runat="server"></asp:TextBox>
                                                <%--subcode Ends--%>
                                            </div>

                                            <asp:Button ID="btn_Sub" runat="server" class="btn btn-dark mb-3" Text="Save" />
                                            <asp:Button ID="btn_Clear" runat="server" class="btn btn-dark mb-3" Text="Clear" />
                                        </div>
                                    </div>
                                </div>
                                <!-- Textual inputs end -->

                            </div>
                        </div>

                    </div>
                    <div class="row">
                    </div>
                    <asp:GridView ID="GridView1" runat="server" class="table table-hover progress-table text-center" AutoGenerateColumns="False" DataKeyNames="Sub_ID" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Sub_ID" Visible="false" HeaderText="Sub_ID" ReadOnly="True" InsertVisible="False" SortExpression="Sub_ID"></asp:BoundField>
                            <asp:BoundField DataField="Sub_Name" HeaderText="Subject Name" SortExpression="Sub_Name"></asp:BoundField>
                            <asp:BoundField DataField="Sub_Code" HeaderText="Subject Code" SortExpression="Sub_Code"></asp:BoundField>
                            <asp:TemplateField HeaderText="Action" ItemStyle-Width="200px">
                                <ItemTemplate>
                                    <asp:Button ID="btnedit" Text="Edit" CommandName="Edit1" CssClass="btn btn-success" OnClick="btnedit_Click" CausesValidation="false" runat="server" />
                                    <asp:Button ID="delete1" runat="server" Text="Delete" CssClass="btn btn-danger" CausesValidation="false" CommandName="delete1" CommandArgument='<%# Eval("Sub_ID")%>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MetronomeConnectionString %>' DeleteCommand="DELETE FROM [Subject] WHERE [Sub_ID] = @Sub_ID" InsertCommand="INSERT INTO [Subject] ([Sub_Name], [Sub_Code]) VALUES (@Sub_Name, @Sub_Code)" SelectCommand="SELECT * FROM [Subject]" UpdateCommand="UPDATE [Subject] SET [Sub_Name] = @Sub_Name, [Sub_Code] = @Sub_Code WHERE [Sub_ID] = @Sub_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="Sub_ID" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Sub_Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Sub_Code" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Sub_Name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Sub_Code" Type="String"></asp:Parameter>
                            <asp:Parameter Name="Sub_ID" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <!-- main content area end -->

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

