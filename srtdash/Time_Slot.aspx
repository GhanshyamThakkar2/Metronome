<%@ Page Title="" Language="VB" MasterPageFile="~/Teacher_Mst.master" AutoEventWireup="false" CodeFile="Time_Slot.aspx.vb" Inherits="Time_Slot" %>

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
                                            <h4 class="header-title">Student</h4>
                                            <div class="form-group">
                                                <input type="hidden" id="Time_ID" runat="server">
                                                <label for="example-text-input" class="col-form-label">Time Slot</label>
                                                <%--<input class="form-control" type="text" value="" id="example-text-input">--%>
                                                <asp:TextBox ID="time_slot" class="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <%--<button type="button" class="btn btn-dark mb-3">Save</button>--%>
                                            <asp:Button ID="btn_Sub" class="btn btn-dark mb-3" runat="server" Text="Save" />
                                            <asp:Button ID="btn_Clr" class="btn btn-dark mb-3" runat="server" Text="Clear" />
                                        </div>
                                    </div>
                                </div>
                                <!-- Textual inputs end -->

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <!-- Progress Table start -->
                        <div class="col-12 mt-5">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Progress Table</h4>
                                    <div class="single-table">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GridView1" class="table table-hover progress-table text-center" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="Time_ID">
                                                <Columns>
                                                    <asp:BoundField DataField="Time_ID" Visible="false" HeaderText="Time_ID" ReadOnly="True" InsertVisible="False" SortExpression="Time_ID"></asp:BoundField>
                                                    <asp:BoundField DataField="Time_Slot" HeaderText="Time Slot" SortExpression="Time_Slot"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Action" ItemStyle-Width="200px">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnedit" Text="Edit" CommandName="Edit1" CssClass="btn btn-success" OnClick="btnedit_Click" CausesValidation="false" runat="server" />
                                                            <asp:Button ID="delete1" runat="server" Text="Delete" CssClass="btn btn-danger" CausesValidation="false" CommandName="delete1" CommandArgument='<%# Eval("Time_ID")%>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MetronomeConnectionString %>' DeleteCommand="DELETE FROM [Time_Slots] WHERE [Time_ID] = @Time_ID" InsertCommand="INSERT INTO [Time_Slots] ([Time_Slot]) VALUES (@Time_Slot)" SelectCommand="SELECT * FROM [Time_Slots]" UpdateCommand="UPDATE [Time_Slots] SET [Time_Slot] = @Time_Slot WHERE [Time_ID] = @Time_ID">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Time_ID" Type="Int32"></asp:Parameter>
                                                </DeleteParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="Time_Slot" Type="String"></asp:Parameter>
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="Time_Slot" Type="String"></asp:Parameter>
                                                    <asp:Parameter Name="Time_ID" Type="Int32"></asp:Parameter>
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Progress Table end -->

                    </div>
                </div>
            </div>
            <!-- main content area end -->
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

