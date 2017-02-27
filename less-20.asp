<!--#include file="config.asp"-->
<%
    If Request.Cookies("username") = "" Then
        Response.Write("<form action='less-20.asp' name='form1' method='post'>")
        Response.Write("Username: <input type='text' name='username' />")
        Response.Write("<br />")
        Response.Write("Password: <input type='password' name='password' />")
        Response.Write("<br />")
        Response.Write("<input type='submit' name='submit' value='submit' />")
        Response.Write("</form>")

        'On Error Resume Next
        Dim username, password
        username = Request.Form("username")
        password = Request.Form("password")
        If username <> "" And password <> "" Then
            username = Replace(username, "'", "''")
            password = Replace(password, "'", "''")

            Dim cmd, cmd_str, sql_str
            Set cmd=Server.CreateObject("ADODB.Command")
            cmd.ActiveConnection=conn
            sql_str = "select username, password from users where username='" & username & "' and password='" & password & "'"
            cmd.CommandText=sql_str

            Dim rs
            Set rs=cmd.Execute

            'If Err.Number <> 0 Then
                'Response.Write(Err.Description)
                'Response.End()
            If rs.BOF = False And rs.EOF = False Then
                Response.Cookies("username") = rs("username")
                Response.Cookies("username").Expires = DateAdd("h", 1, Now())
                Response.Write("<script>alert('The cookie has been set')</script>")
                Response.Redirect("less-20.asp")
            Else
                Response.Write(Err.Description)
                Response.Write("<br />Login Attempt Failed")
            End If
        End If
    Else
        If Request.Form("submit") = "" Then
            On Error Resume Next
            Dim cookie
            cookie = Request.Cookies("username")

            Set cmd=Server.CreateObject("ADODB.Command")
            cmd.ActiveConnection=conn
            sql_str = "select * from users where username='" & cookie & "'"
            cmd.CommandText=sql_str

            Set rs=cmd.Execute

            If Err.Number <> 0 Then
                Response.Write(Err.Description)
                Response.Write("<br />Login Attempt Failed")
            ElseIf rs.BOF = False And rs.EOF = False Then
                Response.Write("Your Login name:" & rs("username") & "<br />")
                Response.Write("Your Password:" & rs("password") & "<br />")
                Response.Write("Your Id:" & rs("id") & "<br />")
            Else
                Response.Write("Bug off you Silly Dumb hacker")
            End If

            Response.Write("<form action='less-20.asp' name='form1' method='post'>")
            Response.Write("<input type='submit' name='submit' value='Delete Your Cookie!' />")
            Response.Write("</form>")
        Else
            Response.Cookies("username").Expires = DateAdd("h", -1, Now())
            Response.Write("<script>alert('The cookie has been deleted')</script>")
            Response.Redirect("less-20.asp")
        End If
    End If
%>