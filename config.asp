<%
    Dim driver_name, server_type, db_username, db_password, db_name
    driver_name = "SQL Server"
    server_type = "local"
    db_username = "sa"
    db_password = ""
    db_name = "test"

    Dim conn, con_str
    Set conn = Server.CreateObject("ADODB.Connection")
    con_str = "Driver={" & driver_name & "};server=(" & server_type & ");uid=" & db_username & ";pwd=" & db_password & ";database=" & db_name
    conn.Open(con_str)
%>