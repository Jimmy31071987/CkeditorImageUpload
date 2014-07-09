<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Explorer.aspx.cs" Inherits="MyCKEditor.Explorer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Manager</title>
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <script src="scripts/purl.js" type="text/javascript"></script>
    <script>
        $(function () {
            UploadFolder = $('.UploadFolder').val();
        });
    </script>
    <script src="scripts/jquery.ui.core.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.selectable.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.contextmenu.r2.packed.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.button.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.ui.dialog.min.js" type="text/javascript"></script>
    <script src="scripts/engine.js" type="text/javascript"></script>
    <link href="scripts/jquery.ui.theme.css" rel="stylesheet" type="text/css" />
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h4 id="h41">Upload new file</h4>
    <div id="colUpload">
        <iframe id="iframeUpload" src="ExplorerUploads.aspx?id=<% =Request["id"] %>" frameborder="0"></iframe>
    </div>

    <h4 id="h42">Select an exsiting file</h4>
    <div id="colExplorer">
        <div id="thumbs"></div>
        <div id="resizeImage" title="Resize Image" style="display: none">
            <input type="hidden" class="resizePath" value="" />
            <input type="hidden" class="UploadFolder" value="" runat="server" id="UploadFolder" />
        </div>
    </div>
    <div class="contextMenu" id="fileMenu">
        <ul>
            <li id="delete">
                <img src="img/delete.png" />
                Delete</li>
        </ul>
    </div>
    <div class="contextMenu" id="imgMenu">
        <ul>
            <li id="delete">
                <img src="img/delete.png" />
                Delete</li>
        </ul>
    </div>
</body>
</html>
