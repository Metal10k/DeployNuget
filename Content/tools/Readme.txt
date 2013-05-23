The install and uninstall scripts supplied by the DeployNuget.ContentScripts allow content to be pushed to a project without referencing the files, thus automatically excluding them from source control.

Simply add your files to a folder ContentUnreferenced. These will be picked up and redirected by the powershell script


In your nuspec file add the following lines to use the install and uninstall scripts

<files>
    <file src="..\tools\Install.ps1" target="\tools\Install.ps1" />
    <file src="..\tools\Uninstall.ps1" target="\tools\Uninstall.ps1" />
</files>





Examples


<file src="..\MyFileToDeployAsHiddenContent.file" target="\ContentUnreferenced\MyFileToDeployAsHiddenContent.file" />
Will create new file in 
MyProject\MyFileToDeployAsHiddenContent.file

<file src="..\MyFileToDeployAsHiddenContent.file" target="\ContentUnreferenced\Subfolder\MyFileToDeployAsHiddenContent.file" />
Will create new file in 
MyProject\Subfolder\MyFileToDeployAsHiddenContent.file