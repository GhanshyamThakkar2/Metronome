<%@ Page Title="" Language="VB" MasterPageFile="~/Student_Mst.master" AutoEventWireup="false" CodeFile="Student.aspx.vb" Inherits="Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
        </Scripts>

    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_Save" />
        </Triggers>
        <ContentTemplate>

            <!-- main content area start -->
            <div class="main-content">
                <!-- header area start -->

                <!-- header area end -->
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

                                            <input type="hidden" id="Stu_ID" runat="server">
                                            <%--s name--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Student Name</label>
                                                <asp:TextBox ID="stu_name" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--s name ends--%>
                                            <%--enrollment--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Student Enrollment</label>
                                                <asp:TextBox ID="stu_enroll" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--enrollment ends--%>
                                            <%--Semester--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Student Semester</label>
                                                <asp:TextBox ID="stu_sem" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--Semester Ends--%>
                                            <%--Password--%>
                                            <div class="form-group">
                                                <label for="example-text-input" class="col-form-label">Password</label>
                                                <asp:TextBox ID="stu_pass" class="form-control" runat="server"></asp:TextBox>

                                            </div>
                                            <%--Password ends--%>
                                            <!--Semester-->
                                            <%--<div class="form-group">
                                            <label class="col-form-label">Semester</label>
                                            <asp:DropDownList ID="sem" class="form-control" runat="server">
                                            
                                                
                                                </asp:DropDownList>
                                        </div>--%>

                                            <asp:Button ID="btn_Save" runat="server" class="btn btn-dark mb-3" Text="Save" />
                                            <asp:Button ID="btn_Clear" runat="server" class="btn btn-dark mb-3" Text="Clear" />
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

                                </div>
                                <asp:GridView ID="GridView1" runat="server" class="table table-hover progress-table text-center" AutoGenerateColumns="False" DataKeyNames="Stu_ID" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Stu_ID" HeaderText="Stu_ID" Visible="false" ReadOnly="True" InsertVisible="False" SortExpression="Stu_ID"></asp:BoundField>
                                        <asp:BoundField DataField="Stu_Name" HeaderText="Name" SortExpression="Stu_Name"></asp:BoundField>
                                        <asp:BoundField DataField="Stu_Enroll" HeaderText="Enroll" SortExpression="Stu_Enroll"></asp:BoundField>
                                        <asp:BoundField DataField="Stu_Sem" HeaderText="Semester" SortExpression="Stu_Sem"></asp:BoundField>
                                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="200px">
                                            <ItemTemplate>
                                                <asp:Button ID="btnedit" Text="Edit" CommandName="Edit1" CssClass="btn btn-success" OnClick="btnedit_Click" CausesValidation="false" runat="server" />
                                                <asp:Button ID="delete1" runat="server" Text="Delete" CssClass="btn btn-danger" CausesValidation="false" CommandName="delete1" CommandArgument='<%# Eval("Stu_ID")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MetronomeConnectionString %>' DeleteCommand="DELETE FROM [Student] WHERE [Stu_ID] = @Stu_ID" InsertCommand="INSERT INTO [Student] ([Stu_Name], [Stu_Enroll], [Stu_Sem], [Password]) VALUES (@Stu_Name, @Stu_Enroll, @Stu_Sem, @Password)" SelectCommand="SELECT * FROM [Student] where Stu_ID=@Stu_ID" UpdateCommand="UPDATE [Student] SET [Stu_Name] = @Stu_Name, [Stu_Enroll] = @Stu_Enroll, [Stu_Sem] = @Stu_Sem, [Password] = @Password WHERE [Stu_ID] = @Stu_ID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Stu_ID" Type="Int32"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Stu_Name" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Stu_Enroll" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Stu_Sem" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Stu_Name" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Stu_Enroll" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Stu_Sem" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Password" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Stu_ID" Type="Int32"></asp:Parameter>
                                    </UpdateParameters>
                                </asp:SqlDataSource>
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

