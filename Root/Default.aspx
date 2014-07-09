<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.0.min.js"></script>
    <script src="MyCKEditor/MyCKEditor.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <CKEditor:CKEditorControl ID="CKEditor" BasePath="ckeditor" runat="server" Height="200px" CssClass="MyCKEditor"></CKEditor:CKEditorControl>
        </div>
    </form>
</body>
</html>
