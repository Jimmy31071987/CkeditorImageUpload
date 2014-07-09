<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExplorerUploads.aspx.cs" Inherits="MyCKEditor.ExplorerUploads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        html, body {
            margin: 10px;
            height: 100%;
            font-family: Verdana;
            overflow: hidden;
            background-color: #eee;
        }

        label, input {
            float: left;
            margin-left: 10px;
            font-size: 11px;
            display: block;
            height: 20px;
        }

        label {
            line-height: 20px;
        }

        input {
            background-color: #fff;
        }

        .hidden {
            display: none;
        }

        .AddButton {
            padding: 0px 10px 0px 10px;
            font-weight: bold;
        }

        span.error {
            font-size: 9px;
            margin-left: 20px;
        }
    </style>
    <script src="scripts/jquery.js" type="text/javascript"></script>
    <script src="scripts/purl.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".AddButton").click(function (e) {
                var FileType = $.url().param('id').toLowerCase();
                var filename = $(".FileUpload").val();

                if (filename == "") {
                    return;
                }

                var extension = filename.replace(/^.*\./, '');
                if (extension == filename) {
                    extension = '';
                } else {
                    extension = extension.toLowerCase();
                }

                if (FileType == "img") {

                    switch (extension) {
                        case 'jpg':
                        case 'jpeg':
                        case 'png':
                        case 'bmp':
                        case 'gif':
                            return true;

                        default:
                            alert('Please upload an image only!');
                            e.preventDefault();
                    }

                }
                else if (FileType == "files") {
                    switch (extension) {
                        case 'jpg':
                        case 'jpeg':
                        case 'png':
                        case 'bmp':
                        case 'gif':
                            alert('Please upload a file not an image!');
                            e.preventDefault();

                        default:
                            return true;
                    }
                }
                else {
                    alert('Invalid URL!');
                    e.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding-bottom: 10px;">
            <asp:TextBox CssClass="hidden" runat="server" ID="dir" Text=""></asp:TextBox>
            <label>Select New File</label>
            <asp:FileUpload runat="server" ID="fu" CssClass="FileUpload" />
            <asp:Button runat="server" Text="Upload File" CssClass="AddButton" />
            <asp:RequiredFieldValidator CssClass="error" Display="Dynamic" runat="server" ControlToValidate="fu" ErrorMessage="Please select a file"></asp:RequiredFieldValidator>
        </div>
    </form>
</body>
</html>
