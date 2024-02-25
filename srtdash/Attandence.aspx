<%@ Page Title="" Language="VB" MasterPageFile="~/Student_Mst.master" AutoEventWireup="false" CodeFile="Attandence.aspx.vb" Inherits="Attandence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                        <h4 class="header-title">Attandence</h4>

                                        <input type="hidden" id="Stu_ID" runat="server">
                                        <%--date--%>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Date</label>
                                            <asp:TextBox ID="date" type="date" class="form-control" runat="server"></asp:TextBox>
                                            
                                        </div>
                                        <%--date ends--%>
                                        <%--slot--%>
                                        <div class="form-group">
                                            <label for="example-text-input" class="col-form-label">Time Slot</label>
                                            
                                            <asp:DropDownList ID="time_slot" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Time_Slot" DataValueField="Time_Slot"></asp:DropDownList>
                                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:MetronomeConnectionString %>' SelectCommand="SELECT [Time_Slot] FROM [Time_Slots]"></asp:SqlDataSource>
                                        </div>
                                        <%--slot ends--%>
                                       
                                      
                                       <asp:Button ID="btn_Save" runat="server" class="btn btn-dark mb-3" Text="Fill Attendence" />
                                       
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
                                    
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MetronomeConnectionString %>' DeleteCommand="DELETE FROM [Student] WHERE [Stu_ID] = @Stu_ID" InsertCommand="INSERT INTO [Student] ([Stu_Name], [Stu_Enroll], [Stu_Sem], [Password]) VALUES (@Stu_Name, @Stu_Enroll, @Stu_Sem, @Password)" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [Stu_Name] = @Stu_Name, [Stu_Enroll] = @Stu_Enroll, [Stu_Sem] = @Stu_Sem, [Password] = @Password WHERE [Stu_ID] = @Stu_ID">
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
</asp:Content>

