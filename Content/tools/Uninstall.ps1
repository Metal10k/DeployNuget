param($installPath, $toolsPath, $package, $project)

function RemoveFromOutput([System.IO.DirectoryInfo]$currentDI, [System.IO.DirectoryInfo]$targetDI,[string] $relativeDirString)
{
	foreach($contentDirItem in $currentDI.GetDirectories())
	{
		Write-Output Enumerating subdirectory $contentDirItem.Name
		RemoveFromOutput $contentDirItem $targetDI ($relativeDirString + $contentDirItem.Name + "\")
	}
	
	foreach($contentDirFile in $currentDI.GetFiles())
	{
		$fullFileNameToCopyStr = $targetDI.FullName + $relativeDirString + $contentDirFile.Name
		
		$fullFileToCopyFI = New-Object System.IO.FileInfo $fullFileNameToCopyStr
		if($fullFileToCopyFI.Exists)
		{
			Write-Output Deleting $fullFileToCopyFI.FullName
			$fullFileToCopyFI.Delete()
		}
	}
}

$projectDir = (Get-Item $project.FullName).Directory

$ProjectDI = $projectDir
$InstallDI = (New-Object system.IO.DirectoryInfo $installPath)

$projectPath = $projectDir.Fullname

$installPathString = $InstallDI.FullName
$projectPathString = $ProjectDI.FullName

$ContentUnreferencedDI = [System.IO.DirectoryInfo]$InstallDI.GetDirectories("ContentUnreferenced")[0]

if($ContentUnreferencedDI -ne $null)
{
	RemoveFromOutput $ContentUnreferencedDI $ProjectDI "\"
}

