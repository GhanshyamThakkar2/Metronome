

Partial Class Subject
    Inherits System.Web.UI.Page

    Private Sub btn_Sub_Click(sender As Object, e As EventArgs) Handles btn_Sub.Click
        Try

            If Session("Flag") = 0 Then

                Dim d As New DAO
                Dim ds As New Data.DataSet

                SqlDataSource1.InsertParameters("Sub_Name").DefaultValue = subname.Text
                SqlDataSource1.InsertParameters("Sub_Code").DefaultValue = Sub_Code.Text
                SqlDataSource1.Insert()

            Else
                SqlDataSource1.UpdateParameters("Sub_ID").DefaultValue = Sub_ID.Value
                SqlDataSource1.UpdateParameters("Sub_Name").DefaultValue = subname.Text
                SqlDataSource1.UpdateParameters("Sub_Code").DefaultValue = Sub_Code.Text
                SqlDataSource1.Update()
                Sub_ID.Value = ""
                subname.Focus()
            End If
            clearall()
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Private Sub clearall()
        Sub_ID.Value = ""
        subname.Text = ""
        Sub_Code.Text = ""
    End Sub
    Private Sub btn_Clear_Click(sender As Object, e As EventArgs) Handles btn_Clear.Click
        clearall()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Public Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        Sub_ID.Value = Convert.ToInt32(GridView1.DataKeys(index).Values("Sub_ID"))
        subname.Text = GridView1.Rows(index).Cells(1).Text
        Sub_Code.Text = GridView1.Rows(index).Cells(2).Text
        Session("Flag") = 1
        subname.Focus()
    End Sub
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub
    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "delete1" Then
            SqlDataSource1.DeleteParameters("Sub_ID").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            GridView1.DataBind()
        End If
    End Sub
End Class
