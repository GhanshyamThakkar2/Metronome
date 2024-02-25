
Partial Class Teacher2
    Inherits System.Web.UI.Page

    Private Sub btn_Sub_Click(sender As Object, e As EventArgs) Handles btn_Sub.Click
        Try

            If Session("Flag") = 0 Then

                Dim d As New DAO
                Dim ds As New Data.DataSet

                SqlDataSource1.InsertParameters("T_Name").DefaultValue = t_name.Text
                SqlDataSource1.InsertParameters("User_Name").DefaultValue = uname.Text
                SqlDataSource1.InsertParameters("Password").DefaultValue = Password.Text
                SqlDataSource1.Insert()

            Else
                SqlDataSource1.UpdateParameters("T_ID").DefaultValue = T_ID.Value
                SqlDataSource1.UpdateParameters("T_Name").DefaultValue = t_name.Text
                SqlDataSource1.UpdateParameters("User_Name").DefaultValue = uname.Text
                SqlDataSource1.UpdateParameters("Password").DefaultValue = Password.Text
                SqlDataSource1.Update()
                T_ID.Value = ""
                t_name.Focus()
            End If
            clearall()
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Private Sub clearall()
        T_ID.Value = ""
        t_name.Text = ""
        uname.Text = ""
        Password.Text = ""
    End Sub
    Private Sub btn_Clr_Click(sender As Object, e As EventArgs) Handles btn_Clr.Click
        clearall()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If

        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            SqlDataSource1.SelectCommand = "SELECT * FROM [Teacher] WHERE [T_ID] = @T_ID"
            SqlDataSource1.SelectParameters.Add("T_ID", Session("T_Id"))
        End If

    End Sub
    Public Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        T_ID.Value = Convert.ToInt32(GridView1.DataKeys(index).Values("T_ID"))
        t_name.Text = GridView1.Rows(index).Cells(1).Text
        uname.Text = GridView1.Rows(index).Cells(2).Text
        Password.Text = GridView1.Rows(index).Cells(3).Text
        Session("Flag") = 1
        t_name.Focus()
    End Sub
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub
    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "delete1" Then
            SqlDataSource1.DeleteParameters("T_ID").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            GridView1.DataBind()
        End If
    End Sub
End Class
