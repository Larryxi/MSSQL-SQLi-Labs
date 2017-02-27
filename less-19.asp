<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="gbk">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MSSQL SQLi Labs</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <style type="text/css">
            body {
                padding-top: 70px; 
                text-align: center;
            }
            form {
                text-align: left;
            }
        </style>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">MSSQL SQLi Labs</a>
                </div>

                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="index.asp">Index</a></li>
                    <li><a href="install.asp">Install</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="row">

                <div class="col-sm-2">
                    <div class="list-group">
                        <a class="list-group-item" href="less-1.asp">Less-1</a>
                        <a class="list-group-item" href="less-2.asp">Less-2</a>
                        <a class="list-group-item" href="less-3.asp">Less-3</a>
                        <a class="list-group-item" href="less-4.asp">Less-4</a>
                        <a class="list-group-item" href="less-5.asp">Less-5</a>
                        <a class="list-group-item" href="less-6.asp">Less-6</a>
                        <a class="list-group-item" href="less-7.asp">Less-7</a>
                        <a class="list-group-item" href="less-8.asp">Less-8</a>
                        <a class="list-group-item" href="less-9.asp">Less-9</a>
                        <a class="list-group-item" href="less-10.asp">Less-10</a>
                    </div>
                </div>

                <div class="col-sm-8">
                    <div class="jumbotron">
                        <h1>Less-19</h1>
                        <p class="lead">Header Injection - Referer - Stack - String</p>
                    </div>

                    <div class="row">
                        <form class="form-horizontal" role="form" action="less-19.asp" name="form1" method="post">
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">Username</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                                </div>
                            </div>                      

                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                                </div>
                            </div>                      

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <dir class="alert alert-info" role="alert">
                        <!--#include file="config.asp"-->
                        <%
                            On Error Resume Next
                            Dim username, password, uagent, ip
                            username = Request.Form("username")
                            password = Request.Form("password")
                            uagent = Request.ServerVariables("HTTP_REFERER")
                            ip = Request.ServerVariables("Remote_Addr")
                            Response.Write("Your IP ADDRESS is: " & ip)                     

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
                                    sql_str = "insert into referers (referer, ip_address) values ('" & uagent & "', '" & ip & "')"
                                    cmd.CommandText=sql_str
                                    Set rs=cmd.Execute                      

                                    Response.Write("<br />Your Referer is: " & uagent)                      

                                    If Err.Number <> 0 Then
                                        Response.Write(Err.Description)
                                    End If                      

                                    Response.Write("<br />Successfully logged in")
                                Else
                                    Response.Write(Err.Description)
                                    Response.Write("<br />Login Attempt Failed")
                                End If
                            End If
                        %>
                    </dir>
                </div>  

                <div class="col-sm-2">
                    <div class="list-group">
                        <a class="list-group-item" href="less-11.asp">Less-11</a>
                        <a class="list-group-item" href="less-12.asp">Less-12</a>
                        <a class="list-group-item" href="less-13.asp">Less-13</a>
                        <a class="list-group-item" href="less-14.asp">Less-14</a>
                        <a class="list-group-item" href="less-15.asp">Less-15</a>
                        <a class="list-group-item" href="less-16.asp">Less-16</a>
                        <a class="list-group-item" href="less-17.asp">Less-17</a>
                        <a class="list-group-item" href="less-18.asp">Less-18</a>
                        <a class="list-group-item" href="less-19.asp">Less-19</a>
                        <a class="list-group-item" href="less-20.asp">Less-20</a>
                    </div>
                </div>  
            </div>
        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="jquery/1.11.1/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>



