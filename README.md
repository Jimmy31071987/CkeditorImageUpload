CkeditorImageUpload
===================
1) Add Reference to MyCKEditor.dll; Add Reference to CKEditor.dll

2) Add MyCKEditor folder to your solution

3) Define the folder path where you want to save your uploaded files and images:
								MyCKEditor.UploadFolder MyCKEditor = new MyCKEditor.UploadFolder();
								MyCKEditor.SetPath = "MyCKEditor/Uploads";									// You can use any path  
								 
4) Add the following scripts to your page or master page:
								<script src="Scripts/jquery-2.1.0.min.js"></script>							// Replace with any version
								<script src="MyCKEditor/MyCKEditor.js"></script>

5) define the cssclass for your ckeditor:
								<CKEditor:CKEditorControl CssClass="MyCKEditor" ...							// don't change the classname
