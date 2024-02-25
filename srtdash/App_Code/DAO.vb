Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports System.Net.Mail
Public Class DAO
    Private con As New SqlClient.SqlConnection

    Public Sub New()
        con = New SqlConnection("Data Source=192.168.1.8;Initial Catalog=Metronome;User ID=abhi;Password=123456")
        Try
            con.Open()
            con.Close()
        Catch ex As Exception
            MsgBox("Please Check Database Connectivity")
        End Try
    End Sub

    Public Sub send_mail(send_email As String, msg As String)
        Dim from, pass, to_user, msg_part As String
        'information for sending mail
        Dim message As MailMessage = New MailMessage
        to_user = send_email
        from = "tfgpghanshyam@gmail.com"
        pass = "rflswtkgrrryovku"
        msg_part = msg

        message.To.Add(New MailAddress(send_email))
        message.From = New MailAddress(from)
        message.Body = msg_part
        message.Subject = "code for resseting password"

        'smtp protocol
        Dim smtp As New SmtpClient
        smtp.Host = "smtp.gmail.com"
        smtp.EnableSsl = True
        smtp.Port = 587
        'smtp.DeliveryMethod = smtp.DeliveryMethod.Network
        smtp.Credentials = New System.Net.NetworkCredential(from, pass)
        smtp.Send(message)
    End Sub
    Public Function getdata(ByVal str As String) As SqlDataReader
        Dim obj As SqlDataReader
        Dim cmd As New SqlCommand(str, con)
        con.Open()
        obj = cmd.ExecuteReader
        Return obj
    End Function
    Public Sub close_conn()
        If con.State = ConnectionState.Open Then
            con.Close()
        End If
    End Sub
    Public Function loaddata(ByVal str As String) As Data.DataSet
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(str, con)
        con.Open()
        da.SelectCommand.ExecuteReader()
        con.Close()
        da.Fill(ds)
        Return ds
    End Function
    Public Function validate(ByVal str As String) As Integer
        Dim f As Integer = 0
        Dim obj As SqlDataReader
        obj = getdata(str)
        While obj.Read
            f = 1
        End While
        con.Close()
        Return f
    End Function
    Public Sub ModifyData(ByVal str As String)

        Dim cmd As New SqlCommand(str, con)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class

