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
                        <h1>Install SQLi-Labs</h1>
                        <p class="lead">Let's install the MSSQL SQLi-Labs</p>
                        <p><a class="btn btn-lg btn-success" href="less-1.asp" role="button">Go to inject</a></p>
                    </div>

                    <dir class="alert alert-info" role="alert">
                    <!--#include file="config.asp"-->
                    <%
                    Dim cmd, cmd_str
                    Set cmd = Server.CreateObject("ADODB.Command")
                    cmd.ActiveConnection=conn
                    sql_str = "select * from sysobjects where id = object_id(N'users')"
                    cmd.CommandText = sql_str

                    Dim rs
                    Set rs = cmd.Execute
                    If rs.BOF = False And rs.EOF = False Then
                        Response.Write("The database is existed!")
                    Else
                        sql_str = "CREATE TABLE users ( id int IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED, username varchar(20) NOT NULL, password varchar(20) NOT NULL )"
                        cmd.CommandText = sql_str                   

                        Set rs = cmd.Execute
                        Response.Write("Create new table 'users' successfully!<br />")                  

                        sql_str = "CREATE TABLE emails ( id int IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED, email_id varchar(30) NOT NULL )"
                        cmd.CommandText = sql_str
                        Set rs = cmd.Execute
                        Response.Write("Create new table 'emails' successfully!<br />")                 

                        sql_str = "CREATE TABLE uagents ( id int IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED, uagent varchar(256) NOT NULL, ip_address varchar(35) NOT NULL, username varchar(20) NOT NULL )"
                        cmd.CommandText = sql_str
                        Set rs = cmd.Execute
                        Response.Write("Create new table 'uagents' successfully!<br />")                    

                        sql_str = "CREATE TABLE referers ( id int IDENTITY(1,1) NOT NULL PRIMARY KEY CLUSTERED, referer varchar(256) NOT NULL, ip_address varchar(35) NOT NULL )"
                        cmd.CommandText = sql_str
                        Set rs = cmd.Execute
                        Response.Write("Create new table 'referers' successfully!<br />")
                     
                        Dim users_data, users_data_array, data
                        users_data = "('Dumb', 'Dumb');('Angelina', 'I-kill-you');('Dummy', 'p@ssword');('secure', 'crappy');('stupid', 'stupidity');('superman', 'genious');('batman', 'mob!le');('admin', 'admin');('admin1', 'admin1');('admin2', 'admin2');('admin3', 'admin3');('dhakkan', 'dumbo');('admin4', 'admin4')"
                        users_data_array = Split(users_data, ";", -1)
                        For Each data In users_data_array
                            sql_str = "INSERT INTO users (username, password) VALUES " & data
                            cmd.CommandText = sql_str
                            Set rs = cmd.Execute
                        Next
                        Response.Write("Insert into table 'users' successfully!<br />")                 

                        Dim emails_data, emails_data_array
                        emails_data = "('Dumb@dhakkan.com');('Angel@iloveu.com');('Dummy@dhakkan.local');('secure@dhakkan.local');('stupid@dhakkan.local');('superman@dhakkan.local');('batman@dhakkan.local');('admin@dhakkan.com')"
                        emails_data_array = Split(emails_data, ";", -1)
                        For Each data In emails_data_array
                            sql_str = "INSERT INTO emails (email_id) VALUES " & data
                            cmd.CommandText = sql_str
                            Set rs = cmd.Execute
                        Next
                        Response.Write("Insert into table 'emails' successfully!<br />")
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