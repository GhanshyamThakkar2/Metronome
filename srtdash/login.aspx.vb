Imports System.Data
Imports System.Data.SqlClient
Partial Class login
    Inherits System.Web.UI.Page

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Label1.Visible = False

        Dim str As String = "Data Source=192.168.1.8;Initial Catalog=Metronome;User ID=abhi;Password=123456"
        Dim conn As New SqlConnection(str)
        Dim cmd As New SqlCommand
        If DropDownList1.SelectedValue = "Faculty" Then
            cmd = New SqlCommand("Select * From Teacher where User_Name='" & TextBox1.Text & "' and Password='" & TextBox2.Text & "'", conn)

            Dim da1 As New SqlDataAdapter(cmd)

            Dim ds1 As New DataSet
            da1.Fill(ds1, "Teacher")
            If ds1.Tables(0).Rows.Count = 0 Then
                Label1.Visible = True
                Label1.Text = "Invalid Username or Password"
                TextBox1.Text = ""
                TextBox2.Text = ""
            Else
                Label1.Text = ""
                Session("T_Id") = ds1.Tables("Teacher").Rows(0)("T_ID").ToString()
                Session("username") = TextBox1.Text
                Session("password") = TextBox2.Text
                Response.Redirect("Teacher2.aspx")

            End If
        Else
            cmd = New SqlCommand("Select * From Student where stu_enroll='" & TextBox1.Text & "' and password='" & TextBox2.Text & "'", conn)

            Dim da2 As New SqlDataAdapter(cmd)

            Dim ds2 As New DataSet
            da2.Fill(ds2, "Student")
            If ds2.Tables(0).Rows.Count = 0 Then
                Label1.Visible = True
                Label1.Text = "Invalid Username or Password"
                TextBox1.Text = ""
                TextBox2.Text = ""
            Else
                Label1.Text = ""
                Session("S_Id") = ds2.Tables("Student").Rows(0)("Stu_ID").ToString()
                Session("username") = TextBox1.Text
                Session("password") = TextBox2.Text
                Response.Redirect("Student.aspx")

            End If
        End If

        Dim da As New SqlDataAdapter(cmd)

        Dim ds As New DataSet
        da.Fill(ds, "login_master")
        If ds.Tables(0).Rows.Count = 0 Then
            Label1.Visible = True
            Label1.Text = "Invalid Username or Password"
            TextBox1.Text = ""
            TextBox2.Text = ""
        Else
            Label1.Text = ""
            Session("username") = TextBox1.Text
            Session("password") = TextBox2.Text
            Response.Redirect("DashBoard.aspx")

        End If
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Label1.Visible = False
        DropDownList1.Items.FindByText("select").Selected = True
    End Sub
End Class
