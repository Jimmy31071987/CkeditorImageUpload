var lastPath = null;
var currentImg = null;

// Event that repositions the layers when resizing the window
function resizeWindow() {
    $('#colUpload').css("width", ($(window).width() - 80) + "px");
    $('#colExplorer').css("height", $(window).height() - 112 + "px");  
    $('#colExplorer').css("width", ($(window).width() - 80) + "px");
}

// Initialization. We generate the tree and control the change event window size
$(document).ready(function () {
    resizeWindow();
    window.onresize = resizeWindow;   
   
    UploadFolder = UploadFolder + "|" + $.url().param('id');   
    loadFiles(UploadFolder)
});

function refreshThumbsDelayed() {
    setTimeout(refreshThumbs, 500);
}

function refreshThumbs() {
    loadFiles(lastPath);
}

// Event launched when a directory tree is selected
function loadFiles(currentPath) {
    lastPath = currentPath;

    $("#iframeUpload").contents().find("input[type=text]").val(currentPath);

    $('#thumbs').html("<div class='thumbsLoader'><p>Searching for files ...<p><img src='/img/ajax-loader.gif' /></div>");

    $.ajax({
        url: 'ExplorerEngine.aspx',
        data: "action=getfiles&dir=" + currentPath,
        dataType: "json",
        cache: false,
        success: showFiles
    });
    currentImg = null;
}

// Displays the files received
function showFiles(data) {
    var html = "";
    for (var i = 0; i < data.length; i++) {
        var fileData = data[i];
        html += GenerateFileHTML(fileData);
    }
    $('#thumbs').html(html).selectable({
        filter: 'div.thumb',
        selected: function (event, ui) {
            currentImg = $(ui.selected).attr("file").replaceAll("\\", "/");
            sendFileToCKEditor(currentImg);
        }
    });
    createFileContextMenu();
}

String.prototype.replaceAll = function (toReplace, txtReplace) {
    var temp = this;
    var temp2 = this;
    do {
        temp2 = temp;
        temp = temp2.replace(toReplace, txtReplace);
    } while (temp != temp2);
    return temp;
}

// Generates an HTML file
function GenerateFileHTML(fileData) {
    var html = "<div ext='" + getFileExtension(fileData.FileName) + "' class='thumb' file='" + fileData.RelativePath + "'>" +
               "    <div class='thumb_image'><img src='" + fileData.RelativeThumbPath + "' /></div>" +
               "    <span class='thumb_name'>" + fileData.FileName + "</span>" +
               "    <span class='thumb_size'>" + fileData.KB + " KB</span>" +
               "</div>";
    return html;
}

function createFileContextMenu() {
    $('div.thumb[ext!=jpg][ext!=JPG][ext!=bmp][ext!=BMP][ext!=gif][ext!=GIF][ext!=png][ext!=PNG]').contextMenu("fileMenu", {
        menuStyle: {
            listStyle: 'none',
            padding: '1px',
            margin: '0px',
            backgroundColor: '#fff',
            border: '1px solid #999',
            width: '120px',
            fontSize: '10px'
        },
        itemStyle: {
            margin: '0px',
            color: '#000',
            display: 'block',
            cursor: 'default',
            padding: '3px',
            border: '1px solid #fff',
            backgroundColor: 'transparent',
            fontSize: '10px'
        },
        itemHoverStyle: {
            border: '1px solid #0a246a',
            backgroundColor: '#b6bdd2'
        },
        bindings: {
            'delete': function (t) {
                var file = $(t).attr("file");
                if (confirm("Are you sure you want to delete this file?")) {
                    $.ajax({
                        url: 'ExplorerEngine.aspx',
                        data: "action=delete&file=" + file,
                        dataType: "json",
                        cache: false,
                        success: refreshThumbsDelayed
                    });
                }
            },
            'open': function (t) {
                var file = $(t).attr("file");
                window.open(file, "img");
            }
        }
    });
    
    $('div.thumb[ext=jpg],div.thumb[ext=JPG],div.thumb[ext=bmp],div.thumb[ext=BMP],div.thumb[ext=png],div.thumb[ext=PNG],div.thumb[ext=gif],div.thumb[ext=GIF]').contextMenu("imgMenu", {
        menuStyle: {
            listStyle: 'none',
            padding: '1px',
            margin: '0px',
            backgroundColor: '#fff',
            border: '1px solid #999',
            width: '120px',
            fontSize: '10px'
        },
        itemStyle: {
            margin: '0px',
            color: '#000',
            display: 'block',
            cursor: 'default',
            padding: '3px',
            border: '1px solid #fff',
            backgroundColor: 'transparent',
            fontSize: '10px'
        },
        itemHoverStyle: {
            border: '1px solid #0a246a',
            backgroundColor: '#b6bdd2'
        },
        bindings: {
            'delete': function (t) {
                var file = $(t).attr("file");
                if (confirm("Are you sure you want to delete this file?")) {
                    $.ajax({
                        url: 'ExplorerEngine.aspx',
                        data: "action=delete&file=" + file,
                        dataType: "json",
                        cache: false,
                        success: refreshThumbsDelayed
                    });
                }
            },
            'open': function (t) {
                var file = $(t).attr("file");
                window.open(file, "img");

            }
        }
    });
}

function getImageSize(data) {
    $('.resizeTamanioActual').html(data);
}

function getFileDirectory(filePath) {
    filePath = filePath.replaceAll("\\", "/");
    return filePath.substring(0, filePath.lastIndexOf('/'));
}

function getFileExtension(filePath) {
    return filePath.substring(filePath.lastIndexOf('.') + 1);
}

/* Integration with CKEditor */

function sendFileToCKEditor(fileUrl) {
    var funcNum = getUrlParam('CKEditorFuncNum');
    if (funcNum != null) {
        if (confirm("Do you want to select this file?")) {
            window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
            window.close();
        }
    }
}

// Helper function to get parameters from the query string.
function getUrlParam(paramName) {
    var reParam = new RegExp('(?:[\?&]|&amp;)' + paramName + '=([^&]+)', 'i');
    var match = window.location.search.match(reParam);
    return (match && match.length > 1) ? match[1] : null;
}
