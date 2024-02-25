
Partial Class Student
    Inherits System.Web.UI.Page

    Private Sub btn_Save_Click(sender As Object, e As EventArgs) Handles btn_Save.Click
        Try

            If Session("Flag") = 0 Then

                Dim d As New DAO
                Dim ds As New Data.DataSet

                SqlDataSource1.InsertParameters("Stu_Name").DefaultValue = stu_name.Text
                SqlDataSource1.InsertParameters("Stu_Enroll").DefaultValue = stu_enroll.Text
                SqlDataSource1.InsertParameters("Stu_Sem").DefaultValue = stu_sem.Text
                SqlDataSource1.InsertParameters("Password").DefaultValue = stu_pass.Text
                SqlDataSource1.Insert()

            Else
                SqlDataSource1.UpdateParameters("Stu_ID").DefaultValue = Stu_ID.Value
                SqlDataSource1.UpdateParameters("Stu_Name").DefaultValue = stu_name.Text
                SqlDataSource1.UpdateParameters("Stu_Enroll").DefaultValue = stu_enroll.Text
                SqlDataSource1.UpdateParameters("Stu_Sem").DefaultValue = stu_sem.Text
                SqlDataSource1.UpdateParameters("Password").DefaultValue = stu_pass.Text
                SqlDataSource1.Update()
                Stu_ID.Value = ""
                stu_name.Focus()
            End If
            clearall()
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Private Sub clearall()
        Stu_ID.Value = ""
        stu_name.Text = ""
        stu_enroll.Text = ""
        stu_sem.Text = ""
        stu_pass.Text = ""
    End Sub
    Private Sub btn_Clear_Click(sender As Object, e As EventArgs) Handles btn_Clear.Click
        clearall()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            SqlDataSource1.SelectCommand = "SELECT * FROM [Student] WHERE [Stu_ID] = @Stu_ID"
            SqlDataSource1.SelectParameters.Add("Stu_ID", Session("S_Id"))
        End If


    End Sub
    Public Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        Stu_ID.Value = Convert.ToInt32(GridView1.DataKeys(index).Values("Stu_ID"))
        stu_name.Text = GridView1.Rows(index).Cells(1).Text
        stu_enroll.Text = GridView1.Rows(index).Cells(2).Text
        stu_sem.Text = GridView1.Rows(index).Cells(3).Text
        stu_pass.Text = GridView1.Rows(index).Cells(4).Text
        Session("Flag") = 1
        stu_name.Focus()
    End Sub
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub
    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "delete1" Then
            SqlDataSource1.DeleteParameters("Stu_ID").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            GridView1.DataBind()
        End If
    End Sub
End Class
